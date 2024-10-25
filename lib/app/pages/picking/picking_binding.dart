
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/picking/picking_controller.dart';


class PickingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickingController());
  }
}
