

import 'dart:ffi';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class ChulgoController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();

  var textQrController = TextEditingController();
  var textProjectController = TextEditingController();
  var textProjectController2 = TextEditingController();
  var textItemCdController = TextEditingController();
  var textItemNmController = TextEditingController();
  var textWrkNoController = TextEditingController(); // 제조번호
  var textOrderController = TextEditingController();


  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;


  /// 리스트
 // RxList<dynamic> pickingFirstList = [].obs; // 피킹 첫번째 조회된 리스트
 // RxList<dynamic> pickingSecondList = [].obs; // 피킹 두번째 조회된 리스트
  RxList<dynamic> pickingThirdList = [].obs; // 피킹 세번째 조회된 리스트
  RxList<dynamic> registRackIpgoList = [].obs; // 최종 리스트(qr입력마다 다 넣어준 리스트)
  RxList<dynamic> registPickingList = [].obs; //
  RxList<dynamic> registPickingList2 = [].obs; //
  RxList<dynamic> chulList = [].obs; //
  RxList<dynamic> chulSecondList = [].obs; //
  RxList<dynamic> chulThirdList = [].obs; //

  RxList<dynamic> scanOxList = [].obs; //

  RxInt numbering = 1.obs;
  RxBool isText = true.obs;


  RxDouble height = 0.0.obs;

  RxInt rowspan = 0.obs;



  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;

  List<PlutoRow> insertRow = [];



  RxMap<String, String> selectedChulgoContainer = {'CODE':'', 'NAME': ''}.obs;
  RxList<dynamic> chulgoList = [{'CODE':'', 'NAME': ''}].obs;
  RxList<dynamic> chulgoTotalList = [].obs;



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
  RxBool isSelectedInvnr = false.obs; // 거래명세서 선택된 값이 있는지 여부
  RxBool isDuplQr = false.obs; // 중복qr 선택된 값이 있는지 여부
  RxInt selectedInvnrIndex = 0.obs; // 선택된 거래명세서의 index
  RxString statusText = ''.obs;



  RxList<TableRow> tableRows = <TableRow>[].obs;
  RxString previousPickNo = ''.obs;
  RxInt previousPjtNm = 0.obs;
  RxInt previousSoNo = 0.obs;
  RxInt previousPitmCd = 0.obs;
  RxInt previousPitmNm = 0.obs;
  RxString previousItemCd = ''.obs;
  RxString previousItemNm = ''.obs;
  RxInt previousWrkNo = 0.obs;
  RxInt previousPickOrdQty = 0.obs;
  RxInt previousPickQty = 0.obs;
  RxBool previousOthRackOutBtnVisible = false.obs;
  RxInt previousLocCd = 0.obs;
  RxInt previousPickRank = 0.obs;
  RxInt previousRackOutBtn = 0.obs;
  RxInt previousOthRackOutBtn = 0.obs;
  RxBool isSameRow = false.obs;
  var isSamePickNo = false.obs;
  var isSamePjtNm = false.obs;
  var isSameSoNo = false.obs;
  var isSamePitmCd = false.obs;
  var isSamePitmNm = false.obs;
  var isSameWrkNo = false.obs;
  var isSamePickOrdQty = false.obs;
  var isSamePickQty = false.obs;
  var isSameLocCd = false.obs;
  var isSamePickRank = false.obs;
  var isSameRackOutBtn = false.obs;
  var isSameOthRackOutBtn = false.obs;
  var isFirstInGroup = <String, bool>{}.obs;

  RxBool isRegistRackBtn = false.obs; // 랙출고 성공여부
  RxBool isRegistOtherRackBtn = false.obs; // 다른위치 랙출고 성공여부
  RxBool isChulgo = false.obs; // 출고등록 가능여부
  RxString exelFileName = ''.obs; // 엑셀파일 이름
  RxString pdfFileName = ''.obs; // pdf파일 이름
  RxBool isExelSuc = false.obs; // 엑셀파일생성 성공여부
  RxBool isPdfSuc = false.obs; // PDF 파일생성 성공여부

  RxString delOrdNo = ''.obs;
  RxString otbNo = ''.obs;
  RxInt selectedRow = 0.obs;
  RxString scanText = ''.obs;
  RxBool isSuccessThird = false.obs;


  /// 출고 등록/취소
  Future<void> registChulgoBtn(int flag) async {
    Get.log('출고등록 클릭');

    bLoading.value = true;

      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A3020_S01',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': flag == 0 ? 'N' : 'C',
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
            'paramName': 'p_DEL_ORD_NO',
            'paramValue': chulList[currentFirstIndex.value]['delOrdNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_OTB_NO',
            'paramValue': chulList[currentFirstIndex.value]['otbNo'],
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
        final retVal = await HomeApi.to.registChulgo(params);

        if (retVal == '0000') {
          Get.log('등록되었습니다');

        } else {
          Get.log('등록 실패');

        }
      } catch (e) {
        Get.log('registIpgoBtn catch !!!!');
        Get.log(e.toString());
      } finally {
        bLoading.value = false;

      }

  }

  /// 공통 드롭다운 조회(INB_TYPE) -> 입고구분
  Future<void> reqCommon() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

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
        { "paramName": "p_DEL_ORD_NO", "paramValue": chulList[currentFirstIndex.value]['delOrdNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"},
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

  /// 출고등록 두번째 조회
  Future<void> reqChulSecond() async {
    Get.log('조회');

    bLoading.value = true;
    chulSecondList.clear();
    scanOxList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A3020_R02',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_NO", "paramValue": chulList[currentFirstIndex.value]['delOrdNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqChulSecond(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          chulSecondList.addAll(retVal.body![1]);
          for(var i = 0; i < chulSecondList.length; i++) {
            chulSecondList[i]['scan'] == false ? scanOxList.add('X') : scanOxList.add('O');

            chulSecondList[i].addAll({'chulgoType': ''});
          }
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


  /// 출고등록 조회1
  Future<void> checkQR() async {
    Get.log('조회');

    bLoading.value = true;
    chulList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A3020_R01',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_DT_FR", "paramValue": dayStartValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_DT_TO", "paramValue": dayEndValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_SO_NO", "paramValue": textOrderController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PJT_NM", "paramValue": textProjectController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_TYPE", "paramValue": selectedChulgoContainer['CODE'], "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_NO", "paramValue": "", "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqChulgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          chulList.addAll(retVal.body![1]);
          for(var i = 0; i < chulList.length; i++) {
            chulList[i].addAll({'chulgoType': ''});
          }

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



  Future<void> plutoRow() async {
    rowDatas.value = List<PlutoRow>.generate(chulList.length, (index) =>
        PlutoRow(cells:
        Map.from((chulList[index]).map((key, value) =>
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
    chulList.clear();
    reqCommon();
  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
