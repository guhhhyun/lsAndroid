

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
  late  PlutoGridStateManager gridStateMgr5; // qr 디테일부분

  /// 리스트
  RxList<dynamic> etcIpgoList = [].obs; //
  RxList<dynamic> etcIpgoDetailList = [].obs; //
  RxList<dynamic> etcIpgoCheckList = [].obs; // 선택한 체크리스트 모음
  RxList<dynamic> etcIpgoQrList = [].obs; //
  RxList<dynamic> etcIpgoQrDetailList = [].obs; //QR 디테일리스트
  RxList<dynamic> etcIpgoQrDetailTotalList = [].obs; //QR 디테일리스트 총합
  RxList<dynamic> etcIpgoQrCheckList = [].obs; // 신규화면 선택한 체크리스트 모음
  RxList<dynamic> etcIpgoSaveQrList = [].obs; //
  RxList<dynamic> chulSecondList = [].obs; //
  RxList<dynamic> uniqueEtcIpgoList = [].obs; //중복 제거된 리스트 두번째 화면에서 쓰임
  RxList<dynamic> itemChulSecondList = [].obs; //중복 제거된 리스트에서 선택된 리스트의 자재들 리스트
  RxList<dynamic> itemTotalList = [].obs;

  RxList<dynamic> itemTotalListOne = [].obs;

  RxList<dynamic> chulThirdList = [].obs; //
  RxList<dynamic> cheburnIpgoList = [].obs; //
  RxList<dynamic> cheburnIpgoLotList = [].obs; //

  RxList<dynamic> locationList = [].obs; //

  RxList<dynamic> inbTypeTotalList = [].obs; //
  RxList<dynamic> inbTypeList = [{'CODE':'', 'NAME': '전체'}].obs;
  RxMap<String, String> selectedInbTypeDropdown = {'CODE':'', 'NAME': '전체'}.obs;

  RxBool isText = true.obs;

  RxBool isRowChecked = false.obs;
  RxBool isFocus = false.obs;

  RxBool isNewFocus = false.obs;


  RxDouble height = 0.0.obs;



  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;
  var rowDatas3 = <PlutoRow>[].obs;
  var rowDatas4 = <PlutoRow>[].obs;
  var rowDatas5 = <PlutoRow>[].obs;

  var row = <PlutoRow>[].obs;



  RxMap<String, String> selectedChulgoContainer = {'CODE':'', 'NAME': '전체'}.obs;
  RxList<dynamic> chulgoList = [{'CODE':'', 'NAME': '전체'}].obs;
  RxList<dynamic> chulgoTotalList = [].obs;
  RxList<dynamic> containerList = [{'CODE':'1', 'NAME': 'KIT 작업장'}].obs;
  RxMap<String, String> selectedContainer = {'CODE':'', 'NAME': 'KIT 작업장'}.obs;

  RxBool isEtcIpgoQrCheckList = false.obs;
  RxInt isEtcIpgoQrCheckListIdx = 0.obs;

  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime.now();
  RxString dayStartValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayEndValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString zoneText = ''.obs;
  RxString zoneCd = ''.obs;
  RxString locText = ''.obs;
  RxString locCd = ''.obs;
  RxInt currentFirstIndex = 0.obs;
  RxBool isDbConnected = true.obs;

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
  RxInt currentRowIndex2 = 0.obs;
  RxBool isPlutoRow2 = false.obs;
  RxBool isQr = false.obs;
  RxBool isQrFocus = false.obs;
  RxBool isChecked = false.obs;

  RxString locSaveText = 'A-00-00-00'.obs;
  /// 자재 팝업 리스트
  RxList<dynamic> popUpDataList = [].obs;
  RxList<dynamic> selectedPopList = [].obs;
  RxList<dynamic> selectedItemPopContainer = [].obs;
  RxString selectedQrNo = ''.obs;
  RxInt noTagIdx = 0.obs;


  /// 공통 드롭다운 입고구분
  Future<void> reqCommon2() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020', //A4020
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
          'paramValue': 'INB_TYPE',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCommon(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          inbTypeTotalList.addAll(retVal.body![1]);
          for(var i = 0; i < inbTypeTotalList.length; i++) {
            if(inbTypeTotalList[i]['DTL_CD'] == '900' || inbTypeTotalList[i]['DTL_CD'] == '140') {
              inbTypeList.add(
                  {
                    'CODE': '${inbTypeTotalList[i]['DTL_CD']}',
                    'NAME': '${inbTypeTotalList[i]['CD_NM']}'
                  }

              );
            }

          }
          Get.log('조회 성공');
          Get.log('$inbTypeList');
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('reqCommon catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }


  /// 로케이션 프로시저
  Future<void> reqLocation() async {
    bLoading.value = true;
    popUpDataList.clear();

    var params = {
      'programId': 'A1020', //A4020
      'procedure': 'USP_LOCATION_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q',
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
          'paramName': 'p_LOC_CD',
          'paramValue': textLocController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqLocation(params);

      if(retVal.body![0]['resultMessage'] == '') {
        popUpDataList.addAll(retVal.body![1]);
        Get.log('로케이션 조회 성공');
        isDbConnected.value = true;
      } else {
        Get.log('로케이션 조회 실패');
      }
    } catch (e) {
      Get.log('reqLocation catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
    }
  }

  /// 채번 프로시저
  Future<void> reqCheburn() async {
    bLoading.value = true;
    cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020', //A4020
      'procedure': 'USP_GET_CODE_SEQ',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PREFIX',
          'paramValue': 'INBE',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcCheburnIpgo(params);

      if (retVal.resultCode == '0000') {

          cheburnIpgoList.value.addAll(retVal.body![1]);
          Get.log('채번 리스트 조회: ${cheburnIpgoList.toString()}');
          Get.log('채번 리스트 조회값: ${cheburnIpgoList[0]['']}');


          Get.log('조회 성공');
          isDbConnected.value = true;


      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('cheburnIpgoList catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
    }
  }

  /// 채번 프로시저 - lot
  Future<void> reqCheburn2() async {
    bLoading.value = true;
    cheburnIpgoLotList.clear();

    var params = {
      'programId': 'A1020', //A4020
      'procedure': 'USP_GET_CODE_SEQ',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PREFIX',
          'paramValue': 'LINB',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcCheburnIpgo(params);

      if (retVal.resultCode == '0000') {
          cheburnIpgoLotList.value.addAll(retVal.body![1]);
          Get.log('채번 리스트 조회: ${cheburnIpgoLotList.toString()}');
          Get.log('조회 성공');
          isDbConnected.value = true;

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('cheburnIpgoList catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
    }
  }




  /// 두번째 화면 저장
  Future<void> registSaveIpgoBtn() async {
    Get.log('저장 클릭');

    bLoading.value = true;
    await reqCheburn();
    await reqCheburn2();
    for(var e = etcIpgoSaveQrList.length - 1; e >= 0; e--) {
      Get.log('길이는?? ${etcIpgoQrCheckList.length}');
      Get.log('길이는2?? ${etcIpgoQrList.length}');

        var params = {
          'programId': 'A1020', //A4020
          'procedure': 'USP_A4020_S02',
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
              'paramValue': cheburnIpgoList[0][''],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_LOT_NO',
              'paramValue': cheburnIpgoLotList[0][''],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INB_DATE',
              'paramValue': DateFormat('yyyyMMdd').format(DateTime.now()),
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_STK_MOV_NO', /// 추가됐음 확인
              'paramValue': '',
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
              'paramValue': gs.loginId.value,
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
              'paramValue': etcIpgoSaveQrList[e]['tagType'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': etcIpgoSaveQrList[e]['itemCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': etcIpgoSaveQrList[e]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY',
              'paramValue': etcIpgoSaveQrList[e]['qty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY_UNIT',
              'paramValue': etcIpgoSaveQrList[e]['qtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT',
              'paramValue': etcIpgoSaveQrList[e]['wht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT_UNIT',
              'paramValue': etcIpgoSaveQrList[e]['whtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PRT_DT',
              'paramValue': etcIpgoSaveQrList[e]['prtDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_EXP_DT',
              'paramValue': etcIpgoSaveQrList[e]['expDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': etcIpgoSaveQrList[e]['tagNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK',
              'paramValue': etcIpgoSaveQrList[e]['remark'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QR_NO',
              'paramValue': etcIpgoSaveQrList[e]['qrNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_FST_ROW_YN',
              'paramValue': etcIpgoSaveQrList[e]['fstRowYn'],
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

          if (retVal.body![0]['resultValue'] == true) {
            Get.log('기타입고 저장되었습니다');
            etcIpgoSaveQrList.removeAt(e); // 좌측리스트 삭제
            etcIpgoQrDetailTotalList.removeAt(e); // 우측 디테일 삭제
            etcIpgoQrCheckList.removeAt(e);
            statusText.value = '';
          } else {
            Get.log('저장 실패');
            statusText.value = retVal.body![0]['resultMessage'];
          }
        } catch (e) {
          Get.log('registSaveIpgoBtn catch !!!!');
          Get.log(e.toString());
        } finally {
          bLoading.value = false;
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
          'programId': 'A1020', //A4020
          'procedure': 'USP_A4020_S02',
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
              'paramName': 'p_STK_MOV_NO', /// 추가됐음 확인
              'paramValue': '',
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

          if(retVal.body![0]['resultMessage'] == '') {
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
    //tai
    bLoading.value = true;

    var params = {
      'programId': 'A1020', //A4020
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




  /// 기타입고 조회1
  Future<void> checkQR() async {
    Get.log('조회');

    etcIpgoList.clear();
    etcIpgoCheckList.clear();

    var params = {
      'programId': 'A1020', //A4020
      'procedure': 'USP_A4020_R05', // USP_A4020_R03
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_DT_FROM", "paramValue": dayStartValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_DT_TO", "paramValue": dayEndValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_ITEM_CD", "paramValue": textItemCdController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_ITEM_NM", "paramValue": textItemNmController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_TYPE", "paramValue": selectedInbTypeDropdown['CODE'], "paramJdbcType": "VARCHAR", "paramMode": "IN"}


      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcIpgo(params);
      var etcIpgoListTotal = [];
      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcIpgoList.addAll(retVal.body![1]);
          for(var i = 0; i < etcIpgoList.length; i++) {
            etcIpgoList[i].addAll({'noV': ''});
            etcIpgoCheckList.add(false);
          }
          /*etcIpgoListTotal.addAll(retVal.body![1]);
          if(selectedInbTypeDropdown['NAME'] == '전체') {
            etcIpgoList.addAll(retVal.body![1]);
            for(var i = 0; i < etcIpgoList.length; i++) {
              etcIpgoList[i].addAll({'noV': ''});
              etcIpgoCheckList.add(false);
            }
          }else {
            for(var i = 0; i < etcIpgoListTotal.length; i++) {
              if(etcIpgoListTotal[i]['inbType'] == selectedInbTypeDropdown['NAME']) {
                etcIpgoList.add(etcIpgoListTotal[i]);
              }
            }
            for(var i = 0; i < etcIpgoList.length; i++) {
              etcIpgoList[i].addAll({'noV': ''});
              etcIpgoCheckList.add(false);
            }
          }*/

          Get.log('조회 성공');
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          isDbConnected.value = false;
        }

      } else {
        Get.log('조회 실패');
        isDbConnected.value = false;
      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      isChecked.value = false;
      await plutoRow2();
      isDbConnected.value == true ?
      await checkDetailQR() : null;
    }
  }

  /// 기타입고 상세조회
  Future<void> checkDetailQR() async {
    Get.log('조회');

    bLoading.value = true;
    itemTotalList.clear();
   // etcIpgoList.length == 1 ? itemTotalList.clear() : null;
    Get.log('etcIpgoList:::: ${etcIpgoList}');

    for(var i = 0; i < etcIpgoList.length; i++) {
     // etcIpgoDetailList.clear();
      List<dynamic> newEtcIpgoDetailList = [];
      var params = {
        'programId': 'A1020', //A4020
        'procedure': 'USP_A4020_R06', // USP_A4020_R03
        'params': [
          { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
          { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
          { "paramName": "p_INB_NO", "paramValue": etcIpgoList[i]['inbNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"}
        ]
      };

      try {
        final retVal = await HomeApi.to.reqEtcIpgoDetail(params);

        if (retVal.resultCode == '0000') {
          if(retVal.body![0]['resultMessage'] == '') {
            newEtcIpgoDetailList.addAll(retVal.body![1]);
            Get.log('etcIpgoDetailList:::: ${etcIpgoDetailList}');
            itemTotalList.add(newEtcIpgoDetailList);

            /*uniqueEtcIpgoList.value = etcIpgoList
              .fold<Map<String, dynamic>>({}, (map, item) {
            map[item['inbNo'].toString()] = item; // no 키로 사용하여 중복 제거
            return map;
          }).values.toList();*/ // 프로시저 바뀌고 안씀

            Get.log('조회 성공');
          }else{
            Get.log('${retVal.body![0]['resultMessage']}');
            statusText.value = retVal.body![0]['resultMessage'];
          }

        } else {
          Get.log('조회 실패');

        }
      } catch (e) {
        Get.log('checkDetailQR catch !!!!');
        Get.log(e.toString());
      } finally {
        bLoading.value = false;
        isChecked.value = false;
      }
    }
    Get.log('itemTotalList::::!!!!! ${itemTotalList}');
  }


  /// 기타입고 상세조회 단건
  Future<void> checkDetailQROne() async {
    Get.log('조회');

    bLoading.value = true;
    itemTotalListOne.clear();
    // etcIpgoList.length == 1 ? itemTotalList.clear() : null;
    Get.log('etcIpgoList:::: ${etcIpgoList}');

      var params = {
        'programId': 'A1020', //A4020
        'procedure': 'USP_A4020_R06', // USP_A4020_R03
        'params': [
          { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
          { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
          { "paramName": "p_INB_NO", "paramValue": etcIpgoList[currentRowIndex.value]['inbNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"}
        ]
      };

      try {
        final retVal = await HomeApi.to.reqEtcIpgoDetail(params);

        if (retVal.resultCode == '0000') {
          if(retVal.body![0]['resultMessage'] == '') {
            itemTotalListOne.addAll(retVal.body![1]);
            Get.log('조회 성공');
          }else{
            Get.log('${retVal.body![0]['resultMessage']}');
            statusText.value = retVal.body![0]['resultMessage'];
          }

        } else {
          Get.log('조회 실패');
          statusText.value = '조회에 실패했습니다.';
        }
      } catch (e) {
        Get.log('checkDetailQR catch !!!!');
        Get.log(e.toString());
      } finally {
        bLoading.value = false;
        isChecked.value = false;
      }
  }



  /// 기타입고 QR조회
  Future<void> checkQR2() async {
    Get.log('조회');

    bLoading.value = true;
    etcIpgoQrList.clear();
   // etcIpgoQrCheckList.clear();

    var params = {
      'programId': 'A1020', //A4020
      'procedure': 'USP_A4020_R07',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q1", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
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
          }
          etcIpgoQrCheckList.add(false);
          statusText.value = '정상 조회되었습니다.';
          Get.log('조회 성공');
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          textQrController.text = '';
          focusNode.requestFocus();

        }

      } else {
        Get.log('조회 실패');
        textQrController.text = '';
      }
    } catch (e) {
      Get.log('checkQR2 catch !!!!');
      Get.log(e.toString());
      textQrController.text = '';
    } finally {
      bLoading.value = false;

    }
  }
  /// 기타입고 QR조회 상세
  Future<void> checkDetailQR2() async {
    Get.log('조회');

    bLoading.value = true;
    etcIpgoQrDetailList.clear();
    var etcIpgoQrDetailListNew = [];
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4020_R07',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q2", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_QR_NO", "paramValue": etcIpgoQrList[0]['tagNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_NO", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_LOC_CD", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_INB_USER_ID", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_REMARK", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcIpgoQrDetail(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcIpgoQrDetailListNew.addAll(retVal.body![1]);
          etcIpgoQrDetailTotalList.add(etcIpgoQrDetailListNew);

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
      Get.log('checkDetailQR2 catch !!!!');
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


  /// 중복 제외 조회
  Future<void> plutoRow2() async {

    rowDatas2.value = List<PlutoRow>.generate(
      etcIpgoList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (etcIpgoList[index]).map((key, value) => MapEntry(
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


  final focusNode = FocusNode();
  final focusNodeKey = FocusNode();
  final focusNode2 = FocusNode();
  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    isFocus.value = true;
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
    await reqCommon2();
  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
