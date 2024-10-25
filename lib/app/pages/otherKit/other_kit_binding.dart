
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_controller.dart';

class OtherKitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherKitController());
  }
}
