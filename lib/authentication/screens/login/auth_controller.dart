import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final idUser = "".obs;
  @override
  void onReady() {
    // TODO: implement onReady
    AuthController.to.idUser.value = "";
    super.onReady();
  }
}
