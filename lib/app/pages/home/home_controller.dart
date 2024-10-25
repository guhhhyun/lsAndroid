import 'dart:async';
import 'dart:convert';
import 'dart:developer';


import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/common/utils.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController with GetTickerProviderStateMixin {
  GlobalService gs = Get.find();

  RxBool isLoading = false.obs;
  RxList<dynamic> allList = [].obs;
  RxList<int> datasList = [0].obs;

/*
  Future<void> req() async {
    try{
      allList.clear();
      datasList.clear();
      isLoading.value = true;
      var a = await HomeApi.to.PROC("USP_MBR0000_R01", {"@p_WORK_TYPE":"MENU","@p_USER_ID":Utils.getStorage.read('userId')}).then((value) =>
      {
        allList.value = value['DATAS'],
        for(var i = 0; i < allList.length; i++) {
          datasList.add(value['DATAS'][i]['SORT_SEQ']),
        }
      });
      Get.log('권한 조회::::::::: ${datasList.value}');
      Get.log('권한 조회::::::::: ${datasList.contains(300)}');
    }catch(err) {
      Get.log('USP_MBR0000_R01 err = ${err.toString()} ', isError: true);
    //  Utils.gErrorMessage('네트워크 오류');
    }finally{
      isLoading.value = false;
    }

  }
*/



  @override
  void onInit() async{
  //  userLeft();
  //  reqNoticeList();
  //  reqListAlarm();
  }

  @override
  void onClose() {}

  @override
  void onReady() async{
  }
}
