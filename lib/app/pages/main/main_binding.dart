

import 'package:lsandroid/app/pages/home/home_controller.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
   // Get.lazyPut(() => SettingController(), fenix: true);
  //  Get.lazyPut(() => FacilityController(), fenix: true);
   // Get.lazyPut(() => FacilityFirstController(),  fenix: true);
  }
}
