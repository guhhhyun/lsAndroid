

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class InventoryCntController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();
  late TabController tabController;

  var textInvnrController = TextEditingController();
  var textItemController = TextEditingController();
  var textProjectController = TextEditingController();
  var textQrController = TextEditingController();

  /// 자재선택
  var textSelectQrController = TextEditingController();
  var textSelectItemNmController = TextEditingController();
  var textSelectItemController = TextEditingController();


  /// 추가 시 필요 controller

  var itemCdController = TextEditingController();
  var lotNoController = TextEditingController();
  var countLocController = TextEditingController();
  var countQtyController = TextEditingController();
  var countSetQtyController = TextEditingController();
  var countWhtController = TextEditingController();
  var countSetWhtController = TextEditingController();
  var qtyUnitController = TextEditingController();


  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;

  /// 소박스등록
  var textQrController2 = TextEditingController(); // 소박스등록 qr



  /// 입고취소
  var textInvnrController2 = TextEditingController();
  var textItemController2 = TextEditingController();
  var textProjectController2 = TextEditingController();

  /// 실사위치
  var textLocController = TextEditingController();

  late  PlutoGridStateManager gridStateMgr3;


  /// 실사위치 임시저장
  RxString locTextS = ''.obs;

  /// 리스트
  RxList<dynamic> inventoryCntList = [].obs; // 재고실사 마스터 리스트
  RxList<dynamic> inventoryCntSaveList = [].obs; // 재고실사 QR 정보 리스트

  RxList<dynamic> inventoryCntDetailList = [].obs; // 재고실사 디테일 리스트
  RxList<dynamic> inventoryCntSaveDetailList = [].obs; // 재고실사 QR 정보 리스트

  RxList<dynamic> inventoryCntQrList = [].obs; // 재고실사 qr리딩


  RxList<dynamic> addRowList = [].obs; //행추가
  var insertRow = <PlutoRow>[].obs;

  RxList<dynamic> invCntDtList = [].obs; // 재고실사 마스터 날짜만 뽑기

  RxList<dynamic> checkList = [].obs; //

  /// 자재 팝업 리스트
  RxList<dynamic> popUpDataList = [].obs;
  RxList<dynamic> selectedPopList = [].obs;
  RxList<dynamic> selectedItemPopContainer = [].obs;


  /// 그리드
  var rowDatas = <PlutoRow>[].obs;


  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime.now();
  DateTime firstDayOfMonth2 = DateTime.now();
  RxString dayStartValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayEndValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  RxList<dynamic> containerList = [{'CODE':'1', 'NAME': 'KIT 작업장'}].obs;
  RxMap<String, String> selectedContainer = {'CODE':'', 'NAME': 'KIT 작업장'}.obs;
  RxList<dynamic> itemGubunTotalContainerList = [].obs; // 자재 분류
  RxList<dynamic> itemGubunContainerList = [{'CODE':'70', 'NAME': '원자재'}].obs; // 자재 분류
  RxMap<String, String> selectedItemGubunContainer = {'CODE':'70', 'NAME': '원자재'}.obs;
  RxList<dynamic> dateContainerList = [{'CODE':'', 'NAME': ''}].obs; // 실사일
  RxMap<String, String> selectedDateContainer = {'CODE':'', 'NAME': ''}.obs;


  RxList<dynamic> isSelect = [].obs;

  RxString invCntDt = ''.obs;



  RxBool bLoading = false.obs;
  RxInt focusCnt = 0.obs;
  RxInt focusCnt2 = 0.obs;
  RxBool isSelectedInvnr = false.obs; // 거래명세서 선택된 값이 있는지 여부
  RxBool isDuplQr = false.obs; // 중복qr 선택된 값이 있는지 여부
  RxInt selectedInvnrIndex = 1.obs; // 선택된 거래명세서의 index
  RxString statusText = ''.obs;
  RxString statusText2 = ''.obs;
  RxString cheburnDate = ''.obs; // 채번날짜
  RxString cheburnInbNumber = ''.obs; // 끝 6자리
  RxString cheburnLotNumber = ''.obs; // 끝 6자리
  RxBool isQr = false.obs;
  RxBool isQr2 = false.obs;
  RxBool isChecked = false.obs;
  RxBool isCancelChecked = false.obs;
  RxBool isIpgoClick = false.obs;
  RxBool isIpgoClick2 = false.obs; // 소박스용
  RxBool isDbConnected = true.obs;
  RxBool successIpgo = false.obs;
  RxInt alertIndex = 0.obs;
  RxInt currentRowIndex = 0.obs; // 소박스 등록에서 왼쪽 선택된 리스트의 자재들이 우측 리스트에 보여주기 위함
  RxBool isFocus = false.obs;
  RxInt currentMasterIdx = 0.obs;
  RxBool duplicationLabel = false.obs;
  RxBool isCheckBool = true.obs;
  RxString isCheck = 'N'.obs;
  RxString invType = ''.obs;
  RxString invTypeCode = ''.obs;
  RxList<dynamic> cheburnIpgoLotList = [].obs; //




 /* /// 자재선택 프로시저
  Future<void> reqCommon3() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_SELECT_ITEM_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q1',
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
          'paramName': 'p_ITEM_CD',
          'paramValue': textSelectItemController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSelectItem(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          popUpDataList.addAll(retVal.body![1]);
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('reqCommon3 catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }*/

  /// 자재선택 프로시저
  Future<void> reqCommon3() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020', //A4041
      'procedure': 'USP_SELECT_ITEM_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q3',
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
          'paramName': 'p_ITEM_NM',
          'paramValue': textSelectItemNmController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },

      ]
    };

    try {
      final retVal = await HomeApi.to.reqSelectItem(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          popUpDataList.addAll(retVal.body![1]);
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('reqCommon3 catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }

  /// 공통 드롭다운 조회(zone) -> 존 구분
  Future<void> reqCommon2() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020', //A4041
      'procedure': 'USP_GET_COMMON_CODE_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'ZONE_M',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        /*   {
          'paramName': 'p_GRP_CD',
          'paramValue': 'ZONE_M',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },*/
      ]
    };

    try {
      final retVal = await HomeApi.to.reqZone(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

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

  /// 공통 드롭다운 조회(MM020) -> 자재 분류
  Future<void> reqCommon() async {
    itemGubunTotalContainerList.clear();
    itemGubunContainerList.clear();
    bLoading.value = true;

    var params = {
      'programId': 'A1020', //A4041
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
          'paramValue': 'MM020',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCommon(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          itemGubunTotalContainerList.addAll(retVal.body![1]);
          for(var i = 0; i < itemGubunTotalContainerList.length; i++) {
            itemGubunContainerList.add(
                {'CODE': '${itemGubunTotalContainerList[i]['DTL_CD']}',
                  'NAME': '${itemGubunTotalContainerList[i]['CD_NM']}'
                }

            );
          }
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


  /// 재고실사 QR 등록 - 행 추가
  Future<void> checkQrAddRowBtn() async {
    Get.log('QR 입력(행 추가)');

    bLoading.value = true;

    var params = {
      'programId': 'A1020', //A4041
      'procedure': 'USP_A4041_S01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'N2',
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
          'paramName': 'p_ITEM_CD',
          'paramValue': itemCdController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_INV_CNT_NO',
          'paramValue': inventoryCntList[currentMasterIdx.value]['invCntNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_INV_CNT_SEQ',
          'paramValue': null,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_LOT_NO',
          'paramValue': lotNoController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WH_CD',
          'paramValue': 'WH01',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_LOC_CD', // 실사 위치
          'paramValue': countLocController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_QTY', // 실사 수량 ->
          'paramValue': double.parse(countQtyController.text == '' ? '0' : countQtyController.text),
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_QTY_UNIT', // 단위 ->
          'paramValue': countSetQtyController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WHT', // 실사 개당단위수량 ->
          'paramValue': double.parse(countWhtController.text == '' ? '0' : countWhtController.text),
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WHT_UNIT', // 개당단위수량 단위 ->
          'paramValue': countSetWhtController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_IS_NEW', // 실사 수량 ->
          'paramValue': 'N',
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
      final retVal = await HomeApi.to.reqIpgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          Get.log('조회 성공');
          isDbConnected.value = true;
          statusText.value = '정상 조회되었습니다.';
        }else {
          statusText.value = retVal.body![0]['resultMessage'].toString();
          isDbConnected.value = false;
        }
      } else {
        Get.log('조회 실패');
      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
    }
  }
  /// 재고실사 삭제
  Future<void> checkDelete() async {
    Get.log('삭제 클릭!');

    bLoading.value = true;

    for(var i = 0; i < inventoryCntDetailList.length; i++) {
      if(checkList[i] == true) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A4041_S01',
          'params': [
            {
              'paramName': 'p_work_type',
              'paramValue': 'D2',
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
              'paramName': 'p_INV_CNT_NO',
              'paramValue': inventoryCntList[currentMasterIdx.value]['invCntNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INV_CNT_SEQ',
              'paramValue':  inventoryCntDetailList[i]['invCntSeq'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': inventoryCntDetailList[i]['tagNo'],//textQrController.text,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': inventoryCntDetailList[i]['ITEM_CD'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': inventoryCntDetailList[i]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_WH_CD',
              'paramValue': 'WH01',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_LOC_CD', // 실사 위치
              'paramValue': inventoryCntDetailList[i]['cntLocCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_WHT', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntWht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_WHT_UNIT', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntWhtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_QTY', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntQty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_QTY_UNIT', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntQtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_IS_NEW', // 실사 수량 ->
              'paramValue': 'N',
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
          final retVal = await HomeApi.to.reqIpgo(params);

          if (retVal.resultCode == '0000') {
            if(retVal.body![0]['returnMessage'] == '') {
              Get.log('삭제 성공');
              isDbConnected.value = true;
              statusText.value = '정상 삭제되었습니다.';
            }else {
              statusText.value = retVal.body![0]['returnMessage'].toString();
              isDbConnected.value = false;
            }
          } else {
            Get.log('조회 실패');

          }
        } catch (e) {
          Get.log('checkBtn catch !!!!');
          Get.log(e.toString());
          isDbConnected.value = false;
        } finally {
          bLoading.value = false;
        }
      }
    }
  }

  /// 재고실사 QR 등록 -- 업데이트용 (저장 버튼 클릭 시)
  Future<void> checkUpdate() async {
    Get.log('저장버튼 클릭!');

    bLoading.value = true;

    for(var i = 0; i < inventoryCntDetailList.length; i++) {
      Get.log('checkList:: ${checkList}');
      if(checkList[i] == true) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A4041_S01',
          'params': [
            {
              'paramName': 'p_work_type',
              'paramValue': 'N2',
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
              'paramName': 'p_INV_CNT_NO',
              'paramValue': inventoryCntList[currentMasterIdx.value]['invCntNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_INV_CNT_SEQ',
              'paramValue':  inventoryCntDetailList[i]['invCntSeq'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': inventoryCntDetailList[i]['tagNo'],//textQrController.text,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_ITEM_CD',
              'paramValue': inventoryCntDetailList[i]['itemCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_LOT_NO',
              'paramValue': inventoryCntDetailList[i]['lotNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_WH_CD',
              'paramValue': 'WH01',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_LOC_CD', // 실사 위치
              'paramValue': inventoryCntDetailList[i]['cntLocCd'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_WHT', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntWht'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_WHT_UNIT', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntWhtUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_QTY', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntQty'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CNT_QTY_UNIT', // 실사 수량 ->
              'paramValue': inventoryCntDetailList[i]['cntQtyUnit'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_IS_NEW', // 실사 수량 ->
              'paramValue': 'N',
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
          final retVal = await HomeApi.to.reqIpgo(params);

          if (retVal.resultCode == '0000') {
            if(retVal.body![0]['returnMessage'] == '') {
              Get.log('저장 성공');
              isDbConnected.value = true;
              statusText.value = '정상 조회되었습니다.';
            }else {
              statusText.value = retVal.body![0]['returnMessage'].toString();
              isDbConnected.value = false;
            }
          } else {
            Get.log('조회 실패');

          }
        } catch (e) {
          Get.log('checkBtn catch !!!!');
          Get.log(e.toString());
          isDbConnected.value = false;
        } finally {
          bLoading.value = false;
        }
      }
    }
  }

  /// 재고실사 QR 등록 -- TAG_M에 없을 때 or 신규
  Future<void> checkQrBtn2() async {
    Get.log('QR 입력');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4041_S01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'N2',
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
          'paramName': 'p_INV_CNT_NO',
          'paramValue': inventoryCntList[currentMasterIdx.value]['invCntNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_INV_CNT_SEQ',
          'paramValue': inventoryCntList[currentMasterIdx.value]['invCntSeq'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': isCheck.value == 'Y' ? textQrController.text : inventoryCntQrList[alertIndex.value]['TAG_NO'],//textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_ITEM_CD',
          'paramValue': inventoryCntQrList[alertIndex.value]['ITEM_CD'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_LOT_NO',
          'paramValue': inventoryCntQrList[alertIndex.value]['LOT_NO'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WH_CD',
          'paramValue': 'WH01',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_LOC_CD', // 실사 위치
          'paramValue': locTextS.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WHT', // 실사 수량 ->
          'paramValue': inventoryCntQrList[alertIndex.value]['WHT'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WHT_UNIT', // 실사 수량 ->
          'paramValue': inventoryCntQrList[alertIndex.value]['WHT_UNIT'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_QTY', // 실사 수량 ->
          'paramValue': inventoryCntQrList[alertIndex.value]['QTY'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_QTY_UNIT', // 실사 수량 ->
          'paramValue': inventoryCntQrList[alertIndex.value]['QTY_UNIT'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_IS_NEW', // 실사 수량 ->
          'paramValue': isCheck.value.toString(),
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
      final retVal = await HomeApi.to.reqIpgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['returnMessage'] == '') {
          Get.log('저장 성공');
          isDbConnected.value = true;
          statusText.value = '정상 조회되었습니다.';
        }else {
          statusText.value = retVal.body![0]['returnMessage'].toString();
          isDbConnected.value = false;
          statusText.value = retVal.body![0]['returnMessage'];
        }
      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
    }
  }

  /// 재고실사 qr코드 조회
  Future<void> checkQr() async {
    Get.log('조회 버튼 클릭');

    bLoading.value = true;
    inventoryCntQrList.clear();
    isSelect.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4041_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q3',
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
          'paramName': 'p_INV_CNT_NO',
          'paramValue': inventoryCntList[currentMasterIdx.value]['invCntNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_IS_NEW',
          'paramValue': isCheck.value.toString(),
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqInventoryCntQr(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          inventoryCntQrList.value.addAll(retVal.body![1]);
          Get.log('inventoryCntQrList ${inventoryCntQrList.value}');
          // 중복라벨의 경우
          if(inventoryCntQrList.length > 1) {
            // 신규랑 업데이트랑 나눠야한다.
            // 신규인지 업데이트인지 구별값
            duplicationLabel.value = true;
            for(var i = 0; i < inventoryCntQrList.length; i++) {
              isSelect.add(false);
            }
          }else {
            duplicationLabel.value = false;
          }

          Get.log(inventoryCntQrList.toString());
          Get.log('조회 성공');
          isDbConnected.value = true;
        }else {
          statusText.value = retVal.body![0]['resultMessage'].toString();
          isDbConnected.value = false;
          textQrController.text = '';
        }

      } else {
        Get.log('조회 실패');
        statusText.value = retVal.body![0]['resultMessage'].toString();
      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      isChecked.value = false;
    }
  }


  /// 재고실사 디테일 조회
  Future<void> checkDetailBtn() async {
    Get.log('조회 버튼 클릭');

    bLoading.value = true;
    inventoryCntDetailList.clear();
    checkList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4041_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q2',
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
          'paramName': 'P_INV_TYPE',
          'paramValue': selectedItemGubunContainer['CODE'], // 재고구분 선택된 CODE,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_INV_CNT_NO',
          'paramValue': inventoryCntList[currentMasterIdx.value]['invCntNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqIpgo(params);

      if (retVal.resultCode == '0000') {
        inventoryCntDetailList.value.addAll(retVal.body![1]);
        for(var i = 0; i < inventoryCntDetailList.length; i++) {
          inventoryCntDetailList[i].addAll({'no': i + 1});
          inventoryCntDetailList[i].addAll({'checkBox': ''});
          checkList.add(false);
        }

        Get.log(inventoryCntDetailList.toString());
        Get.log('조회 성공');
        isDbConnected.value = true;
      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      isChecked.value = false;
       plutoRow();
    }
  }


  /// 		CNT_LOC_CD = @p_CNT_LOC_CD,
  // 						CNT_ZONE_CD = (select ZONE_CD from LOC_M where plant = @p_PLANT and WH_CD = @p_WH_CD AND LOC_CD = @p_CNT_LOC_CD),
  // 						CNT_QTY = @p_CNT_QTY,
  // 						CNT_QTY_UNIT = @p_CNT_QTY_UNIT,
  // 						CNT_WHT = @p_CNT_WHT,
  // 						CNT_WHT_UNIT = @p_CNT_WHT_UNIT, 실사 무게 추가

  /// 재고실사 마스터 조회
  Future<void> checkMaster() async {
    Get.log('조회 버튼 클릭');

    bLoading.value = true;
    inventoryCntList.clear();
    invCntDtList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A4041_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q1',
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
          'paramName': 'P_INV_TYPE',
          'paramValue': '', // 재고구분 선택된 CODE,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CON_START_DATE',
          'paramValue': '20210101',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CON_END_DATE',
          'paramValue': DateFormat('yyyyMMdd').format(DateTime.now()),
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqInventoryCnt(params);

      if (retVal.resultCode == '0000') {
        inventoryCntList.value.addAll(retVal.body![1]);
        inventoryCntList.value = inventoryCntList.reversed.toList();
        if(inventoryCntList.isNotEmpty) {
          invCntDt.value = inventoryCntList[0]['invCntNm'];
        }

        for(var i = 0; i < inventoryCntList.length; i++) {
          invCntDtList.add(inventoryCntList[i]['invCntNm']);
        //  invCntDtList.add(inventoryCntList[i]['invCntNo']);
        }
        Get.log(inventoryCntList.toString());
        Get.log('조회 성공');
        isDbConnected.value = true;
      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      isChecked.value = false;
     // plutoRow();
    }
  }


  Future<void> plutoRow() async {
    rowDatas.value = List<PlutoRow>.generate(inventoryCntDetailList.length, (index) =>
        PlutoRow(cells:
        Map.from((inventoryCntDetailList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: key == 'cntWhtUnit' ? value == null || value == '' ? 'EA' : value : value ?? '' )),
        )))
    ).reversed.toList();

    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas);
    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }



  final FocusNode focusNode = FocusNode();

  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
  }



  @override
  void onClose() {
    Get.log('IpgoController - onClose !!');
    focusNode.dispose(); // FocusNode 해제
    super.onClose();
  }

  @override
  void onInit() async {
    Get.log('IpgoController - onInit !!');
    super.onInit();
    await reqCommon();
    await checkMaster();
    if(inventoryCntList.isNotEmpty) {
      invType.value = inventoryCntList[currentMasterIdx.value]['invType'];
      switch(invType.value) {
        case '원자재':
          invTypeCode.value = '70';
          break;
        case '반제품':
          invTypeCode.value = '60';
          break;
        case '상품':
          invTypeCode.value = '40';
          break;

      }
    }

  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
