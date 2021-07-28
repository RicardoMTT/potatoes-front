import 'package:get/get.dart';
import 'package:potatoes_test/authentication/screens/login/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
