

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class RackIpgoMultiController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();

  var textQrMultiController = TextEditingController();
  var textStatusController = TextEditingController();
  var textZoneController = TextEditingController();
  var textLocMultiController = TextEditingController();
 // var textZoneController2 = TextEditingController();
 // var textLocController2 = TextEditingController();
  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;


  /// 리스트
  RxList<dynamic> rackIpgoList = [].obs; // 랙입고 조회된 리스트
  RxList<dynamic> rackIpgoTodayList = [].obs; // 랙입고 오늘자 리스트
  RxList<dynamic> rackIpgoDupList = [].obs; // 랙입고 조회된 리스트 여러개 경우
  RxList<dynamic> registRackIpgoList = [].obs; // 최종 리스트(qr입력마다 다 넣어준 리스트)

  RxList<dynamic> isSelect = [].obs;

  RxString locTextS = ''.obs;

  RxDouble height = 0.0.obs;
  RxInt currentFirstIndex = 0.obs;

  RxInt alertIndex = 0.obs;


  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;
  var rowDatas3 = <PlutoRow>[].obs;

  List<PlutoRow> insertRow = [];




  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime.now();
  RxString dayStartValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayEndValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayStartValue2 = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs; ///입고취소 입고일자
  RxString dayEndValue2 = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs; ///입고취소 입고일자
  RxString zoneText = ''.obs;
  RxString zoneCd = ''.obs;
  RxString locText = ''.obs;
  RxString locCd = ''.obs;
  RxBool isQrFocus = false.obs;
  RxBool isLocSelect = false.obs;

  RxBool bLoading = false.obs;
  RxInt focusCnt = 0.obs;
  RxInt focusCnt2 = 0.obs;
  RxBool isSelectedInvnr = false.obs; // 거래명세서 선택된 값이 있는지 여부
  RxBool isDuplQr = false.obs; // 중복qr 선택된 값이 있는지 여부
  RxInt selectedInvnrIndex = 0.obs; // 선택된 거래명세서의 index
  RxString statusText = ''.obs;
  RxBool isDbConnected = true.obs;
  RxBool isRackIpgo = false.obs;

  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeKey = FocusNode();
  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
  }

  /// 입고대기 취소
  Future<void> yetRackReIpgoBtn() async {
    Get.log('입고대기 취소 클릭');

    bLoading.value = true;

    for(var i = 0; i < registRackIpgoList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A1030_S01',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': 'D',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QR_CODE',
            'paramValue': '${rackIpgoList[i]['QR_NO']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_PLANT',
            'paramValue': '1302',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WH_CD',
            'paramValue': 'WH01',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_LOC_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_ZONE_CD',
            'paramValue': registRackIpgoList[i]['ZONE_CD'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_LOC_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD_TO'],               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_ZONE_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD_TO'].substring(0,1),               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': '${registRackIpgoList[i]['ITEM_CD']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': '${registRackIpgoList[i]['INB_NO']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_ID',
            'paramValue': gs.loginId.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_IP',
            'paramValue': 'MOBILE',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          }


        ]
      };

      try {
        final retVal = await HomeApi.to.registRackIpgo(params);

        if (retVal == '0000') {
          Get.log('보류되었습니다');
          isDbConnected.value = true;
        } else {
          Get.log('보류 실패');

        }
      } catch (e) {
        Get.log('registRackIpgo catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;

      }
    }

  }

  /// 입고보류
  Future<void> yetRackIpgoBtn() async {
    Get.log('입고보류 클릭');

    bLoading.value = true;

    for(var i = 0; i < registRackIpgoList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A1030_S01',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': 'U',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QR_CODE',
            'paramValue': '${registRackIpgoList[i]['QR_NO']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_PLANT',
            'paramValue': '1302',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WH_CD',
            'paramValue': 'WH01',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_LOC_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_ZONE_CD',
            'paramValue': registRackIpgoList[i]['ZONE_CD'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_LOC_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD_TO'],               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_ZONE_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD_TO'].substring(0,1),               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': '${registRackIpgoList[i]['ITEM_CD']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': '${registRackIpgoList[i]['INB_NO']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_ID',
            'paramValue': gs.loginId.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_IP',
            'paramValue': 'MOBILE',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          }


        ]
      };

      try {
        final retVal = await HomeApi.to.registRackIpgo(params);

        if (retVal.body![0]['resultMessage'] == '') {
          Get.log('보류되었습니다');
          isDbConnected.value = true;
        } else {
          Get.log('보류 실패');

        }
      } catch (e) {
        Get.log('registRackIpgo catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;

      }
    }

  }

  /// 랙입고 등록
  Future<void> registRackIpgoBtn() async {
    Get.log('랙입고 등록 클릭');

    bLoading.value = true;

    for(var i = 0; i < registRackIpgoList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A1030_S01',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': 'N',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QR_CODE',
            'paramValue': registRackIpgoList[i]['TAG_TYPE'] == '90' ? '${registRackIpgoList[i]['QR_NO']}' : '${registRackIpgoList[i]['TAG_NO']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_PLANT',
            'paramValue': '1302',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WH_CD',
            'paramValue': 'WH01',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_LOC_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD'].toString() == 'null' ? '' : registRackIpgoList[i]['LOC_CD'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_ZONE_CD',
            'paramValue': registRackIpgoList[i]['ZONE_CD'].toString() == 'null' ? '' : registRackIpgoList[i]['ZONE_CD'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_LOC_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD_TO'], // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_ZONE_CD',
            'paramValue': registRackIpgoList[i]['LOC_CD_TO'].substring(0,1),               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': '${registRackIpgoList[i]['ITEM_CD']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': '${registRackIpgoList[i]['INB_NO']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_ID',
            'paramValue': gs.loginId.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_IP',
            'paramValue': 'MOBILE',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          }


        ]
      };

      try {
        final retVal = await HomeApi.to.registRackIpgo(params);

        if (retVal.body![0]['resultMessage'] == '') {
          if(retVal.body![0]['returnMessage'] != '') {
            statusText.value = retVal.body![0]['returnMessage'].toString(); // 일단 return 메세지?
            isRackIpgo.value = false;
          }else {
            Get.log('등록되었습니다');
            isDbConnected.value = true;
          }
        } else {
          Get.log('등록 실패');

        }
      } catch (e) {
        Get.log('registRackIpgo catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;

      }
    }

  }

  /// 랙입고 오늘 전체 조회
  Future<void> checkTodayList() async {
    Get.log('오늘 전체 조회');

    bLoading.value = true;
    rackIpgoTodayList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A1030_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q1',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_CODE',
          'paramValue': '',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PLANT',
          'paramValue': '1302',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_WH_CD',
          'paramValue': 'WH01',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqRackIpgoToday(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          rackIpgoTodayList.value.addAll(retVal.body![1]);
          Get.log(rackIpgoTodayList.toString());
          Get.log('조회 성공');
        //  statusText.value = '정상 조회되었습니다.';
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
         // statusText.value = retVal.body![0]['resultMessage'];
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkTodayList catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      plutoRow2();
    }
  }


  /// 랙입고 조회
  Future<void> checkQR() async {
    Get.log('QR 조회');

    bLoading.value = true;
    rackIpgoList.clear();
    rackIpgoDupList.clear();
    isSelect.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A1030_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_CODE',
          'paramValue': textQrMultiController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PLANT',
          'paramValue': '1302',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_WH_CD',
          'paramValue': 'WH01',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqRackIpgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          rackIpgoList.value.addAll(retVal.body![1]);
          rackIpgoDupList.value.addAll(retVal.body![1]);
          for(var i = 0; i < rackIpgoDupList.length; i++) {
            rackIpgoDupList[i].addAll({'no': rackIpgoDupList.length + 1});
          }
          rackIpgoList[0].addAll({'no': '${registRackIpgoList.length + 1}'});
          rackIpgoList[0].addAll({'LOC_CD_TO': ''});
          for(var i = 0; i < rackIpgoDupList.length; i++) {
            isSelect.add(false);
          }

          if(rackIpgoList.length == 1) {
            registRackIpgoList.add(rackIpgoList[0]);
          }

          Get.log(rackIpgoList.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회되었습니다.';
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          textQrMultiController.clear();
          focusNode.requestFocus();
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
     // plutoRow();
    }
  }

  /// 입고 등록
  Future<void> registCancelIpgoBtn() async {
    Get.log('입고취소 클릭');

    bLoading.value = true;

   /* for(var e = 0; e < ipgoCancelBollList.length; e++) {
      if(ipgoCancelBollList[e] == true) {
        var params = {
          'procedure': 'USP_A1020_S02',
          'params': [
            {
              'paramName': 'p_work_type',
              'paramValue': 'D',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PLANT',
              'paramValue': '1302',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WH_CD',
              'paramValue': ipgoCancelList[e]['whCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_NO',
              'paramValue': ipgoCancelList[e]['inbNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_SEQ',
              'paramValue': ipgoCancelList[e]['inbSeq'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_USR_ID',
              'paramValue': gs.loginId.value,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_USR_IP',
              'paramValue': 'MOBILE',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },


          ]
        };

        try {
          final retVal = await HomeApi.to.registCancelIpgo(params);

          if (retVal == '0000') {
            Get.log('입고취소되었습니다');

          } else {
            Get.log('취소 실패');

          }
        } catch (e) {
          Get.log('registCancelIpgoBtn catch !!!!');
          Get.log(e.toString());
        } finally {
          bLoading.value = false;

        }

      }

    }*/

  }


  Future<void> plutoRow() async {
    rowDatas.value = List<PlutoRow>.generate(registRackIpgoList.length, (index) =>
        PlutoRow(cells:
        Map.from((registRackIpgoList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
        )))
    );
    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas.value);
    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  Future<void> plutoRow2() async {
    rowDatas2.value = List<PlutoRow>.generate(rackIpgoTodayList.length, (index) =>
        PlutoRow(cells:
        Map.from((rackIpgoTodayList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
        )))
    );
    gridStateMgr2.removeAllRows();
    gridStateMgr2.appendRows(rowDatas2.value);
    gridStateMgr2.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }




  @override
  void onClose() {
    Get.log('IpgoController - onClose !!');
    super.onClose();
  }

  @override
  void onInit() async {
    Get.log('IpgoController - onInit !!');
    super.onInit();
    firstDayOfMonth = DateTime(now.year, now.month, 1);
    dayStartValue.value = DateFormat('yyyy-MM-dd').format(firstDayOfMonth);
    registRackIpgoList.clear();
    rackIpgoList.clear();
  }

  @override
  void onReady() async{
    Get.log('IpgoController - onReady !!');
    await checkTodayList();

  }
}
