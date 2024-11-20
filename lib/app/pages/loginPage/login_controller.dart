import 'package:lsandroid/app/common/common_confirm_widget.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/common/home_widget.dart';
import 'package:lsandroid/app/common/utils.dart';
import 'package:lsandroid/app/net/home_api.dart';

import 'package:lsandroid/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

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
      'programId': 'A1020',
      'userId': idTextController.text,
      'userPw': pwTextController.text,
    };
    try {
      final retVal = await HomeApi.to.reqLogin(params);

      if (retVal != null) {
        if (retVal.resultCode == '0000') {
          if (retVal.body!.resCd == '0000') {
            Utils.showToast(msg: '로그인 되었습니다.');
            gs.loginList.value = retVal.body!.authorities!;
            gs.loginNm.value = retVal.body!.userName;
            Get.offAllNamed(Routes.MAIN);
          } else {
            // 토큰 데이터가 없다
            Utils.gErrorMessage('아이디/비밀번호를 다시 입력해주세요.');
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

  Future<void> requestBluetoothPermissions() async {
    // Bluetooth 권한 상태를 확인합니다.
    var scanStatus = await Permission.bluetoothScan.status;
    var connectStatus = await Permission.bluetoothConnect.status;

    // 권한이 허용되지 않은 경우 요청합니다.
    if (!scanStatus.isGranted) {
      await Permission.bluetoothScan.request();
    }

    if (!connectStatus.isGranted) {
      await Permission.bluetoothConnect.request();
    }

    // 광고 권한도 필요하면 추가
    var advertiseStatus = await Permission.bluetoothAdvertise.status;
    if (!advertiseStatus.isGranted) {
      await Permission.bluetoothAdvertise.request();
    }

    // 권한 상태를 다시 확인하여 필요한 경우 대응합니다.
    if (await Permission.bluetoothScan.isGranted &&
        await Permission.bluetoothConnect.isGranted &&
        await Permission.bluetoothAdvertise.isGranted) {
      print("Bluetooth 권한이 모두 허용되었습니다.");
    } else {
      print("Bluetooth 권한이 거부되었습니다.");
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
    requestBluetoothPermissions();
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
