

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class RackIpgoController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();

  var textQrController = TextEditingController();
  var textStatusController = TextEditingController();
  var textZoneController = TextEditingController();
  var textLocController = TextEditingController();
 // var textZoneController2 = TextEditingController();
 // var textLocController2 = TextEditingController();
  late  PlutoGridStateManager gridStateMgr;


  /// 리스트
  RxList<dynamic> rackIpgoList = [].obs; // 랙입고 조회된 리스트
  RxList<dynamic> registRackIpgoList = [].obs; // 최종 리스트(qr입력마다 다 넣어준 리스트)



  RxDouble height = 0.0.obs;
  RxInt currentFirstIndex = 0.obs;


  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;

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

  RxBool bLoading = false.obs;
  RxInt focusCnt = 0.obs;
  RxBool isSelectedInvnr = false.obs; // 거래명세서 선택된 값이 있는지 여부
  RxBool isDuplQr = false.obs; // 중복qr 선택된 값이 있는지 여부
  RxInt selectedInvnrIndex = 0.obs; // 선택된 거래명세서의 index
  RxString statusText = ''.obs;


  final FocusNode focusNode = FocusNode();
  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
  }

  /// 입고대기 취소
  Future<void> yetRackReIpgoBtn() async {
    Get.log('입고대기 취소 클릭');

    bLoading.value = true;

    for(var i = 0; i < rackIpgoList.length; i++) {
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
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['QR_NO']}',
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
            'paramValue': locCd.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_ZONE_CD',
            'paramValue': zoneCd.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_LOC_CD',
            'paramValue': textLocController.text,               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_ZONE_CD',
            'paramValue': textLocController.text.substring(0,1),               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['ITEM_CD']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['INB_NO']}',
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

        } else {
          Get.log('보류 실패');

        }
      } catch (e) {
        Get.log('registRackIpgo catch !!!!');
        Get.log(e.toString());
      } finally {
        bLoading.value = false;

      }
    }

  }

  /// 입고보류
  Future<void> yetRackIpgoBtn() async {
    Get.log('입고보류 클릭');

    bLoading.value = true;

    for(var i = 0; i < rackIpgoList.length; i++) {
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
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['QR_NO']}',
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
            'paramValue': locCd.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_ZONE_CD',
            'paramValue': zoneCd.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_LOC_CD',
            'paramValue': textLocController.text,               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_ZONE_CD',
            'paramValue': textLocController.text.substring(0,1),               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['ITEM_CD']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['INB_NO']}',
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

        } else {
          Get.log('보류 실패');

        }
      } catch (e) {
        Get.log('registRackIpgo catch !!!!');
        Get.log(e.toString());
      } finally {
        bLoading.value = false;

      }
    }

  }

  /// 랙입고 등록
  Future<void> registRackIpgoBtn() async {
    Get.log('랙입고 등록 클릭');

    bLoading.value = true;

    for(var i = 0; i < rackIpgoList.length; i++) {
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
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['QR_NO']}',
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
            'paramValue': locCd.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FROM_ZONE_CD',
            'paramValue': zoneCd.value,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_LOC_CD',
            'paramValue': textLocController.text, // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TO_ZONE_CD',
            'paramValue': textLocController.text.substring(0,1),               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['ITEM_CD']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': '${rackIpgoList[currentFirstIndex.value]['INB_NO']}',
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
          Get.log('등록되었습니다');

        } else {
          Get.log('등록 실패');

        }
      } catch (e) {
        Get.log('registRackIpgo catch !!!!');
        Get.log(e.toString());
      } finally {
        bLoading.value = false;

      }
    }

  }


  /// 랙입고 조회
  Future<void> checkQR() async {
    Get.log('QR 조회');

    bLoading.value = true;
    rackIpgoList.clear();

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
          'paramValue': textQrController.text,
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
          for(var i = 0; i < rackIpgoList.length; i++){
            rackIpgoList[i].addAll({'no': '${i+1}'});
          }
          zoneText.value = rackIpgoList[currentFirstIndex.value]['LAST_ZONE_NM'];
          locText.value = rackIpgoList[currentFirstIndex.value]['LAST_LOC'];
          zoneCd.value = rackIpgoList[currentFirstIndex.value]['ZONE_CD'];
          locCd.value = rackIpgoList[currentFirstIndex.value]['LOC_CD'];
          Get.log(rackIpgoList.toString());
          Get.log('조회 성공');
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
      plutoRow();
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
    rowDatas.value = List<PlutoRow>.generate(rackIpgoList.length, (index) =>
        PlutoRow(cells:
        Map.from((rackIpgoList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
        )))
    );
    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas.value);
    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
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
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
