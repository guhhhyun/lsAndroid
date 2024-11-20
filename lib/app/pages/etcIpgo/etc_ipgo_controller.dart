

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class EtcIpgoController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();

  var textQrController = TextEditingController();
  var textProjectController = TextEditingController();
  var textInbNoController = TextEditingController();
  var textMgrController = TextEditingController();
  var textLocController = TextEditingController();
  var textRemarkController = TextEditingController();
  var textItemCdController = TextEditingController();
  var textItemNmController = TextEditingController();
  var textWrkNoController = TextEditingController(); // 제조번호
  var textOrderController = TextEditingController();


  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;
  late  PlutoGridStateManager gridStateMgr3;
  late  PlutoGridStateManager gridStateMgr4;

  /// 리스트
  RxList<dynamic> etcIpgoList = [].obs; //
  RxList<dynamic> etcIpgoCheckList = [].obs; // 선택한 체크리스트 모음
  RxList<dynamic> etcIpgoQrList = [].obs; //
  RxList<dynamic> etcIpgoQrCheckList = [].obs; // 신규화면 선택한 체크리스트 모음
  RxList<dynamic> etcIpgoSaveQrList = [].obs; //
  RxList<dynamic> chulSecondList = [].obs; //
  RxList<dynamic> uniqueEtcIpgoList = [].obs; //중복 제거된 리스트 두번째 화면에서 쓰임
  RxList<dynamic> itemChulSecondList = [].obs; //중복 제거된 리스트에서 선택된 리스트의 자재들 리스트
  RxList<RxList<dynamic>> itemTotalList = [[].obs].obs;

  RxList<dynamic> chulThirdList = [].obs; //

  RxBool isText = true.obs;


  RxDouble height = 0.0.obs;



  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;
  var rowDatas3 = <PlutoRow>[].obs;
  var rowDatas4 = <PlutoRow>[].obs;

  var row = <PlutoRow>[].obs;



  RxMap<String, String> selectedChulgoContainer = {'CODE':'', 'NAME': '전체'}.obs;
  RxList<dynamic> chulgoList = [{'CODE':'', 'NAME': '전체'}].obs;
  RxList<dynamic> chulgoTotalList = [].obs;
  RxList<dynamic> containerList = [{'CODE':'1', 'NAME': 'KIT 작업장'}].obs;
  RxMap<String, String> selectedContainer = {'CODE':'', 'NAME': 'KIT 작업장'}.obs;


  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime.now();
  RxString dayStartValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayEndValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString zoneText = ''.obs;
  RxString zoneCd = ''.obs;
  RxString locText = ''.obs;
  RxString locCd = ''.obs;
  RxInt currentFirstIndex = 0.obs;


  RxBool bLoading = false.obs;
  RxInt focusCnt = 0.obs;

  RxBool isDuplQr = false.obs; // 중복qr 선택된 값이 있는지 여부
  RxString statusText = ''.obs;



  RxString delOrdNo = ''.obs;
  RxString otbNo = ''.obs;
  RxInt selectedRow = 0.obs;
  RxString scanText = ''.obs;
  RxBool isSuccessThird = false.obs;
  RxInt currentRowIndex = 0.obs;
  RxBool isPlutoRow2 = false.obs;
  RxBool isQr = false.obs;
  RxBool isQrFocus = false.obs;
  RxBool isChecked = false.obs;

  /// 두번째 화면 저장
  Future<void> registSaveIpgoBtn() async {
    Get.log('저장 클릭');

    bLoading.value = true;

    for(var e = 0; e < etcIpgoCheckList.length; e++) {
      if(etcIpgoCheckList[e] == true) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A4020_S01',
          'params': [
            {
              'paramName': 'p_work_type',
              'paramValue': 'N',
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
              'paramName': 'p_INB_NO',
              'paramValue': '',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_LOT_NO',
              'paramValue': etcIpgoQrList[e]['inbLotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOC_CD',
              'paramValue': textLocController.text,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_USER_ID',
              'paramValue': textMgrController.text,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK_MASTER',
              'paramValue': textRemarkController.text,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_TYPE',
              'paramValue': etcIpgoQrList[e]['tagType'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': etcIpgoQrList[e]['itemCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': etcIpgoQrList[e]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY',
              'paramValue': etcIpgoQrList[e]['qty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY_UNIT',
              'paramValue': etcIpgoQrList[e]['qtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT',
              'paramValue': etcIpgoQrList[e]['wht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT_UNIT',
              'paramValue': etcIpgoQrList[e]['whtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PRT_DT',
              'paramValue': etcIpgoQrList[e]['prtDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_EXP_DT',
              'paramValue': etcIpgoQrList[e]['expDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': etcIpgoQrList[e]['tagNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK',
              'paramValue': etcIpgoQrList[e]['remark'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QR_NO',
              'paramValue': etcIpgoQrList[e]['qrNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_FST_ROW_YN',
              'paramValue': etcIpgoQrList[e]['fstRowYn'],
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
          final retVal = await HomeApi.to.registEtcCancelIpgo(params);

          if (retVal == '0000') {
            Get.log('기타입고 저장되었습니다');
          } else {
            Get.log('저장 실패');
          }
        } catch (e) {
          Get.log('registSaveIpgoBtn catch !!!!');
          Get.log(e.toString());
        } finally {
          bLoading.value = false;
        }
      }
    }
  }

  /// 첫번째 화면 취소
  Future<void> registCancelIpgoBtn(String workType) async {
    Get.log('취소 클릭');

    bLoading.value = true;

    for(var e = 0; e < etcIpgoCheckList.length; e++) {
      if(etcIpgoCheckList[e] == true) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A4020_S01',
          'params': [
            {
              'paramName': 'p_work_type',
              'paramValue': workType,
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
              'paramName': 'p_INB_NO',
              'paramValue': etcIpgoList[e]['inbNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_LOT_NO',
              'paramValue': etcIpgoList[e]['inbLotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOC_CD',
              'paramValue': etcIpgoList[e]['locCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_USER_ID',
              'paramValue': etcIpgoList[e]['inbUserId'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK_MASTER',
              'paramValue': etcIpgoList[e]['remarkMaster'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_TYPE',
              'paramValue': etcIpgoList[e]['tagType'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': etcIpgoList[e]['itemCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': etcIpgoList[e]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY',
              'paramValue': etcIpgoList[e]['qty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY_UNIT',
              'paramValue': etcIpgoList[e]['qtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT',
              'paramValue': etcIpgoList[e]['wht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT_UNIT',
              'paramValue': etcIpgoList[e]['whtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PRT_DT',
              'paramValue': etcIpgoList[e]['prtDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_EXP_DT',
              'paramValue': etcIpgoList[e]['expDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': etcIpgoList[e]['tagNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK',
              'paramValue': etcIpgoList[e]['remark'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QR_NO',
              'paramValue': etcIpgoList[e]['qrNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_FST_ROW_YN',
              'paramValue': etcIpgoList[e]['fstRowYn'],
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
          final retVal = await HomeApi.to.registEtcCancelIpgo(params);

          if (retVal == '0000') {
            Get.log('기타입고 취소되었습니다');
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
    }
  }

  /// 공통 드롭다운 조회(INB_TYPE) -> 입고구분
  Future<void> reqCommon() async {

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_GET_COMMON_CODE_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'VECTORX_CMM_CD',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_GRP_CD',
          'paramValue': 'OTB_TYPE',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCommon(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          chulgoTotalList.addAll(retVal.body![1]);
          for(var i = 0; i < chulgoTotalList.length; i++) {
            chulgoList.add(
                {'CODE': '${chulgoTotalList[i]['DTL_CD']}',
                  'NAME': '${chulgoTotalList[i]['CD_NM']}'
                }

            );
          }
          Get.log('조회 성공');
          Get.log('$chulgoList');
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('reqCommon catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;

    }
  }


  /// 출고등록 세번째 조회
  Future<void> reqChulThird() async {
    Get.log('조회');

    bLoading.value = true;
    chulThirdList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A3020_R03',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_NO", "paramValue": etcIpgoList[currentFirstIndex.value]['delOrdNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_QR_NO", "paramValue": textQrController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqChulThird(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          isSuccessThird.value = true;
          chulThirdList.addAll(retVal.body![1]);
          Get.log('조회 성공');
          statusText.value = '정상 조회되었습니다.';
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          isSuccessThird.value = false;
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
    }
  }


  /// 기타입고 조회1
  Future<void> checkQR() async {
    Get.log('조회');

    bLoading.value = true;
    etcIpgoList.clear();
    etcIpgoCheckList.clear();
    uniqueEtcIpgoList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4020_R03',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_DT_FROM", "paramValue": dayStartValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_DT_TO", "paramValue": dayEndValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_ITEM_CD", "paramValue": textItemCdController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_ITEM_NM", "paramValue": textItemNmController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcIpgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcIpgoList.addAll(retVal.body![1]);
          for(var i = 0; i < etcIpgoList.length; i++) {
            etcIpgoList[i].addAll({'noV': ''});
            etcIpgoCheckList.add(false);
          }
          uniqueEtcIpgoList.value = etcIpgoList
              .fold<Map<String, dynamic>>({}, (map, item) {
            map[item['inbNo'].toString()] = item; // no 키로 사용하여 중복 제거
            return map;
          }).values.toList();

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
      isChecked.value = false;
      await plutoRow2();
    }
  }

  /// 출고등록 조회2
  Future<void> checkQR2() async {
    Get.log('조회');

    bLoading.value = true;
    etcIpgoQrList.clear();
    etcIpgoQrCheckList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4020_R04',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_QR_NO", "paramValue": textQrController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_NO", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_LOC_CD", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_USER_ID", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_REMARK", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcIpgoQr(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcIpgoQrList.addAll(retVal.body![1]);
          for(var i = 0; i < etcIpgoQrList.length; i++) {
            etcIpgoQrList[i].addAll({'noV': ''});
            etcIpgoQrCheckList.add(false);
          }
          statusText.value = '정상 조회되었습니다.';
          Get.log('조회 성공');
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkQR2 catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;

    }
  }
  /// QR조회
   Future<void> plutoRow4() async {
    rowDatas4.value = List<PlutoRow>.generate(
      etcIpgoQrList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (etcIpgoQrList[index]).map((key, value) => MapEntry(
            key,
            PlutoCell(
              value: value ?? '',
            ),
          )),
        ),
      ),
    );
    gridStateMgr4.removeAllRows();
    gridStateMgr4.appendRows(rowDatas4.value);

    gridStateMgr4.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  /// 자재들만 조회
  Future<void> plutoRow3() async {
    itemTotalList.clear();
    Map<dynamic, List<Map<String, dynamic>>> groupedMap = {};
    // chulSecondList를 순회하면서 no 값을 키로 그룹화
    for (var item in etcIpgoList) {
      var key = item['inbNo'];
      if (groupedMap.containsKey(key)) {
        groupedMap[key]!.add(item);
      } else {
        groupedMap[key] = [item];
      }
    }

    // 그룹화된 맵의 각 값을 RxList로 변환하여 itemTotalList에 추가
    groupedMap.values.forEach((group) {
      itemTotalList.add(group.obs);  // 각 그룹을 RxList로 변환 후 itemTotalList에 추가
    });
    Get.log('itemTotalList::: ${itemTotalList}');
    rowDatas3.value = List<PlutoRow>.generate(
      itemTotalList[currentRowIndex.value].length,
          (index) => PlutoRow(
        cells: Map.from(
          (itemTotalList[currentRowIndex.value][index]).map((key, value) => MapEntry(
            key,
            PlutoCell(
              value: value == null
                  ? ''
                  : value,
            ),
          )),
        ),
      ),
    );


    /*  gridStateMgr3.removeAllRows();
    gridStateMgr3.appendRows(rowDatas3.value);*/
  }
  /// 중복 제외 조회
  Future<void> plutoRow2() async {

    rowDatas2.value = List<PlutoRow>.generate(
      uniqueEtcIpgoList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (uniqueEtcIpgoList[index]).map((key, value) => MapEntry(
            key,
            PlutoCell(
              value: value == null
                  ? ''

                  : value,
            ),
          )),
        ),
      ),
    );

    gridStateMgr2.removeAllRows();
    gridStateMgr2.appendRows(rowDatas2.value);

    gridStateMgr2.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  /// 전체 조회
  /* Future<void> plutoRow() async {
    rowDatas.value = List<PlutoRow>.generate(
      chulList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (chulList[index]).map((key, value) => MapEntry(
            key,
            PlutoCell(
              value: value == null
                  ? ''
                  : key == 'delOrdType'
                  ? chulgoList.firstWhere(
                      (item) => item['CODE'] == value,
                  orElse: () => {'NAME': ''}
              )['NAME'] ?? ''
                  : value,
            ),
          )),
        ),
      ),
    );
    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas.value);

    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }*/

  final focusNode = FocusNode();
  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
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
    etcIpgoList.clear();
    textLocController.text = 'A-00-00-00';
    textMgrController.text = gs.loginNm.value;
    textInbNoController.text = '자동채번';
  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
