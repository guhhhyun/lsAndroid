

import 'dart:ffi';

import 'package:flutter/services.dart';
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

  /// bom
  var textSaleOrdController = TextEditingController();
  var textItemCdController2 = TextEditingController(); // 제조번호
  var textPrdOrdController = TextEditingController();


  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;
  late  PlutoGridStateManager gridStateMgr3;
  late  PlutoGridStateManager gridStateMgr4;

  /// bom
  late  PlutoGridStateManager stateManager3;
  late  PlutoGridStateManager stateManager4;

  /// 리스트
 // RxList<dynamic> pickingFirstList = [].obs; // 피킹 첫번째 조회된 리스트
 // RxList<dynamic> pickingSecondList = [].obs; // 피킹 두번째 조회된 리스트
  RxList<dynamic> pickingThirdList = [].obs; // 피킹 세번째 조회된 리스트
  RxList<dynamic> registRackIpgoList = [].obs; // 최종 리스트(qr입력마다 다 넣어준 리스트)
  RxList<dynamic> registPickingList = [].obs; //
  RxList<dynamic> registPickingList2 = [].obs; //
  RxList<dynamic> chulList = [].obs; //
  RxList<dynamic> chulOneList = [].obs; //
  RxList<dynamic> chulSecondList = [].obs; //
  RxList<dynamic> uniqueChulSecondList = [].obs; //중복 제거된 리스트 두번째 화면에서 쓰임
  RxList<dynamic> itemChulSecondList = [].obs; //중복 제거된 리스트에서 선택된 리스트의 자재들 리스트
  RxList<RxList<dynamic>> itemTotalList = [[].obs].obs;
  RxList<dynamic> noList = [].obs;
  RxSet<String> changedRows = <String>{}.obs;


  /// bom
  RxList<dynamic> bomList = [].obs; //bom 마스터
  RxList<dynamic> bomDetailList = [].obs; //bom 마스터
  RxList<dynamic> bomConfirm = [{'CODE':'N', 'NAME':'미확인'}, {'CODE':'Y', 'NAME':'변경 확정'}, {'CODE':'N', 'NAME':'변경 제외'},].obs;
  RxList<dynamic> bomGubun = [{'CODE':'', 'NAME':'전체'}, {'CODE':'10', 'NAME':'작업표준'}, {'CODE':'30', 'NAME':'설계BOM'}, {'CODE':'40', 'NAME':'생산BOM'},].obs;
  RxMap<String, String> selectedGubun = {'CODE':'', 'NAME':'전체'}.obs;
  RxBool isBomSave = false.obs;
  RxString isBomSaveText = ''.obs;
  RxInt bomCurrentIdx = 0.obs;

  RxList<dynamic> chulThirdList = [].obs; //

  RxList<dynamic> scanOxList = [].obs; //
  RxList<dynamic> scanOxList2 = [].obs; //

  RxInt numbering = 1.obs;
  RxBool isText = true.obs;


  RxDouble height = 0.0.obs;

  RxInt rowspan = 0.obs;

  RxBool tete = false.obs;



  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;
  var rowDatas3 = <PlutoRow>[].obs;
  var rowDatas4 = <PlutoRow>[].obs;

  List<PlutoRow> insertRow = [];

  /// bom
  var rows3 = <PlutoRow>[].obs;
  var rows4 = <PlutoRow>[].obs;



  RxMap<String, String> selectedChulgoContainer = {'CODE':'', 'NAME': '전체'}.obs;
  RxList<dynamic> chulgoList = [{'CODE':'', 'NAME': '전체'}].obs;
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
  RxInt currentRowIndex = 0.obs;
  RxBool isPlutoRow2 = false.obs;
  RxBool isQr = false.obs;
  RxBool isFocus = false.obs;
  RxBool isDbConnected = true.obs;

  RxBool isRegistChulgo = false.obs;


  /// 출고 등록/취소
  Future<void> registChulgoBtn(int flag) async {
    Get.log('출고등록 클릭');

    bLoading.value = true;

      var params = {
        'programId': 'A1020', //A3020
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

        if(retVal.body![0]['resultMessage'] == '') {
          Get.log('등록되었습니다');
          isDbConnected.value = true;
          isRegistChulgo.value = true;
        } else {
          Get.log('등록 실패');
          isRegistChulgo.value = false;
        }
      } catch (e) {
        Get.log('registIpgoBtn catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;

      }

  }

  /// 공통 드롭다운 조회(INB_TYPE) -> 입고구분
  Future<void> reqCommon() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020', //A3020
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
                  'NAME': '${chulgoTotalList[i]['CD_NM']}(${chulgoTotalList[i]['ETC1']})'
                }

            );
          }
          Get.log('조회 성공');
          Get.log('$chulgoList');
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


  /// 출고등록 세번째 조회
  Future<void> reqChulThird() async {
    Get.log('조회');

    bLoading.value = true;
    chulThirdList.clear();

    var params = {
      'programId': 'A1020', //A3020
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
          isDbConnected.value = true;
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
      isDbConnected.value = false;
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
    noList.clear();
    changedRows.clear();

    var params = {
      'programId': 'A1020', //A3020
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
            chulSecondList[i].addAll({'scanNm': chulSecondList[i]['scan'] == false ? 'X' : 'O'});
            chulSecondList[i]['scan'] == false ? scanOxList.add('X') : scanOxList.add('O');
            if(chulSecondList[i]['scan'] == true) {
              if(chulSecondList[i]['boxNo'] != null) {
                noList.add(chulSecondList[i]['boxNo']);
              }else {
                noList.add(chulSecondList[i]['tagNo']);
              }
            }

            chulSecondList[i].addAll({'chulgoType': ''});
          }

          uniqueChulSecondList.value = chulSecondList
              .fold<Map<String, dynamic>>({}, (map, item) {
            map[item['no'].toString()] = item; // no 키로 사용하여 중복 제거
            return map;
          }).values.toList();
          for(var i = 0; i < uniqueChulSecondList.length; i++) {
            uniqueChulSecondList[i].addAll({'noV': '${i+1}'});
          }

          Get.log('uniqueChulSecondList: ${uniqueChulSecondList}');
          Get.log('조회 성공');
          isDbConnected.value = true;
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
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
     await plutoRow2();
      await  plutoRow3();
      await  plutoRow4();
    }
  }


  /// 출고등록 조회1
  Future<void> checkQR() async {
    Get.log('조회');

    bLoading.value = true;
    chulList.clear();

    var params = {
      'programId': 'A1020', //A3020
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
          isDbConnected.value = true;
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
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      plutoRow();
    //  plutoRow2();
    }
  }

  /// 출고등록 조회2
  Future<void> checkQR2() async {
    Get.log('조회');

    bLoading.value = true;
    chulOneList.clear();

    var params = {
      'programId': 'A1020', //A3020
      'procedure': 'USP_A3020_R01',
      'params': [
        { "paramName": "p_work_type", "paramValue": "Q", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PLANT", "paramValue": "1302", "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_DT_FR", "paramValue": dayStartValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_DT_TO", "paramValue": dayEndValue.value.replaceAll('-', ''), "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_SO_NO", "paramValue": textOrderController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_PJT_NM", "paramValue": textProjectController.text, "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_TYPE", "paramValue": selectedChulgoContainer['CODE'], "paramJdbcType": "VARCHAR", "paramMode": "IN"},
        { "paramName": "p_DEL_ORD_NO", "paramValue": chulList[currentFirstIndex.value]['delOrdNo'], "paramJdbcType": "VARCHAR", "paramMode": "IN"}
      ]
    };

    try {
      final retVal = await HomeApi.to.reqChulgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          chulOneList.addAll(retVal.body![1]);
          for(var i = 0; i < chulOneList.length; i++) {
            chulOneList[i].addAll({'chulgoType': ''});
          }

          Get.log('조회 성공');
          isDbConnected.value = true;
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
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
    }
  }

  /// BOM 저장
  Future<void> registBomSave() async {
    for(var i = 0; i < bomDetailList.length; i++) {
      var params = {
        'programId': 'A1020', //A3020
        'procedure': 'USP_CHK_BOM_S01',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': 'U',
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
            'paramName': 'p_BC_ID',
            'paramValue': bomDetailList[i]['bcId'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_BC_SEQ',
            'paramValue': bomDetailList[i]['bcSeq'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CHG_CF_FLAG',
            'paramValue': bomDetailList[i]['chgCfFlag'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CHG_CF_RMK',
            'paramValue': bomDetailList[i]['chgCfRmk'],
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

        final retVal = await HomeApi.to.registSmallKitSave(params);

        if(retVal.body![0]['resultMessage'] == '') {
          Get.log('등록되었습니다');
          isBomSave.value = true;
          isBomSaveText.value = '저장되었습니다.';
          isDbConnected.value = true;
        } else {
          Get.log('등록 실패');
          isBomSave.value = false;
          isBomSaveText.value = retVal.body![0]['resultMessage'];
        }

      } catch (e) {
        Get.log('registMemoSmallKitSave catch !!!!');
        Get.log(e.toString());
        isBomSaveText.value = '저장에 실패하였습니다.';
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
      }
    }

  }




  /// BOM 조회
  Future<void> reqBom() async {
    Get.log('BOM 조회');

    bLoading.value = true;
    bomList.clear();


    var params = {
      'programId': 'A2065',
      'procedure': 'USP_CHK_BOM_R01',
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
          'paramName': 'p_BC_ID',
          'paramValue': chulOneList[0]['mstKey'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_SO_NO',
          'paramValue': chulOneList[0]['soNo'], // 판매오더
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PITM_CD',
          'paramValue': '',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqBom(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          bomList.addAll(retVal.body![1]);


          Get.log('조회 성공');
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('BOM catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      plutoRowNew3();
    }
  }

  /// BOM 디테일 조회
  Future<void> reqBomDetail() async {
    Get.log('BOM 조회');

    bLoading.value = true;
    bomDetailList.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_CHK_BOM_R01',
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
          'paramName': 'p_BC_ID',
          'paramValue': bomList[bomCurrentIdx.value]['bcId'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_SO_NO',
          'paramValue': '', // 판매오더
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PITM_CD',
          'paramValue': '', //제품코드
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqBom(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          bomDetailList.addAll(retVal.body![1]);

          Get.log('조회 성공');
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('BOM catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      plutoRowNew4(); // 4로 바꾸기
    }
  }

  /// bom 마스터 리스트
  Future<void> plutoRowNew3() async {
    rows3.value = List<PlutoRow>.generate(
        bomList.length,
            (index) => PlutoRow(
            cells: Map.from((bomList[index]).map(
                  (key, value) => MapEntry(key, PlutoCell(value: value == null ? '' : value)),
            ))));
    stateManager3.removeAllRows();
    stateManager3.appendRows(rows3.value);
    //stateManager.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  /// bom 마스터 리스트
  Future<void> plutoRowNew4() async {
    rows4.value = List<PlutoRow>.generate(
        bomDetailList.length,
            (index) => PlutoRow(
            cells: Map.from((bomDetailList[index]).map(
                  (key, value) => MapEntry(key, PlutoCell(value: value == null ? '' : value)),
            ))));
    stateManager4.removeAllRows();
    stateManager4.appendRows(rows4.value);
    //stateManager.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }



  Future<void> plutoRow4() async {
    rowDatas4.value = List<PlutoRow>.generate(
      chulOneList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (chulOneList[index]).map((key, value) => MapEntry(
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

  }

  Future<void> plutoRow3() async {
    itemTotalList.clear();
    Map<dynamic, List<Map<String, dynamic>>> groupedMap = {};
    // chulSecondList를 순회하면서 no 값을 키로 그룹화
    for (var item in chulSecondList) {
      var key = item['no'];
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

  Future<void> plutoRow2() async {

    rowDatas2.value = List<PlutoRow>.generate(
      uniqueChulSecondList.length,
          (index) => PlutoRow(
        cells: Map.from(
          (uniqueChulSecondList[index]).map((key, value) => MapEntry(
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
  }


  Future<void> plutoRow() async {
   var name ='';
  /*  rowDatas.value = List<PlutoRow>.generate(chulList.length, (index) =>
        PlutoRow(cells:
        Map.from((chulList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? ''
                : key == 'delOrdType' ? {
              name = chulgoList
                .firstWhere((item) => item['CODE'] == value, orElse: () => {'NAME': ''})['NAME'],
              value = name
            } :


            *//*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : *//*value )),
        )))
    );*/


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

   /*rowDatas2.value = List<PlutoRow>.generate(
     uniqueChulSecondList.length,
         (index) => PlutoRow(
       cells: Map.from(
         (uniqueChulSecondList[index]).map((key, value) => MapEntry(
           key,
           PlutoCell(
             value: value == null
                 ? ''

                 : value,
           ),
         )),
       ),
     ),
   );*/


    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas.value);

    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }
  final focusNode = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode2Key = FocusNode();


  void requestFocus() {
    Future.microtask(() => focusNode2.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    isQr.value = true;
  }

  void requestFocus2() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    isQr.value = true;
  }

  Future<void> test() async{
    gridStateMgr2.rowColorCallback!;
    // 그리드 재렌더링
    gridStateMgr2.notifyListeners();
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
