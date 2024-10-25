

import 'package:lsandroid/app/pages/Ipgo/ipgo_controller.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_controller.dart';

class RackIpgoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RackIpgoController());
  }
}
