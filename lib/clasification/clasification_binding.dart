import 'package:get/get.dart';
import 'package:potatoes_test/clasification/screens/clasification_controller.dart';

class ClasificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClasifficationController>(() => ClasifficationController());
  }
}
