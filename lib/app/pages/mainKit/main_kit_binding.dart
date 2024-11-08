import 'package:get/get.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_controller.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_controller.dart';

class MainKitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainKitController());
  }
}
