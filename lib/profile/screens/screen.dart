import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:potatoes_test/app_constants/color.dart';
import 'package:potatoes_test/app_widgets/common_avatar.dart';
import 'package:potatoes_test/app_widgets/image_picker_wrapper.dart';
import 'package:potatoes_test/profile/profile_controller.dart';
import 'package:potatoes_test/profile/screens/screen2.dart';

import '../avatar_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    File _file;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 260,
                child: Stack(children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        // BoxShadow(
                        //   offset: Offset(0, 4),
                        //   blurRadius: 4,
                        //   color: Colors.black12,
                        // )
                      ],
                    ),
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text('Tarjeta'),
                        //       IconButton(icon: Icon(Icons.menu), onPressed: () {})
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Welcome back',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, top: 40),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Obx(() => Text(
                                      '${ProfileController.to.firstName.value} ${ProfileController.to.lastName.value}.',
                                      style: GoogleFonts.lato(
                                          color: Colors.white, fontSize: 20),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 210,
                      left: 160,
                      child: ImagePickerWrapper(
                        builder: (context, trigger) => InkWell(
                          onTap: () async {
                            _file = await trigger();
                            ProfileController.to.fileRx.value = _file;
                          },
                          child: Text(
                            'Cambiar foto',
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                        ),
                      )),
                  Positioned(
                    top: 110,
                    left: 30,
                    child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: HeadScreenButton()),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Prueba()

              // Expanded(
              //   child: GridView.count(
              //     crossAxisCount: 2,
              //     mainAxisSpacing: 20,
              //     crossAxisSpacing: 20,
              //     children: [
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       ),
              //       Container(
              //         height: 80,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //         decoration: BoxDecoration(
              //             color: kPrimaryColor,
              //             borderRadius: BorderRadius.circular(20.0)),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
