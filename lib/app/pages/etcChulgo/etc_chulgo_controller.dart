
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class EtcChulgoController extends GetxController with GetSingleTickerProviderStateMixin {

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
  late  PlutoGridStateManager gridStateMgr5;

  /// 리스트
  RxList<dynamic> etcChulgoList = [].obs; //
  RxList<dynamic> etcChulgoCheckList = [].obs; // 선택한 체크리스트 모음
  RxList<dynamic> etcChulgoQrList = [].obs; //
  RxList<dynamic> etcChulgoQrCheckList = [].obs; // 신규화면 선택한 체크리스트 모음
  RxList<dynamic> etcChulgoSaveQrList = [].obs; //
  RxList<dynamic> chulSecondList = [].obs; //
  RxList<dynamic> uniqueEtcIpgoList = [].obs; //중복 제거된 리스트 두번째 화면에서 쓰임
  RxList<dynamic> itemChulSecondList = [].obs; //중복 제거된 리스트에서 선택된 리스트의 자재들 리스트
  RxList<dynamic> itemTotalList = [].obs;

  RxList<dynamic> chulThirdList = [].obs; //

  RxList<dynamic> etcChulgoQrDetailList = [].obs;
  RxList<dynamic> etcChulgoQrDetailTotalList = [].obs;


  RxBool isEtcChulgoQrCheckList = false.obs;
  RxInt isEtcChulgoQrCheckListIdx = 0.obs;

  RxBool isDbConnected = true.obs;

  RxBool isText = true.obs;

  RxBool isRowChecked = false.obs;
  RxBool isFocus = false.obs;


  RxDouble height = 0.0.obs;


  RxBool tete = false.obs;



  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;
  var rowDatas3 = <PlutoRow>[].obs;
  var rowDatas4 = <PlutoRow>[].obs;
  var rowDatas5 = <PlutoRow>[].obs;

  var row = <PlutoRow>[].obs;

  List<PlutoRow> insertRow = [];



  RxMap<String, String> selectedChulgoContainer = {'CODE':'', 'NAME': '전체'}.obs;
  RxList<dynamic> chulgoList = [{'CODE':'', 'NAME': '전체'}].obs;
  RxList<dynamic> chulgoTotalList = [].obs;
  RxList<dynamic> containerList = [{'CODE':'1', 'NAME': 'KIT 작업장'}].obs;
  RxMap<String, String> selectedContainer = {'CODE':'', 'NAME': 'KIT 작업장'}.obs;

  RxList<dynamic> cheburnIpgoList = [].obs; // 채번 담아두는 리스트
  RxList<dynamic> cheburnIpgoLotList = [].obs;


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
  RxInt currentRowIndex2 = 0.obs;
  RxBool isPlutoRow2 = false.obs;
  RxBool isQr = false.obs;
  RxBool isQrFocus = false.obs;
  RxBool isChecked = false.obs;


  /// 채번 프로시저
  Future<void> reqCheburn() async {
    bLoading.value = true;
    cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020',
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
          'paramValue': 'OTBE',
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
      'programId': 'A1020',
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
          'paramValue': 'LOTB',
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

    for(var e = etcChulgoQrCheckList.length - 1; e >= 0; e--) {
      await reqCheburn();
      await reqCheburn2();
      if(etcChulgoQrCheckList[e] == true) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A4030_S02',
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
              'paramName': 'p_OTB_NO',
              'paramValue': cheburnIpgoList[0][''],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_OTB_LOT_NO',
              'paramValue': cheburnIpgoLotList[0][''],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_OTB_DATE',
              'paramValue': DateFormat('yyyyMMdd').format(DateTime.now()),
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
            'paramName': 'p_PLACE_NM',
            'paramValue': 'testMobile', //이거 어디서 가져오는지 물어봐야함
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
            },

            {
              'paramName': 'p_OTB_USER_ID',
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
              'paramValue': etcChulgoSaveQrList[e]['tagType'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': etcChulgoSaveQrList[e]['itemCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': etcChulgoSaveQrList[e]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY',
              'paramValue': etcChulgoSaveQrList[e]['qty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY_UNIT',
              'paramValue': etcChulgoSaveQrList[e]['qtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT',
              'paramValue': etcChulgoSaveQrList[e]['wht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT_UNIT',
              'paramValue': etcChulgoSaveQrList[e]['whtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PRT_DT',
              'paramValue': etcChulgoSaveQrList[e]['prtDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_EXP_DT',
              'paramValue': etcChulgoSaveQrList[e]['expDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': etcChulgoSaveQrList[e]['tagNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK',
              'paramValue': etcChulgoSaveQrList[e]['remark'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QR_NO',
              'paramValue': etcChulgoSaveQrList[e]['qrNo'],
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

          if(retVal.body![0]['resultValue'] == true) {
            Get.log('기타출고 저장되었습니다');
            etcChulgoSaveQrList.removeAt(e); // 좌측리스트 삭제
            etcChulgoQrDetailTotalList.removeAt(e); // 우측 디테일 삭제
            etcChulgoQrCheckList.removeAt(e);
          } else {
            Get.log('저장 실패');
            statusText.value = retVal.body![0]['resultMessage'].toString();
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

    for(var e = 0; e < etcChulgoCheckList.length; e++) {
      if(etcChulgoCheckList[e] == true) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A4030_S02',
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
              'paramName': 'p_OTB_NO',
              'paramValue': etcChulgoList[e]['otbNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_OTB_LOT_NO',
              'paramValue': etcChulgoList[e]['otbLotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOC_CD',
              'paramValue': etcChulgoList[e]['locCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PLACE_NM',
              'paramValue': '테스트',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_OTB_USER_ID',
              'paramValue': etcChulgoList[e]['otbUserId'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK_MASTER',
              'paramValue': etcChulgoList[e]['remarkMaster'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_TYPE',
              'paramValue': etcChulgoList[e]['tagType'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': etcChulgoList[e]['itemCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': etcChulgoList[e]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY',
              'paramValue': etcChulgoList[e]['qty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QTY_UNIT',
              'paramValue': etcChulgoList[e]['qtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT',
              'paramValue': etcChulgoList[e]['wht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_WHT_UNIT',
              'paramValue': etcChulgoList[e]['whtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PRT_DT',
              'paramValue': etcChulgoList[e]['prtDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_EXP_DT',
              'paramValue': etcChulgoList[e]['expDt'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': etcChulgoList[e]['tagNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_REMARK',
              'paramValue': etcChulgoList[e]['remark'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_QR_NO',
              'paramValue': etcChulgoList[e]['qrNo'],
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


  /// 기타출고 두번째 조회
  Future<void> reqChulThird() async {
    Get.log('조회');

    bLoading.value = true;
    etcChulgoQrList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4030_R06',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q1", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_QR_NO", "paramValue": textQrController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_OTB_NO", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_LOC_CD", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_OTB_USER_ID", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_REMARK", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcChulgoQr(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcChulgoQrList.addAll(retVal.body![1]);
          for(var i = 0; i < etcChulgoQrList.length; i++) {
            etcChulgoQrList[i].addAll({'noV': ''});
          }
          etcChulgoQrCheckList.add(false);
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

  /// 기타출고 두번째 조회 상세
  Future<void> reqChulThirdDetail() async {
    Get.log('조회');

    bLoading.value = true;
    chulThirdList.clear();
    var etcIpgoQrDetailListNew = [];
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4030_R06',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q2", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_QR_NO", "paramValue": textQrController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_OTB_NO", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_LOC_CD", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_OTB_USER_ID", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_REMARK", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcChulgoQrDetail(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcIpgoQrDetailListNew.addAll(retVal.body![1]);
          for(var i = 0; i < etcIpgoQrDetailListNew.length; i++) {
            etcIpgoQrDetailListNew[i].addAll({'qtyUse': etcIpgoQrDetailListNew[i]['qty']});
          }
          etcChulgoQrDetailTotalList.add(etcIpgoQrDetailListNew);

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
      Get.log('reqChulThirdDetail catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;

    }
  }


  /// 기타출고 조회1
  Future<void> checkQR() async {
    Get.log('조회');

    bLoading.value = true;
    etcChulgoList.clear();
    etcChulgoCheckList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4030_R04',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_WH_CD", "paramValue": "WH01", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_OTB_DT_FROM", "paramValue": dayStartValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_OTB_DT_TO", "paramValue": dayEndValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_ITEM_CD", "paramValue": textItemCdController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_ITEM_NM", "paramValue": textItemNmController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqEtcChulgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          etcChulgoList.addAll(retVal.body![1]);
          for(var i = 0; i < etcChulgoList.length; i++) {
            etcChulgoList[i].addAll({'noV': ''});
            etcChulgoCheckList.add(false);
          }
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
    } finally {
      bLoading.value = false;
      isChecked.value = false;
      await plutoRow2();
      isDbConnected.value == true ?
      await checkQR2() : null;
    }
  }

  /// 기타출고 조회 상세
  Future<void> checkQR2() async {
    Get.log('조회');

    bLoading.value = true;
    itemTotalList.clear();

    for(var i = 0; i < etcChulgoList.length; i++) {
      // etcIpgoDetailList.clear();
      List<dynamic> newEtcChulgoDetailList = [];
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A4030_R05', // USP_A4020_R03
        'params': [
          { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
          { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
          { "paramName": "p_OTB_NO", "paramValue": etcChulgoList[i]['otbNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"}
        ]
      };

      try {
        final retVal = await HomeApi.to.reqEtcIpgoDetail(params);

        if (retVal.resultCode == '0000') {
          if(retVal.body![0]['resultMessage'] == '') {
            newEtcChulgoDetailList.addAll(retVal.body![1]);
            itemTotalList.add(newEtcChulgoDetailList);

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
  }


  /// 중복 제외 조회
  Future<void> plutoRow2() async {

    rowDatas2.value = List<PlutoRow>.generate(
      etcChulgoList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (etcChulgoList[index]).map((key, value) => MapEntry(
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
    Get.log('EtcChulgoController - onClose !!');
    super.onClose();
  }

  @override
  void onInit() async {
    Get.log('EtcChulgoController - onInit !!');
    super.onInit();
    firstDayOfMonth = DateTime(now.year, now.month, 1);
    dayStartValue.value = DateFormat('yyyy-MM-dd').format(firstDayOfMonth);
    etcChulgoList.clear();
    textLocController.text = 'A-00-00-00';
    textMgrController.text = gs.loginNm.value;
    textInbNoController.text = '자동채번';
  }

  @override
  void onReady() {
    Get.log('EtcChulgoController - onReady !!');

  }
}
