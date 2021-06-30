import 'package:get/get.dart';
import 'package:potatoes_test/app_routing/routes.dart';
import 'package:potatoes_test/app_utils/time.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() async {
    _init();
    super.onReady();
  }

  void _init() async {
    await sleep(1000);
    Get.offAllNamed(AppRoutes.login);
  }
}
