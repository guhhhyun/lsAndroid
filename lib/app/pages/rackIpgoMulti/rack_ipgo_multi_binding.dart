
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/rackIpgoMulti/rack_ipgo_multi_controller.dart';

class RackIpgoMultiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RackIpgoMultiController());
  }
}
