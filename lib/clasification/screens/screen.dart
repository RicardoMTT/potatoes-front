import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/common_error_dialog.dart';
import 'package:potatoes_test/app_widgets/common_success_dialog.dart';
import 'package:potatoes_test/app_widgets/image_picker_wrapper.dart';
import 'package:potatoes_test/app_widgets/loading_dialog.dart';
import 'package:potatoes_test/clasification/contacts/screens/screen.dart';
import 'package:potatoes_test/clasification/recommendations/screen.dart';
import 'package:potatoes_test/clasification/screens/clasification_controller.dart';
import 'package:potatoes_test/clasification/widgets/card_image_plant.dart';
import 'package:tflite/tflite.dart';

class ClasificationScreen extends StatefulWidget {
  const ClasificationScreen({Key key}) : super(key: key);

  @override
  _ClasificationScreenState createState() => _ClasificationScreenState();
}

class _ClasificationScreenState extends State<ClasificationScreen> {
  File _image;
  final picker = ImagePicker();
  List _salida;
  bool _estado = false;

  @override
  void initState() {
    loadModel();

    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    print('pickedFile $pickedFile');
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    print("CLASFICAR");
    clasifyImage(pickedFile);
  }

  clasifyImage(image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    print('output $output');
    ClasifficationController.to.stateClasification.value = output[0]['index'];

    setState(() {
      _salida = output;
      _estado = true;
    });
    if (output[0]['index'] == 2) {
      await CommonErrorDialog.show(
          messageText: 'Tardio', acceptText: 'Aceptar');
    } else if (output[0]['index'] == 1) {
      await CommonSuccessDialog.show(
          messageText: 'Saludable', acceptText: 'Aceptar');
    } else {
      await CommonErrorDialog.show(
          messageText: 'Saludable', acceptText: 'Aceptar');
    }
  }

  loadModel() async {
    try {
      String res = await Tflite.loadModel(
          model: "assets/model_unquant.tflite",
          labels: "assets/labels.txt",
          numThreads: 1, // defaults to 1
          isAsset:
              true, // defaults to true, set to false to load resources outside assets
          useGpuDelegate:
              false // defaults to false, set to true to use GPU delegate
          );
    } catch (e) {
      print("ERROR $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    File _file;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Clasificador de enfermedades'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => ClasifficationController.to.mainPhotoRx.value == null
                    ? ImagePickerWrapper(
                        builder: (context, trigger) => InkWell(
                          onTap: () async {
                            _file = await trigger();
                            print("_file $_file");

                            ClasifficationController.to.mainPhotoRx.value =
                                _file;
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: kBrownColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Icon(
                              Icons.upload_sharp,
                              size: 90,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : CardImagePlant(
                        image: ClasifficationController.to.mainPhotoRx.value,
                        press: () {
                          ClasifficationController.to.mainPhotoRx.value = null;
                          ClasifficationController.to.stateClasification.value =
                              null;
                        },
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => ClasifficationController.to.mainPhotoRx.value != null
                  ? FlatButton(
                      onPressed: () async {
                        setState(() {
                          if (_file != null) {
                            _image = File(_file.path);
                          } else {
                            print('No image selected.');
                          }
                        });
                        LoadingDialog.show();

                        await Future.delayed(Duration(seconds: 2));
                        LoadingDialog.hide();
                        clasifyImage(_file);
                        ClasifficationController.to.existResponse.value = true;
                      },
                      child: Text(
                        'Clasificar',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: kPrimaryColor,
                    )
                  : Container()),
              // FlatButton(
              //     onPressed: () {
              //       this.getImage();
              //     },
              //     child: Text('clasificar')),
              Text(
                  'Carge su imagen para analizar ${ClasifficationController.to.stateClasification.value}'),
              Obx(() =>
                  ClasifficationController.to.stateClasification.value == 1 &&
                          ClasifficationController.to.mainPhotoRx.value != null
                      ? Container(
                          child: Text('Saludable '),
                        )
                      : Container()),
              Obx(() => (ClasifficationController.to.stateClasification.value ==
                              0 ||
                          ClasifficationController
                                  .to.stateClasification.value ==
                              2) &&
                      (ClasifficationController.to.mainPhotoRx.value != null)
                  ? Column(
                      children: [
                        Card(
                          elevation: 0,
                          child: RaisedButton(
                            onPressed: () {
                              Get.to(ContactWidget());
                            },
                            child: Text('Contactar con profesional'),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: RaisedButton(
                            onPressed: () {
                              Get.to(RecomendationScreen());
                            },
                            child: Text('Ver recomendaciones'),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      child: Text('No hay enfermedades'),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
