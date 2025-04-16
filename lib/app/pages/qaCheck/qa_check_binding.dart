
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/picking/picking_controller.dart';
import 'package:lsandroid/app/pages/qaCheck/qa_check_controller.dart';


class QaCheckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QaCheckController());
  }
}
