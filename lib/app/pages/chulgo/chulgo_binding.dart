
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_controller.dart';

class ChulgoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChulgoController());
  }
}
