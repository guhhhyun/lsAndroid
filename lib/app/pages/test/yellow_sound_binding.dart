import 'package:lsandroid/app/pages/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/test/yellow_sound_controller.dart';

class YellowSoundBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => YellowSoundController());
  }
}