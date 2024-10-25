
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_controller.dart';

class SmallKitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmallKitController());
  }
}
