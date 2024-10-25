import 'package:lsandroid/app/common/common_confirm_widget.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/common/home_widget.dart';
import 'package:lsandroid/app/common/utils.dart';
import 'package:lsandroid/app/net/home_api.dart';

import 'package:lsandroid/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isCheckBox = false.obs;
  var idTextController = TextEditingController();
  var pwTextController = TextEditingController();
  RxBool isLogin = false.obs;
  RxBool bLoading = false.obs;

  GlobalService gs = Get.find();

  // late PackageInfo packageInfo;
  RxString strersion = '0.0.0'.obs;


  void checkBoxBtnTrue() {
    isCheckBox.value = true;
    Get.log('아이디 저장!!!');
  }

  void checkBoxBtnFalse() {
    isCheckBox.value = false;
  }

  void btnLogin() async {
    Get.log('로그인 버튼 클릭');

    bLoading.value = true;

    var params = {
      'userId': idTextController.text,
      'userPw': pwTextController.text,
    };
    try {
      final retVal = await HomeApi.to.reqLogin(params);

      if (retVal != null) {
        if (retVal.resultCode == '0000') {
          Utils.showToast(msg: '로그인 되었습니다.');
          if (retVal.body != null) {
            Get.offAllNamed(Routes.MAIN);
          } else {
            // 토큰 데이터가 없다
            Utils.gErrorMessage('서버로부터 토큰값이 없습니다.');
          }
        } else {
          Get.log('실패');
        }
      } else {
        Get.log('로그인 실패');
        // Utils.gErrorMessage('아이디 및 패스워드가 틀립니다.', title: '인증');
        //
      }
    } catch (e) {
      Get.log('btnLogin catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
    }
  }




  @override
  void onClose() {
    Get.log('LoginController - onClose !!');
    super.onClose();
  }

  @override
  void onInit() async {
    Get.log('LoginController - onInit !!');

    super.onInit();
  }

  @override
  void onReady() {
    Get.log('LoginController - onReady !!');
    super.onReady();
    if (Get.arguments != null) {
      var msg = Get.arguments['msg'] ?? false;

      if (msg == true) {
        Utils.showToast(msg: '로그인이 필요한 서비스 입니다.');
      }
    }
  }
}
