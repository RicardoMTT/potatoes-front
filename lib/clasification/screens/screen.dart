import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/image_picker_wrapper.dart';
import 'package:potatoes_test/contacts/screens/screen.dart';

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
              ImagePickerWrapper(
                builder: (context, trigger) => InkWell(
                  onTap: () async {
                    _file = await trigger();
                    print("_file $_file");
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(
                      Icons.upload_sharp,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Carge su imagen para analizar'),
              Card(
                elevation: 0,
                child: RaisedButton(
                  onPressed: () {
                    Get.to(ContactWidget());
                  },
                  child: Text('Llamar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
