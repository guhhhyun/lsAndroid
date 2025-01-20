
import 'package:lsandroid/app/common/global_service.dart';
import 'package:get/get.dart';

import '../../routes/app_route.dart';

class YellowSoundController extends GetxController {

  GlobalService gs = Get.find();
  @override
  void onInit() {
    super.onInit();
    Get.log('YellowSoundController- onInit');
  }

  @override
  void onClose() {
    Get.log('YellowSoundController - onClose');
    super.onClose();
  }

  @override
  void onReady() async {
    Get.log('YellowSoundController- onReady');

  }
}
