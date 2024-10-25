

import 'package:lsandroid/app/pages/Ipgo/ipgo_controller.dart';
import 'package:get/get.dart';

class IpgoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IpgoController());
  }
}
