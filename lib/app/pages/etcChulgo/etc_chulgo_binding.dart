
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/etcChulgo/etc_chulgo_controller.dart';

class EtcChulgoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EtcChulgoController());
  }
}
