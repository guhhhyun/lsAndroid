
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_controller.dart';
import 'package:lsandroid/app/pages/etcIpgo/etc_ipgo_controller.dart';

class EtcIpgoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EtcIpgoController());
  }
}
