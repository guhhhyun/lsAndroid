
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/inventoryCnt/inventory_cnt_controller.dart';

class InventoryCntBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventoryCntController());
  }
}
