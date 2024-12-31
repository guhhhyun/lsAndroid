

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


  /// 추가 시 필요 controller

  var itemCdController = TextEditingController();
  var lotNoController = TextEditingController();
  var countLocController = TextEditingController();
  var countQtyController = TextEditingController();
  var countSetQtyController = TextEditingController();
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

  RxList<dynamic> inventoryCntDetailList = [].obs; // 재고실사 마스터 리스트
  RxList<dynamic> inventoryCntSaveDetailList = [].obs; // 재고실사 QR 정보 리스트


  RxList<dynamic> addRowList = [].obs; //행추가
  var insertRow = <PlutoRow>[].obs;

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
  RxList<dynamic> itemGubunContainerList = [{'CODE':'', 'NAME': '전체'}].obs; // 자재 분류
  RxMap<String, String> selectedItemGubunContainer = {'CODE':'', 'NAME': '전체'}.obs;
  RxList<dynamic> dateContainerList = [{'CODE':'', 'NAME': ''}].obs; // 실사일
  RxMap<String, String> selectedDateContainer = {'CODE':'', 'NAME': ''}.obs;



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
  RxInt alertIndex = 3.obs;
  RxInt currentRowIndex = 0.obs; // 소박스 등록에서 왼쪽 선택된 리스트의 자재들이 우측 리스트에 보여주기 위함
  RxBool isFocus = false.obs;

  /// 공통 드롭다운 조회(zone) -> 존 구분
  Future<void> reqCommon2() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020',
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
   // itemGubunContainerList.clear();
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

  /// 재고실사 QR 등록 - 최초?
  Future<void> checkQrBtn() async {
    Get.log('QR 입력');

    bLoading.value = true;
    inventoryCntList.clear();

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
          'paramValue': inventoryCntList[0]['invCntNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WH_CD',
          'paramValue': '',
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
          'paramName': 'p_CNT_QTY', // 실사 수량 ->
          'paramValue': '',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_QTY_UNIT',
          'paramValue': '',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WHT',
          'paramValue': '',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CNT_WHT_UNIT',
          'paramValue': '',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqIpgo(params);

      if (retVal.resultCode == '0000') {
        inventoryCntSaveList.value.addAll(retVal.body![1]);

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
      plutoRow();
    }
  }

  /// 재고실사 디테일 조회
  Future<void> checkDetailBtn() async {
    Get.log('조회 버튼 클릭');

    bLoading.value = true;
    inventoryCntDetailList.clear();

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
          'paramName': 'p_INV_CNT_NO',
          'paramValue': inventoryCntList[0]['invCntNo'],
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
    }
  }


  /// 재고실사 마스터 조회
  Future<void> checkMaster() async {
    Get.log('조회 버튼 클릭');

    bLoading.value = true;
    inventoryCntList.clear();

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
          'paramValue': selectedItemGubunContainer['CODE'], // 재고구분 선택된 CODE,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CON_START_DATE',
          'paramValue': '20241226',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CON_END_DATE',
          'paramValue': '20241226',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqInventoryCnt(params);

      if (retVal.resultCode == '0000') {
        inventoryCntList.value.addAll(retVal.body![1]);

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
      plutoRow();
    }
  }


  Future<void> plutoRow() async {
    rowDatas.value = List<PlutoRow>.generate(inventoryCntList.length, (index) =>
        PlutoRow(cells:
        Map.from((inventoryCntList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
        )))
    );
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

  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
