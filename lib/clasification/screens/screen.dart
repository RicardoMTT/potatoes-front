import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/image_picker_wrapper.dart';
import 'package:potatoes_test/clasification/screens/clasification_controller.dart';
import 'package:potatoes_test/clasification/widgets/card_image_plant.dart';
import 'package:potatoes_test/contacts/screens/screen.dart';
import 'package:potatoes_test/recommendations/screen.dart';

class ClasificationScreen extends StatelessWidget {
  const ClasificationScreen({Key key}) : super(key: key);

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
                        },
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => ClasifficationController.to.mainPhotoRx.value != null
                  ? FlatButton(
                      onPressed: () {
                        ClasifficationController.to.existResponse.value = true;
                      },
                      child: Text(
                        'Clasificar',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: kPrimaryColor,
                    )
                  : Container()),
              Text('Carge su imagen para analizar'),
              Obx(() => ClasifficationController.to.existResponse.value
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
                  : Container())
            ],
          ),
        ),
      ),
    );
  }
}
