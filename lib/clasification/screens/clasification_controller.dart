import 'dart:io';

import 'package:get/get.dart';

class ClasifficationController extends GetxController {
  static ClasifficationController get to => Get.find();

  final stateClasification = 10.obs;

  final existResponse = false.obs;

  @override
  void onInit() {
    print('clasification');
  }

  final mainPhotoRx = Rx<File>();

  final mainPhotoRxPreview = "".obs;
}
