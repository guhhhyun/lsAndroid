

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class SmallKitController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();


  RxSet<String> changedRows = <String>{}.obs; // 동기화 시에
  RxSet<String> changedRows2 = <String>{}.obs;
  /// 리스트
  var rows = <PlutoRow>[].obs;
  var rows2 = <PlutoRow>[].obs;
  var rows3 = <PlutoRow>[].obs; //BOM
  var rows4 = <PlutoRow>[].obs; //BOM2
  var newRows = <PlutoRow>[].obs;

  var insertRow = <PlutoRow>[].obs;
  RxList<dynamic> isRow = [].obs; // 리스트 길이만큼 false 추가용

  RxList<dynamic> smallBoxList = [].obs; // 소박스 qr찍고 난 정보
  RxList<dynamic> smallBoxDataList = [].obs; // 정합성 체크 담는 그릇 -> 메인 KIT의  R02 느낌
  RxList<dynamic> isSelect = [].obs;
  RxList<dynamic> isSelect2 = [].obs;
  RxList<dynamic> smallBoxItemDataList = [].obs; // 구성자재 조회
  RxList<dynamic> smallBoxItemSaveDataList = [].obs; // 저장된 구성자재 조회
  RxList<dynamic> smallBoxSave = [].obs;
  RxList<dynamic> smallBoxSaveList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트
  RxList<dynamic> smallBoxDetailList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트

  RxList<dynamic> smallBoxTagTypeList = [].obs; // q2 TAG타입 확인용

  RxList<dynamic> reasonDropdownTotalList = [].obs;
  RxList<dynamic> reasonDropdownList = [{'CODE':'', 'NAME': ''}].obs;
  RxMap<String, String> selectedReasonDropdown = {'CODE':'', 'NAME': ''}.obs;
  RxList<dynamic> reasonNames = [].obs;
  RxList<dynamic> bomConfirm = [{'CODE':'', 'NAME':''},{'CODE':'10', 'NAME':'미확인'}, {'CODE':'20', 'NAME':'변경 확정'}, {'CODE':'30', 'NAME':'변경 제외'},].obs;
  RxList<dynamic> bomConfirmNames = ['','미확인','변경 확정','변경 제외'].obs;

  RxList<dynamic> bomGubun = [{'CODE':'', 'NAME':'전체'}, {'CODE':'10', 'NAME':'작업표준'}, {'CODE':'30', 'NAME':'설계BOM'}, {'CODE':'40', 'NAME':'생산BOM'},].obs;
  RxMap<String, String> selectedGubun = {'CODE':'', 'NAME':'전체'}.obs;

  RxList<dynamic> bomList = [].obs; // bom list정보
  RxList<dynamic> bomDetailList = [].obs; // bom 디테일 list정보

  /// 동기화 자재 팝업 리스트
  RxList<dynamic> popUpDataList = [].obs;
  RxList<dynamic> selectedPopList = [].obs;
  RxList<dynamic> selectedItemPopContainer = [].obs;
  RxString selectedQrNo = ''.obs;
  RxInt noTagIdx = 0.obs;

  /// 중복qr 자재 팝업 리스트
  RxList<dynamic> popUpDataList2 = [].obs;
  RxList<dynamic> selectedPopList2 = [].obs;
  RxList<dynamic> selectedItemPopContainer2 = [].obs;
  RxString selectedQrNo2 = ''.obs;
  RxInt noTagIdx2 = 0.obs;


  /// 자재선택
  RxList<dynamic> selectedItemList = [].obs; // 자재선택 담는 그릇


  late PlutoGridStateManager stateManager;
  late PlutoGridStateManager stateManager2;
  late PlutoGridStateManager stateManager3; // BOM 리스트
  late PlutoGridStateManager stateManager4; // BOM 리스트 디테일
  TextEditingController textQrController = TextEditingController();
  TextEditingController textMemoController = TextEditingController();
  TextEditingController textWeightController = TextEditingController();
  TextEditingController textWeightController2 = TextEditingController();

  /// BOM
  TextEditingController textSaleOrdController = TextEditingController();
  TextEditingController textItemCdController = TextEditingController();
  TextEditingController textPrdOrdController = TextEditingController();


  RxInt focusCnt = 0.obs;
  RxString projectNm = ''.obs;
  RxString itemCdNm = ''.obs;
  RxString wrkNo = ''.obs;
  RxString boxNo = ''.obs;
  RxString bcSts = ''.obs;
  RxString wrkCfmDt = ''.obs;
  RxString boxWht = ''.obs;
  RxInt no = 990.obs;
  RxList<dynamic> noList = [].obs;
  RxList<dynamic> noList2 = [].obs;
  RxBool duplicationQr = false.obs; // 이미 스캔한 자재를 또 스캔했을 때
  RxBool duplicationQr2 = false.obs; // 이미 스캔한 자재를 또 스캔했을 때
  RxDouble gridHeight = 0.0.obs; // 그리드 높이 동적으로
  RxBool isDropdownEnabled = false.obs;
  RxBool isDonggihwa = false.obs;
  RxBool firstDonggihwa = false.obs;

  RxBool bLoading = false.obs;
  RxString statusText = ''.obs;
  RxInt startIndex = 0.obs;
  RxInt dupSaveListIndex = 0.obs; // 우측리스트에 이미 있는 자재qr 자재 입력 시 우측리스트의 해당 자재 index
  RxBool isColor = false.obs;
  RxBool isSaveColor = false.obs;
  RxBool isDonggi = false.obs; // 동기화 여부
  RxBool isSave = false.obs; //저장성공 여부
  RxString isSaveText = ''.obs; //저장 불가능상태 이유
  RxBool isBomSave = false.obs; //BOM 저장성공 여부
  RxString isBomSaveText = ''.obs; //BOM 저장 불가능상태 이유
  RxBool isConfirm = false.obs; //확정 가능상태 여부
  RxString isConfirmText = ''.obs; //확정 불가능상태 이유
  RxBool noSync = false.obs; // 이전에 동기화된 내역 확인
  RxBool isQrFocus = false.obs;

  RxBool isSaveClick = false.obs; // 중복클릭 방지
  RxBool isConfirmClick = false.obs; // 중복클릭 방지
  RxBool isDbConnected = true.obs;
  RxString smallboxNumbering = ''.obs;

  RxBool isText = false.obs; // 소박스 텍스트 출력할지
  RxString cellValue = ''.obs;

  RxBool isSmallBoxDataList = false.obs;
  RxInt alertIndex = 0.obs;
  RxBool isCancelIpgo = false.obs;

  /// 동기화 필요 변수
  RxString cbxSuNoDonggihwa = ''.obs;
  RxString cbxSuSeqDonggihwa = ''.obs;
  RxString wrkQtyDonggihwa = ''.obs;
  RxString ncbxRmkDonggihwa = ''.obs;
  RxBool isSuccsessDong = true.obs;
  RxString qrDonggihwa = ''.obs;

  /// bom관련
  RxInt bomCurrentIdx = 0.obs; // 마스터 선택 idx



  /// 자재선택 프로시저
  Future<void> reqCommon3(String itemCd) async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020', //A2025
      'procedure': 'USP_A2025_R02',
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
          'paramValue': itemCd,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSelectItem(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          popUpDataList.clear();
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




  /// 신규 저장 !!!!!!!!! 단건 바로바로 저장용도!!!!!!
  /// 저장
  Future<void> registNewSave() async {
    Get.log('저장 클릭');

    bLoading.value = true;
      var params = {
        'programId': 'A1020', //A2025
        'procedure': 'USP_A2025_S01',
        'params': [
          {
            'paramName': 'p_INIT',
            'paramValue': smallBoxSaveList.isEmpty ? '0' : '1',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_DETAIL',
            'paramValue': 'N',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_work_type',
            'paramValue': 'N6',
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
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxSave[0]['cbxSuNo'] == null ? null : '${smallBoxSave[0]['cbxSuNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_SEQ',
            'paramValue': smallBoxSave[0]['cbxSuSeq'] == null ? null :'${smallBoxSave[0]['cbxSuSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          /* {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': '${smallBoxList[i]['scanSeq']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },*/
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_CBX_QTY',
            'paramValue': smallBoxSave[0]['setCbxQty'] == null ? null :'${smallBoxSave[0]['setCbxQty']}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_QTY',
            'paramValue': smallBoxSave[0]['cbxQty'] == null ? null :'${smallBoxSave[0]['cbxQty'].toString().trim()}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_QTY',
            'paramValue': smallBoxSave[0]['setQty'] == null ? null :'${smallBoxSave[0]['setQty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QTY_UNIT',
            'paramValue': smallBoxSave[0]['qtyUnit'] == null ? null :'${smallBoxSave[0]['qtyUnit'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_YN', // 동기화 말고 스캔했는지 여부 y,n
            'paramValue': smallBoxSave[0]['scanYn'] == null ? null :'${smallBoxSave[0]['scanYn'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_NO', // 동기화 말고 스캔했을 때 넘버
            'paramValue': smallBoxSave[0]['scanNo'] == null ? null :'${smallBoxSave[0]['scanNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TAG_NO', // 스캔 넘버랑 똑같은거 넘겨주자 q2 에서 조회해서 주자 걍
            'paramValue': smallBoxSave[0]['tagNo'] == null ? null :'${smallBoxSave[0]['tagNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY', // 총 넘겨준 수량
            'paramValue': smallBoxSave[0]['newQty'] == null ? null :'${smallBoxSave[0]['newQty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_NCBX_RMK', // 선택한 사유
            'paramValue': smallBoxSave[0]['ncbxRmk'] == null ? null :'${smallBoxSave[0]['ncbxRmk'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY_SYNC', // 동기화 후 수량???
            'paramValue': smallBoxSave[0]['prtNo'] == 'O' ? smallBoxSave[0]['wrkQtySync'] == null ? null :'${smallBoxSave[0]['wrkQtySync']}' : 0, //
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SYNC_YN', // 동기화 여부
            'paramValue': smallBoxSave[0]['prtNo'] == 'O' ? 'Y':'', //syncYn
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_CD', // Q2에 있음
            'paramValue': smallBoxSave[0]['vendCd'] == null ? null :'${smallBoxSave[0]['vendCd']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_NM', // Q2에 있음
            'paramValue': smallBoxSave[0]['vendNm'] == null ? null :'${smallBoxSave[0]['vendNm']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_REMARK', // ''
            'paramValue': '',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_SCAN_NO',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_TAG_NO',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_WRK_QTY',
            'paramValue': null,
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
        if(smallBoxSave[0]['extrVal'] != 'D') {
          final retVal = await HomeApi.to.registSmallKitSave(params);

          if(retVal.body![0]['resultMessage'] == '') {
            Get.log('등록되었습니다');
            isSave.value = true;
            isSaveText.value = '저장되었습니다.';
            isDbConnected.value = true;
          } else {
            Get.log('등록 실패');
            isSave.value = false;
            isSaveText.value = retVal.body![0]['resultMessage'];
          }
        }

      } catch (e) {
        Get.log('registSmallKitSave catch !!!!');
        Get.log(e.toString());
        isSaveText.value = '저장에 실패하였습니다.';
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isConfirmClick.value = false;
        isSaveClick.value = false;
      }

  }



  /// 신규 디테일 저장!!!!!!!!
  /// 디테일 저장
  Future<void> registNewDetailSave() async {
    Get.log('디테일 저장 클릭');

    bLoading.value = true;

      var params = {
        'programId': 'A1020', //A2025
        'procedure': 'USP_A2025_S01',
        'params': [

          {
            'paramName': 'p_INIT',
            'paramValue': smallBoxSaveList.isEmpty ? '0' : '1',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_DETAIL',
            'paramValue': 'Y',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_work_type',
            'paramValue': 'N6',
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
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxSave[0]['cbxSuNo'] == null ? null : '${smallBoxSave[0]['cbxSuNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_SEQ',
            'paramValue': smallBoxSave[0]['cbxSuSeq'] == 'null' ? null :'${smallBoxSave[0]['cbxSuSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          /* {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': '${smallBoxList[i]['scanSeq']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },*/
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_CBX_QTY',
            'paramValue': smallBoxSave[0]['setCbxQty'] == null ? null :'${smallBoxSave[0]['setCbxQty']}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_QTY',
            'paramValue': smallBoxSave[0]['cbxQty'] == null ? null :'${smallBoxSave[0]['cbxQty'].toString().trim()}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_QTY',
            'paramValue': smallBoxSave[0]['setQty'] == null ? null :'${smallBoxSave[0]['setQty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QTY_UNIT',
            'paramValue': smallBoxSave[0]['qtyUnit'] == null ? null :'${smallBoxSave[0]['qtyUnit'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_YN', // 동기화 말고 스캔했는지 여부 y,n
            'paramValue': smallBoxSave[0]['scanYn'] == null ? null :'${smallBoxSave[0]['scanYn'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_NO', // 동기화 말고 스캔했을 때 넘버
            'paramValue': smallBoxSave[0]['scanNo'] == null ? null :'${smallBoxSave[0]['scanNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TAG_NO', // 스캔 넘버랑 똑같은거 넘겨주자 q2 에서 조회해서 주자 걍
            'paramValue': smallBoxSave[0]['tagNo'] == null ? null :'${smallBoxSave[0]['tagNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY', // 총 넘겨준 수량
            'paramValue': smallBoxSave[0]['newQty'] == null ? null :'${smallBoxSave[0]['newQty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_NCBX_RMK', // 선택한 사유
            'paramValue': smallBoxSave[0]['ncbxRmk'] == null ? null :'${smallBoxSave[0]['ncbxRmk'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY_SYNC', // 동기화 후 수량???
            'paramValue': smallBoxSave[0]['prtNo'] == 'O' ? smallBoxSave[0]['wrkQtySync'] == null ? null :'${smallBoxSave[0]['wrkQtySync']}' : 0, //
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SYNC_YN', // 동기화 여부
            'paramValue': smallBoxSave[0]['prtNo'] == 'O' ? 'Y':'', //syncYn
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_CD', // Q2에 있음
            'paramValue': smallBoxSave[0]['vendCd'] == null ? null :'${smallBoxSave[0]['vendCd']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_NM', // Q2에 있음
            'paramValue': smallBoxSave[0]['vendNm'] == null ? null :'${smallBoxSave[0]['vendNm']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_REMARK', // ''
            'paramValue': '',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_SCAN_NO',
            'paramValue': '${smallBoxSave[0]['scanNo']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_TAG_NO',
            'paramValue': '${smallBoxSave[0]['tagNo']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_WRK_QTY',
            'paramValue': '${smallBoxSave[0]['newQty']}',
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
          Get.log('디테일 등록되었습니다');
          isSave.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('디테일 등록 실패');
          isSave.value = false;
          isSaveText.value = retVal.body![0]['resultMessage'];
        }
      } catch (e) {
        Get.log('registSmallKitDetailSave catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isConfirmClick.value = false;
        isSaveClick.value = false;
      }

  }














  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeKey = FocusNode();

  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    isQrFocus.value = true;
  }

  List<PlutoCell> createPlutoCells(List<String> columnNames) {
    return columnNames.map((name) => PlutoCell(value: name)).toList();
  }

 /* // Excel 파일 생성 함수
  Future<void> exportToExcel(List<PlutoRow> rows, List<String> columnNames) async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    List<String> columnNames = ['Name', 'Age', 'City'];
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];
    // 컬럼 이름 추가
    List<CellValue> columnCellValues = columnNames.map((name) => TextCellValue(name)).toList();
    sheet.appendRow(columnCellValues);

    // 각 행 데이터를 CellValue로 변환하여 추가
    for (var row in rows) {
      List<CellValue> rowValues = row.cells.entries.map((entry) {
        final cell = entry.value;
        // 셀 값의 타입에 따라 CellValue 생성
        if (cell.value is String) {
          return TextCellValue(cell.value.toString());
        } else {
          return TextCellValue(''); // 기본값
        }
      }).toList();
      sheet.appendRow(rowValues);
    }

    // Excel 파일 저장
    String outputFile = "${appDocDir.path}/pluto_grid_example.xlsx";
    List<int>? fileBytes = excel.save();
    if (fileBytes != null) {
      File(join(outputFile))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }

    print('Excel 파일이 성공적으로 생성되었습니다: $outputFile');
  }

  Future<void> moveFileToDownloads() async {
    // 기존 파일 경로
    Directory appDocDir = await getApplicationDocumentsDirectory();
    File originalFile = File('${appDocDir.path}/pluto_grid_example.xlsx');

    // 새 파일 경로
    Directory downloadsDir = Directory('/storage/emulated/0/Download'); // Downloads 폴더
    File newFile = File('${downloadsDir.path}/pluto_grid_example.xlsx');

    // 파일 이동
    if (await originalFile.exists()) {
      await originalFile.copy(newFile.path);
      print('File moved to Downloads: ${newFile.path}');
    } else {
      print('Original file does not exist.');
    }
  }*/

  /// BOM 저장
  Future<void> registBomSave() async {
    for(var i = 0; i < bomDetailList.length; i++) {
      var params = {
        'programId': 'A1020',
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
            'paramValue': bomList[bomCurrentIdx.value]['bcId'],
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
    isBomSave.value == true ?
    await reqBomDetail() : null;
  }





  /// BOM 조회
  Future<void> reqBom() async {
    Get.log('BOM 조회');

    bLoading.value = true;
    bomList.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_CHK_BOM_R02',
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
          'paramValue': ''/*smallBoxItemDataList[0]['cbxSuNo']*/,
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
          'paramValue': smallBoxItemDataList[0]['pitmCd'], //제품코드
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_SET_QTY',
          'paramValue': smallBoxItemDataList[0]['setQty'], //제품코드
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_GUBUN',
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
          textItemCdController.text = smallBoxItemDataList[0]['pitmCd'];

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
      'procedure': 'USP_CHK_BOM_R02',
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
        },
        {
          'paramName': 'p_SET_QTY',
          'paramValue': smallBoxItemDataList[0]['setQty'], //제품코드
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_GUBUN',
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
          bomDetailList.addAll(retVal.body![1]);
          for(var ii = 0; ii < bomDetailList.length; ii++) {
            final name = bomConfirm.firstWhere((item) => item['CODE'] == bomDetailList[ii]['chgCfFlag'], orElse: () => {'NAME': ''})['NAME'];
            bomDetailList[ii].addAll({'chgCfFlagName': name.toString()});
          }

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



  /// 공통 드롭다운 조회(동기화 사유)
  Future<void> reqCommon() async {

    bLoading.value = true;
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020',
     // 'procedure': 'USP_GET_COMMON_CODE_R01',
      'grpCds': [
        'LE_NCBX_RMK'
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCommon2(params);

      if (retVal.resultCode == '0000') {
          reasonDropdownTotalList.addAll(retVal.body!);
          for(var i = 0; i < reasonDropdownTotalList.length; i++) {
            if(reasonDropdownTotalList[i]['cdNm'] != '기타' && reasonDropdownTotalList[i]['cdNm'] != '미출하'
               && reasonDropdownTotalList[i]['cdNm'] != '직납') {
              reasonDropdownList.add(
                    {'CODE': '${reasonDropdownTotalList[i]['dtlCd']}',
                      'NAME': '${reasonDropdownTotalList[i]['cdNm']}'
                    }
                );
            }

          }
           reasonNames.value = reasonDropdownList
              .map((item) => item['NAME'] ?? '')
              .toList();
          Get.log('조회 성공');
          Get.log('reasonDropdownList: $reasonDropdownList');
          isDbConnected.value = true;
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

  /// 확정/확정취소 (confirmYn == 'Y' ? 확정 : 확정취소) // 왼쪽 오른쪽 리스트 길이 같고 수량 같고 동기화 시에 사유 다 있어야하고
  Future<void> registSmallKitConfirm(String confirmYn) async {
    Get.log('확정 클릭');
    bLoading.value = true;
    if(smallBoxList.length == smallBoxSaveList.length) {
      for(var i = 0; i < smallBoxList.length; i++) {
        if(smallBoxList[i]['cbxQty'] == smallBoxSaveList[i]['qty']){
          if(smallBoxSaveList[i]['prtNo'] == 'O'){
            if(smallBoxSaveList[i]['ncbxRmk'] != null && smallBoxSaveList[i]['ncbxRmk'] != '') {
              isConfirm.value = true;
            }else {
              isConfirmText.value = '동기화 된 자재의 사유를 입력해주세요.';
              isConfirm.value = false;
              break;
            }
          }else {
            isConfirm.value = true;
          }
        }else {
          isConfirmText.value = '수량이 일치하지않습니다.';
          isConfirm.value = false;
          break;
        }
      }
    }else {
      isConfirmText.value = '스캔/동기화 되지않은 자재가 있습니다.';
      isConfirm.value = false;
    }

      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2025_S01',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': 'N5',
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
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxList[0]['cbxSuNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_CFM_YN',
            'paramValue': confirmYn,
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
        if(isConfirm.value == true) {
          final retVal = await HomeApi.to.registSmallKitSave(params);

          if(retVal.body![0]['resultMessage'] == '') {
            Get.log('등록되었습니다');
            isDbConnected.value = true;
          } else {
            Get.log('등록 실패');

          }
        }

      } catch (e) {
        Get.log('registSmallKitConfirm catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isConfirmClick.value = false;
        isSaveClick.value = false;
      }

  }

  /// 메모 저장
  Future<void> registMemoSmallKitSave() async {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2025_S02',
        'params': [
          {
            'paramName': 'p_work_type',
            'paramValue': 'N4',
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
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxItemDataList[0]['cbxSuNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_REMARK',
            'paramValue': textMemoController.text,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_BOX_WHT',
            'paramValue': textWeightController.text,
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
            isSave.value = true;
            isSaveText.value = '저장되었습니다.';
            isDbConnected.value = true;
          } else {
            Get.log('등록 실패');
            isSave.value = false;
            isSaveText.value = retVal.body![0]['resultMessage'];
          }

      } catch (e) {
        Get.log('registMemoSmallKitSave catch !!!!');
        Get.log(e.toString());
        isSaveText.value = '저장에 실패하였습니다.';
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isSaveClick.value = false;
      }

  }


  /// 저장
  Future<void> registSmallKitSave() async {
    Get.log('저장 클릭');
    smallBoxSaveList.sort((a, b) {
      int noA = int.parse(a['no'].toString() ?? '0');
      int noB = int.parse(b['no'].toString() ?? '0');
      return noA.compareTo(noB); // 오름차순 정렬
    });
    bLoading.value = true;
    for(var i = 0; i < smallBoxSaveList.length; i++) {
      if(smallBoxSaveList[i]['extrVal'] != 'D') {
        startIndex.value = i;
        break;
      }
    }
    for(var i = 0; i < smallBoxSaveList.length; i++) {
      var params = {
        'programId': 'A1020',
      'procedure': 'USP_A2025_S01',
      'params': [
        {
        'paramName': 'p_INIT',
        'paramValue': i == startIndex.value ? '0' : '1',
        'paramJdbcType': 'VARCHAR',
        'paramMode': 'IN'
        },
        {
        'paramName': 'p_DETAIL',
        'paramValue': 'N',
        'paramJdbcType': 'VARCHAR',
        'paramMode': 'IN'
        },
        {
        'paramName': 'p_work_type',
        'paramValue': 'N6',
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
        'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxSaveList[i]['cbxSuNo'] == null ? null : '${smallBoxSaveList[i]['cbxSuNo'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
            'paramName': 'p_CBX_SU_SEQ',
            'paramValue': smallBoxSaveList[i]['cbxSuSeq'] == null ? null :'${smallBoxSaveList[i]['cbxSuSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
         /* {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': '${smallBoxList[i]['scanSeq']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },*/
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxSaveList[i]['itemCd'] == null ? null :'${smallBoxSaveList[i]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_CBX_QTY',
            'paramValue': smallBoxSaveList[i]['setCbxQty'] == null ? null :'${smallBoxSaveList[i]['setCbxQty']}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_QTY',
            'paramValue': smallBoxSaveList[i]['cbxQty'] == null ? null :'${smallBoxSaveList[i]['cbxQty'].toString().trim()}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_QTY',
            'paramValue': smallBoxSaveList[i]['setQty'] == null ? null :'${smallBoxSaveList[i]['setQty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QTY_UNIT',
            'paramValue': smallBoxSaveList[i]['qtyUnit'] == null ? null :'${smallBoxSaveList[i]['qtyUnit'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_YN', // 동기화 말고 스캔했는지 여부 y,n
            'paramValue': smallBoxSaveList[i]['scanYn'] == null ? null :'${smallBoxSaveList[i]['scanYn'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_NO', // 동기화 말고 스캔했을 때 넘버
            'paramValue': smallBoxSaveList[i]['scanNo'] == null ? null :'${smallBoxSaveList[i]['scanNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TAG_NO', // 스캔 넘버랑 똑같은거 넘겨주자 q2 에서 조회해서 주자 걍
            'paramValue': smallBoxSaveList[i]['tagNo'] == null ? null :'${smallBoxSaveList[i]['tagNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY', // 총 넘겨준 수량
            'paramValue': smallBoxSaveList[i]['qty'] == null ? null :'${smallBoxSaveList[i]['qty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_NCBX_RMK', // 선택한 사유
            'paramValue': smallBoxSaveList[i]['ncbxRmk'] == null ? null :'${smallBoxSaveList[i]['ncbxRmk'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY_SYNC', // 동기화 후 수량???
            'paramValue': smallBoxSaveList[i]['prtNo'] == 'O' ? smallBoxSaveList[i]['wrkQtySync'] == null ? null :'${smallBoxSaveList[i]['wrkQtySync']}' : 0, //
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SYNC_YN', // 동기화 여부
            'paramValue': smallBoxSaveList[i]['prtNo'] == 'O' ? 'Y':'', //syncYn
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_CD', // Q2에 있음
            'paramValue': smallBoxSaveList[i]['vendCd'] == null ? null :'${smallBoxSaveList[i]['vendCd']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_NM', // Q2에 있음
            'paramValue': smallBoxSaveList[i]['vendNm'] == null ? null :'${smallBoxSaveList[i]['vendNm']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_REMARK', // ''
            'paramValue': '',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_SCAN_NO',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_TAG_NO',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_D_WRK_QTY',
            'paramValue': null,
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
        if(smallBoxSaveList[i]['extrVal'] != 'D') {
          final retVal = await HomeApi.to.registSmallKitSave(params);

          if(retVal.body![0]['resultMessage'] == '') {
            Get.log('등록되었습니다');
            isSave.value = true;
            isSaveText.value = '저장되었습니다.';
            isDbConnected.value = true;
          } else {
            Get.log('등록 실패');
            isSave.value = false;
            isSaveText.value = retVal.body![0]['resultMessage'];
          }
        }

      } catch (e) {
        Get.log('registSmallKitSave catch !!!!');
        Get.log(e.toString());
        isSaveText.value = '저장에 실패하였습니다.';
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isConfirmClick.value = false;
        isSaveClick.value = false;
      }
    }

  }

  /// 디테일 저장
  Future<void> registSmallKitDetailSave() async {
    Get.log('랙입고 등록 클릭');

    bLoading.value = true;

    for(var i = 0; i < smallBoxDetailList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2025_S01',
        'params': [

            {
              'paramName': 'p_INIT',
              'paramValue': startIndex.value == 0 ? 1 : 0,
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_DETAIL',
              'paramValue': 'Y',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_work_type',
              'paramValue': 'N6',
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
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxDetailList[i]['cbxSuNo'] == null ? null : '${smallBoxDetailList[i]['cbxSuNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_SEQ',
            'paramValue': smallBoxDetailList[i]['cbxSuSeq'] == 'null' ? null :'${smallBoxDetailList[i]['cbxSuSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          /* {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': '${smallBoxList[i]['scanSeq']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },*/
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxDetailList[i]['itemCd'] == null ? null :'${smallBoxDetailList[i]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_CBX_QTY',
            'paramValue': smallBoxDetailList[i]['setCbxQty'] == null ? null :'${smallBoxDetailList[i]['setCbxQty']}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_QTY',
            'paramValue': smallBoxDetailList[i]['cbxQty'] == null ? null :'${smallBoxDetailList[i]['cbxQty'].toString().trim()}',               // 만들어주면 입력
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SET_QTY',
            'paramValue': smallBoxDetailList[i]['setQty'] == null ? null :'${smallBoxDetailList[i]['setQty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QTY_UNIT',
            'paramValue': smallBoxDetailList[i]['qtyUnit'] == null ? null :'${smallBoxDetailList[i]['qtyUnit'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_YN', // 동기화 말고 스캔했는지 여부 y,n
            'paramValue': smallBoxDetailList[i]['scanYn'] == null ? null :'${smallBoxDetailList[i]['scanYn'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_NO', // 동기화 말고 스캔했을 때 넘버
            'paramValue': smallBoxDetailList[i]['scanNo'] == null ? null :'${smallBoxDetailList[i]['scanNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TAG_NO', // 스캔 넘버랑 똑같은거 넘겨주자 q2 에서 조회해서 주자 걍
            'paramValue': smallBoxDetailList[i]['tagNo'] == null ? null :'${smallBoxDetailList[i]['tagNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY', // 총 넘겨준 수량
            'paramValue': smallBoxDetailList[i]['qty'] == null ? null :'${smallBoxDetailList[i]['qty'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_NCBX_RMK', // 선택한 사유
            'paramValue': smallBoxDetailList[i]['ncbxRmk'] == null ? null :'${smallBoxDetailList[i]['ncbxRmk'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_WRK_QTY_SYNC', // 동기화 후 수량???
            'paramValue': smallBoxDetailList[i]['prtNo'] == 'O' ? smallBoxDetailList[i]['wrkQtySync'] == null ? null :'${smallBoxDetailList[i]['wrkQtySync']}' : 0, //
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SYNC_YN', // 동기화 여부
            'paramValue': smallBoxDetailList[i]['prtNo'] == 'O' ? 'Y':'', //syncYn
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_CD', // Q2에 있음
            'paramValue': smallBoxDetailList[i]['vendCd'] == null ? null :'${smallBoxDetailList[i]['vendCd']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_VEND_NM', // Q2에 있음
            'paramValue': smallBoxDetailList[i]['vendNm'] == null ? null :'${smallBoxDetailList[i]['vendNm']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_REMARK', // ''
            'paramValue': '',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
            {
              'paramName': 'p_D_SCAN_NO',
              'paramValue': '${smallBoxDetailList[i]['scanNo']}',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_D_TAG_NO',
              'paramValue': '${smallBoxDetailList[i]['tagNo']}',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_D_WRK_QTY',
              'paramValue': '${smallBoxDetailList[i]['qty']}',
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
          Get.log('디테일 등록되었습니다');
          isSave.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('디테일 등록 실패');
          isSave.value = false;
          isSaveText.value = retVal.body![0]['resultMessage'];
        }
      } catch (e) {
        Get.log('registSmallKitDetailSave catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isConfirmClick.value = false;
        isSaveClick.value = false;
      }
    }

  }

  /// //////////////////////////////////////////////새롭게 만들어진 프로시저 적용 -류 /////////////////////////////////////////////////////
  ///
  ///
  /// 자재선택 프로시저
  Future<void> reqCommon4() async {

    bLoading.value = true;
    popUpDataList2.clear();
    //cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_SELECT_ITEM_R01',
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
          'paramName': 'p_ITEM_CD',
          'paramValue': smallBoxTagTypeList[0]['itemCd'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': smallBoxTagTypeList[0]['qrNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_KIT_ID',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSelectItem(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          popUpDataList2.addAll(retVal.body![1]);
          for(var i = 0; i < popUpDataList2.length; i++) {
            isSelect2.add(false);
          }
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('reqCommon4 catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }


  /// 자재 저장인데 동기화 TAG 미부착일때만 사용할것
  Future<void> registSmallKitItemSaveDong(int index) async {
    Get.log('자재 등록');

    bLoading.value = true;

    if(smallBoxSaveList[index]['tagNo'].contains(',')) {
      for(var i = 0; i < smallBoxSaveList[index]['tagNo'].split(',').length; i++) {
        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A2025_S02',
          'params': [

            {
              'paramName': 'p_work_type',
              'paramValue': 'N1',
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
              'paramName': 'p_CBX_SU_NO',
              'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_CBX_SU_SEQ',
              'paramValue': smallBoxSaveList[index]['cbxSuSeq'] == 'null' ? null :'${smallBoxSaveList[index]['cbxSuSeq'].toString().trim()}',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_TAG_NO',
              'paramValue': smallBoxSaveList[index]['tagNo'] == null ? null :'${smallBoxSaveList[index]['tagNo'].toString().trim().split(',')[i]}',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_NCBX_RMK',
              'paramValue': smallBoxSaveList[index]['ncbxRmk'] == null ? null :'${smallBoxSaveList[index]['ncbxRmk'].toString().trim()}',
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_SYNC_YN',
              'paramValue': 'Y',
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

          if (retVal.body![0]['resultMessage'] == '') {
            Get.log('동기화 TAG미부착 자재 등록되었습니다');
            textQrController.text = smallBoxItemDataList[0]['cbxSuNo'].toString();
            // await checkBoxItemSaveData('');

            textQrController.text = '';
            isSave.value = true;
            isDbConnected.value = true;
          } else {
            Get.log('동기화 TAG미부착 자재 등록 실패');
            isSave.value = false;
            isSaveText.value = retVal.body![0]['resultMessage'];
          }
        } catch (e) {
          Get.log('registSmallKitDetailSave catch !!!!');
          Get.log(e.toString());
          isDbConnected.value = false;
        } finally {
          bLoading.value = false;
          isConfirmClick.value = false;
          isSaveClick.value = false;
        }
      }
    }else {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2025_S02',
        'params': [

          {
            'paramName': 'p_work_type',
            'paramValue': 'N1',
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
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_SEQ',
            'paramValue': smallBoxSaveList[index]['cbxSuSeq'] == 'null' ? null :'${smallBoxSaveList[index]['cbxSuSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TAG_NO',
            'paramValue': smallBoxSaveList[index]['tagNo'] == null ? null :'${smallBoxSaveList[index]['tagNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_NCBX_RMK',
            'paramValue': smallBoxSaveList[index]['tagNo'] == null ? null :'${smallBoxSaveList[index]['tagNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SYNC_YN',
            'paramValue': 'Y',
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

        if (retVal.body![0]['resultMessage'] == '') {
          Get.log('자재 등록되었습니다');
          textQrController.text = smallBoxItemDataList[0]['cbxSuNo'].toString();
         //  await checkBoxItemSaveData('');

          textQrController.text = '';
          isSave.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('자재 등록 실패');
          isSave.value = false;
          isSaveText.value = retVal.body![0]['resultMessage'];
        }
      } catch (e) {
        Get.log('registSmallKitDetailSave catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isConfirmClick.value = false;
        isSaveClick.value = false;
      }
    }


  }



  /// BOM 변경적용
  Future<void> registSmallKitBomChg() async {
    Get.log('변경적용 저장');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_S02',
      'params': [

        {
          'paramName': 'p_work_type',
          'paramValue': 'N6',
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
          'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
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

      final retVal = await HomeApi.to.reqSmallKitSave(params);

      if(retVal.body![0]['resultMessage'] == '') {
        isDbConnected.value = true;
      }else{
        Get.log('${retVal.body![0]['resultMessage']}');
        Get.dialog(CommonDialogWidget(contentText: retVal.body![0]['resultMessage'].toString(), pageFlag: 3,));
      }
    } catch (e) {
      Get.log('registSmallKitBomChg catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }

  }




/// 확정 저장
Future<void> registSmallKitConfirmNew(String confirmYn) async {
  Get.log('확정 저장');

  bLoading.value = true;

  var params = {
    'programId': 'A1020',
    'procedure': 'USP_A2025_S02',
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
        'paramName': 'p_CBX_SU_NO',
        'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
        'paramJdbcType': 'VARCHAR',
        'paramMode': 'IN'
      },
      {
        'paramName': 'p_WRK_CFM_YN',
        'paramValue': confirmYn,
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

    if (retVal.body![0]['returnMessage'] == '') {
      Get.log('확정되었습니다');

      isConfirm.value = true;
      isDbConnected.value = true;
    } else {
      Get.log('확정 실패');
      statusText.value = retVal.body![0]['returnMessage'];
    }
  } catch (e) {
    Get.log('registSmallKitConfirmNew catch !!!!');
    Get.log(e.toString());
    isDbConnected.value = false;
  } finally {
    bLoading.value = false;

    isConfirmClick.value = false;
  }

}
//


/// 동기화 저장
Future<void> registSmallKitDonggiSave() async {
  Get.log('동기화 저장');

  bLoading.value = true;

  var params = {
    'programId': 'A1020',
    'procedure': 'USP_A2025_S02',
    'params': [

      {
        'paramName': 'p_work_type',
        'paramValue': 'N3',
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
        'paramName': 'p_CBX_SU_NO',
        'paramValue': cbxSuNoDonggihwa.value,
        'paramJdbcType': 'VARCHAR',
        'paramMode': 'IN'
      },
      {
        'paramName': 'p_CBX_SU_SEQ',
        'paramValue': cbxSuSeqDonggihwa.value,
        'paramJdbcType': 'VARCHAR',
        'paramMode': 'IN'
      },
      {
        'paramName': 'p_NCBX_RMK',
        'paramValue': ncbxRmkDonggihwa.value,               // 만들어주면 입력
        'paramJdbcType': 'VARCHAR',
        'paramMode': 'IN'
      },
      {
        'paramName': 'p_WRK_QTY_SYNC',
        'paramValue': wrkQtyDonggihwa.value,
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

    if (retVal.body![0]['resultMessage'] == '') {
      Get.log('동기화 자재 저장되었습니다');
      isSuccsessDong.value = true;
      isDbConnected.value = true;
    } else {
      Get.log('동기화 자재 저장 실패');
      isSave.value = false;
      isSuccsessDong.value = false;
      isSaveText.value = '동기화 자재 저장에 실패하였습니다.';
    }
  } catch (e) {
    Get.log('registSmallKitDonggiSave catch !!!!');
    Get.log(e.toString());
    isDbConnected.value = false;
    isSuccsessDong.value = false;
  } finally {
    bLoading.value = false;
  }

}

  /// 자재 입고 취소처리 중복자재용
  Future<void> registSmallKitCancelDup() async {
    Get.log('자재 취소 저장');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_S02',
      'params': [

        {
          'paramName': 'p_work_type',
          'paramValue': 'N5',
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
          'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CBX_SU_SEQ',
          'paramValue': smallBoxDataList[0]['cbxSuSeq'] == null ? null :'${smallBoxDataList[0]['cbxSuSeq'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': popUpDataList2[alertIndex.value]['tagNo'] == null ? null :'${popUpDataList2[alertIndex.value]['tagNo'].toString().trim()}',
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('자재입고 취소되었습니다');

        isDbConnected.value = true;
      } else {
        Get.log('취소 실패');
        isSave.value = false;
      }
    } catch (e) {
      Get.log('registSmallKitConfirmNew catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }

  }


  /// 자재 입고 취소처리
  Future<void> registSmallKitCancel() async {
    Get.log('자재 취소 저장');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_S02',
      'params': [

        {
          'paramName': 'p_work_type',
          'paramValue': 'N5',
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
          'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CBX_SU_SEQ',
          'paramValue': smallBoxDataList[0]['cbxSuSeq'] == 'null' ? null :'${smallBoxDataList[0]['cbxSuSeq'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': smallBoxDataList[0]['tagNo'] == null ? null :'${smallBoxDataList[0]['tagNo'].toString().trim()}',
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('자재입고 취소되었습니다');

        isDbConnected.value = true;
      } else {
        Get.log('취소 실패');
        isSave.value = false;
      }
    } catch (e) {
      Get.log('registSmallKitConfirmNew catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }

  }

  /// 중복 자재 저장
  Future<void> registSmallKitItemSaveDup() async {
    Get.log('자재 등록');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_S02',
      'params': [

        {
          'paramName': 'p_work_type',
          'paramValue': 'N1',
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
          'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CBX_SU_SEQ',
          'paramValue': smallBoxDataList[0]['cbxSuSeq'] == 'null' ? null :'${smallBoxDataList[0]['cbxSuSeq'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': popUpDataList2[alertIndex.value]['qrNo'] == null ? null :'${popUpDataList2[alertIndex.value]['qrNo'].toString().trim()}',               // 만들어주면 입력
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': popUpDataList2[alertIndex.value]['tagNo'] == null ? null :'${popUpDataList2[alertIndex.value]['tagNo'].toString().trim()}',
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

      if (retVal.body![0]['returnMessage'] == '') {
        Get.log('자재 등록되었습니다');
        textQrController.text = smallBoxItemDataList[0]['cbxSuNo'].toString();
        await checkBoxItemSaveData('');

        textQrController.text = '';
        isSave.value = true;
        isDbConnected.value = true;
      } else {
        Get.log('자재 등록 실패');
        isSave.value = false;
        statusText.value = retVal.body![0]['returnMessage'];
        isSaveText.value = '저장에 실패하였습니다.';
      }
    } catch (e) {
      Get.log('registSmallKitDetailSave catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      isConfirmClick.value = false;
      isSaveClick.value = false;
    }

  }

/// 자재 저장
Future<void> registSmallKitItemSave() async {
  Get.log('자재 등록');

  bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_S02',
      'params': [

        {
          'paramName': 'p_work_type',
          'paramValue': 'N1',
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
          'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'] == null ? null : '${smallBoxItemDataList[0]['cbxSuNo'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CBX_SU_SEQ',
          'paramValue': smallBoxDataList[0]['cbxSuSeq'] == 'null' ? null :'${smallBoxDataList[0]['cbxSuSeq'].toString().trim()}',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': smallBoxDataList[0]['qrNo'] == null ? null :'${smallBoxDataList[0]['qrNo'].toString().trim()}',               // 만들어주면 입력
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': smallBoxDataList[0]['tagNo'] == null ? null :'${smallBoxDataList[0]['tagNo'].toString().trim()}',
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('자재 등록되었습니다');
        textQrController.text = smallBoxItemDataList[0]['cbxSuNo'].toString();
        await checkBoxItemSaveData('');

        textQrController.text = '';
        isSave.value = true;
        isDbConnected.value = true;
      } else {
        Get.log('자재 등록 실패');
        isSave.value = false;
        isSaveText.value = '저장에 실패하였습니다.';
      }
    } catch (e) {
      Get.log('registSmallKitDetailSave catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      isConfirmClick.value = false;
      isSaveClick.value = false;
    }

}




  /// 메인박스 KIT 박스정보 조회
  Future<void> checkBoxData() async {
    Get.log('QR 조회');

    bLoading.value = true;

    smallBoxDataList.clear();
    isSelect.clear();
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_R02',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q0',
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
          'paramName': 'p_CBX_SU_NO',
          'paramValue': smallBoxItemDataList[0]['cbxSuNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }

      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKitNew(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxDataList.addAll(retVal.body![1]);
          if(smallBoxDataList.isNotEmpty) {
            if(smallBoxDataList[0]['cancleFlag'] > 0)
            {
              isSmallBoxDataList.value = true;
              statusText.value = '정상 조회 되었습니다.';
              return;
            }
            if(smallBoxDataList[0]['convQty'] <= 0.0)
            {
              isSmallBoxDataList.value = false;
              statusText.value = '자재의 재고가 없습니다.';
              return;
            }

            if(smallBoxDataList[0]['convQty'] > smallBoxDataList[0]['oderQty'] && smallBoxDataList[0]['wrkQty'] != 0)
            {
              isSmallBoxDataList.value = false;
              statusText.value = '자재의 재고가 지시수량보다 많습니다';
              return;
            }

            // 이제 자재 저장 프로시저 실행
            if(smallBoxDataList[0]['oderQty'] - smallBoxDataList[0]['wrkQty'] <= 0)
            {
              isSmallBoxDataList.value = false;
              statusText.value = '해당 자재는 작업이 완료되었습니다.';
              return;
            }else {
              for(var i = 0; i < smallBoxDataList.length; i++) {
                isSelect.add(false);
              }
              isSmallBoxDataList.value = true;
              statusText.value = '정상 조회 되었습니다.';
            }
          }else {
            isSmallBoxDataList.value = false;
            statusText.value = '소박스 구성에 없는 품목입니다.';
            return;
          }

          Get.log(smallBoxDataList.toString());
          Get.log('조회 성공');
          isDbConnected.value = true;
        }else{
          isSmallBoxDataList.value = false;
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          textQrController.text = '';
        }

      } else {
        isSmallBoxDataList.value = false;
        Get.log('조회 실패');
        textQrController.text = '';
      }
    } catch (e) {
      isSmallBoxDataList.value = false;
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      textQrController.text = '';
    } finally {
      bLoading.value = false;
      //  plutoRow();
    }
  }

  /// 소박스 KIT 구성 자재정보 조회
  Future<void> checkBoxItemData() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxItemDataList.clear();
    wrkCfmDt.value = '';

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_R02',
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
          'paramName': 'p_TAG_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKitNew2(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          smallBoxItemDataList.addAll(retVal.body![1]);
          for(var i = 0; i < smallBoxItemDataList.length; i++) {
            smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
          }
          projectNm.value = smallBoxItemDataList[0]['pjtNm2'].toString();
          itemCdNm.value = '${smallBoxItemDataList[0]['itemCd'].toString()}/${smallBoxItemDataList[0]['itemNm']}';
          wrkNo.value = smallBoxItemDataList[0]['wrkNo'].toString();
          boxNo.value = textQrController.text;//retVal.body![1][''];
          wrkCfmDt.value = smallBoxItemDataList[0]['wrkCfmDttm'].toString();
         boxWht.value = smallBoxItemDataList[0]['boxWht'].toString();
          textMemoController.text = smallBoxItemDataList[0]['wrkRemark'] ?? '';
          Get.log(smallBoxItemDataList.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회 되었습니다.';
          isDbConnected.value = true;
          // 어자피 false야 그럼
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          textQrController.text = '';
        }

      } else {
        Get.log('조회 실패');
        textQrController.text = '';
      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      textQrController.text = '';
      statusText.value = '올바른 QR코드를 입력해주세요.';
    } finally {
      bLoading.value = false;
      plutoRowNew();
      smallBoxItemDataList.isNotEmpty ? await checkBoxItemSaveData('') : null;
    }
  }


  /// 메인박스 KIT 구성 자재정보 저장된 값 조회
  Future<void> checkBoxItemSaveData(String qr) async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxItemSaveDataList.clear();
    smallBoxSaveList.clear();
    noList2.clear(); // 색 클리어
    changedRows2.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_R02',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q4',
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
          'paramName': 'p_TAG_NO',
          'paramValue': qr == '' ? textQrController.text : qr,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKitNew3(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxItemSaveDataList.addAll(retVal.body![1]);


          for(var i = 0; i < smallBoxItemSaveDataList.length; i++) {
            outerLoop:
            for(var ii = 0; ii < smallBoxItemDataList.length; ii++) {
              if(smallBoxItemSaveDataList[i]['itemCd'] == smallBoxItemDataList[ii]['itemCd']) {
                if(smallBoxItemSaveDataList[i]['wrkQty'] >= smallBoxItemDataList[ii]['cbxQty']) {
                  /// 색 변경 로직 시작
                  isSaveColor.value = false;
                  isColor.value = true;
                  if(smallBoxItemSaveDataList[i]['chkRst'] == ''){
                    noList2.add(smallBoxItemSaveDataList[i]['itemCd']);
                  }
                }
                smallBoxItemSaveDataList[i].addAll({'no': '${smallBoxItemDataList[ii]['no']}'});
                break outerLoop;
              }
            }
          }

          for(var ii = 0; ii < smallBoxItemSaveDataList.length; ii++) {
            final name = reasonDropdownList.firstWhere((item) => item['CODE'] == smallBoxItemSaveDataList[ii]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
            smallBoxItemSaveDataList[ii].addAll({'ncbxRmkName': name.toString()});
            smallBoxItemSaveDataList[ii].addAll({'prtNo': smallBoxItemSaveDataList[ii]['syncYn'].toString() == 'Y' ? 'O' : 'X'});
          }
          smallBoxSaveList.addAll(smallBoxItemSaveDataList);




          Get.log(smallBoxItemSaveDataList.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회 되었습니다.';
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          textQrController.text = '';
        }

      } else {
        Get.log('조회 실패');
        textQrController.text = '';
      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      textQrController.text = '';
    } finally {
      bLoading.value = false;
      plutoRowNew2();
    }
  }

 /* /// 메인키트 구성자재 스캔 등록
  Future<void> registMainKitQr() async {
    Get.log('메인키트 구성자재 스캔 시작!!!');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S02',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'N1',
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
          'paramName': 'p_QR_NO',
          'paramValue': smallBoxDataList[0]['qrNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_NO',
          'paramValue': smallBoxDataList[0]['tagNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CBX_MA_NO',
          'paramValue': cbxMaNo.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_TAG_TYPE',
          'paramValue': smallBoxDataList[0]['tagType'],
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
      final retVal = await HomeApi.to.registMainKitQr(params);

      if (retVal == '0000') {
        Get.log('등록되었습니다');
        isDbConnected.value = true;
        await checkBoxItemSaveData();
      } else {
        Get.log('등록 실패');

      }
    } catch (e) {
      Get.log('registMainKitQr catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }

  /// 메인키트 동기화 저장
  Future<void> registMainKitDonggihwa() async {
    Get.log('메인키트 동기화 저장 시작!!!');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S04',
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
          'paramName': 'p_CBX_MA_NO',
          'paramValue': cbxMaNo.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_SBOX_NO',
          'paramValue': sboxNoDonggihwa.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_NCBX_RMK',
          'paramValue': ncbxRmkDonggihwa.value,
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
      final retVal = await HomeApi.to.registMainKitDonggihwa(params);

      if (retVal == '0000') {
        Get.log('등록되었습니다');
        isDbConnected.value = true;
      } else {
        Get.log('등록 실패');

      }
    } catch (e) {
      Get.log('registMainKitDonggihwa catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }*/

  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////

  /// 소박스 KIT 자재 QR 조회 - 동기화(tag 미부착)
  Future<void> checkItemQrDonggihwa() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxSave.clear();
    smallBoxTagTypeList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_R02',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q2',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': selectedQrNo.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKitSave(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          smallBoxTagTypeList.addAll(retVal.body![1]);
          if(smallBoxTagTypeList.isNotEmpty) {
            if(smallBoxTagTypeList[0]['tagType'] == '90') {
              await checkBoxItemData();
              for (var i = 0; i < smallBoxItemDataList.length; i++) {
                smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
              }
            }else {
              await checkBoxData();
            }
          }else {
            statusText.value = '해당 QR코드에 해당하는 데이터가 없습니다.';
          }

          Get.log(smallBoxSave.toString());
          Get.log('조회 성공');

        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkItemQr catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
      //plutoRow();
    }
  }


  /// 소박스 KIT 자재 QR 조회
  Future<void> checkItemQr() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxSave.clear();
    smallBoxTagTypeList.clear();
    isSmallBoxDataList.value = false;
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_R02',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q2',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKitSave(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          smallBoxTagTypeList.addAll(retVal.body![1]);
          if(smallBoxTagTypeList.isNotEmpty) {
            if(smallBoxTagTypeList[0]['tagType'] == '90') {
              await checkBoxItemData();
              for (var i = 0; i < smallBoxItemDataList.length; i++) {
                smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
              }
              /// 여기서 무게 쪽 초기화 한번 ㄱ
              textWeightController.text = '';
            }else {

              await checkBoxData();
            }
          }else {
            statusText.value = '해당 QR코드에 해당하는 데이터가 없습니다.';
          }

          Get.log(smallBoxSave.toString());
          Get.log('조회 성공');

        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkItemQr catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
      //plutoRow();
    }
  }



  /// 소박스 KIT QR 조회
  Future<void> checkQR() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxList.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2025_R01',
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
          'paramName': 'p_TAG_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKit(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          smallBoxList.addAll(retVal.body![1]);
          projectNm.value = retVal.body![1][0]['pjtNm2'].toString();
          itemCdNm.value = '${retVal.body![1][0]['itemCd'].toString()}/${retVal.body![1][0]['itemNm']}';
          wrkNo.value = retVal.body![1][0]['wrkNo'].toString();
          boxNo.value = textQrController.text;//retVal.body![1][''];
        //  bcSts.value = retVal.body![1][0]['bcSts'].toString();
          wrkCfmDt.value = retVal.body![1][0]['wrkCfmDttm'].toString();
          for(var i = 0; i < smallBoxList.length; i++){
            isRow.add(false);
          }

          Get.log(smallBoxList.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회되었습니다.';
          isDbConnected.value = true;
          isDonggi.value = false;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          textQrController.text = '';
        }

      } else {
        Get.log('조회 실패');
        textQrController.text = '';
        statusText.value = '올바른 소박스 QR번호를 입력해주세요';
      }
    } catch (e) {
      textQrController.text = '';
      Get.log('checkQR catch !!!!');
      statusText.value = '올바른 소박스 QR번호를 입력해주세요';
      textQrController.text = '';
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      //  plutoRow();
    }
  }
  Future<void> test() async{
     stateManager.rowColorCallback!;
    // 그리드 재렌더링
    stateManager.notifyListeners();
  }

  Future<void> smallBoxScan() async {
    if(smallBoxList.isNotEmpty) {
      for(var i = 0; i < smallBoxList.length; i++) {
        smallBoxList[i].addAll({'no': '${i+1}'});

      };
      rows.value = List<PlutoRow>.generate(smallBoxList.length, (index) =>
          PlutoRow(cells:
          Map.from((smallBoxList[index]).map((key, value) =>
              MapEntry(key, PlutoCell(value: value ?? '' )),
          )))
      );
      for(var i = 0; i < rows.length; i++) {
        rows[i].cells['itemNm']?.value = rows[i].cells['itemNm']?.value.toString().trim();
        rows[i].cells['setQty']?.value = (rows[i].cells['setQty']?.value * rows[i].cells['setCbxQty']?.value).toInt();
        // controller.rows[i].cells['setQty']?.value = controller.rows[i].cells['setQty']?.value.toInt(),
        Get.log('구구: ${ rows[i].cells['setQty']?.value}');
      }
      //  controller.rowDatas2.add(controller.insertRow[0]);
      stateManager.removeAllRows();
      stateManager.appendRows(rows.value);
      textQrController.text = '';
    }
  }


  Future<void> plutoRow() async {
    rows.value = List<PlutoRow>.generate(smallBoxList.length, (index) =>
        PlutoRow(cells:
        Map.from((smallBoxList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : value )),
        )))
    );
    stateManager.removeAllRows();
    stateManager.appendRows(rows);
    stateManager.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }


  Future<void> plutoRowNew() async {

    newRows.value = List<PlutoRow>.generate(smallBoxItemDataList.length, (index) =>
        PlutoRow(
          cells: Map.from(smallBoxItemDataList.value[index].map((key, originalValue) {

            return MapEntry(key, PlutoCell(value: originalValue));
          })),
        )
    );
    stateManager.removeAllRows();
    stateManager.appendRows(newRows);
    stateManager.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  Future<void> plutoRowNew2() async {

    List<dynamic> sortedRows = List.from(smallBoxSaveList);
    // 원하는 기준으로 정렬 (예: 'no' 컬럼 기준 오름차순)
    sortedRows.sort((a, b) {
      int noA = int.parse(a['no'].toString() ?? '0');
      int noB = int.parse(b['no'].toString() ?? '0');
      return noA.compareTo(noB); // 오름차순 정렬
    });
    smallBoxSaveList.value = sortedRows;

    rows2.value = List<PlutoRow>.generate(
        smallBoxSaveList.length,
            (index) => PlutoRow(
            cells: Map.from((smallBoxSaveList[index]).map(
                  (key, value) => MapEntry(key, PlutoCell(value: value == null ? '' : value)),
            ))));
    stateManager2.removeAllRows();
    stateManager2.appendRows(rows2.value);
    //stateManager.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
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


  @override
  void onClose() {
    Get.log('SmallKitController - onClose !!');
    super.onClose();
  }

  @override
  void onInit() async {
    Get.log('SmallKitController - onInit !!');
    super.onInit();
   //  requestPermissions();
    reqCommon();
  }

  @override
  void onReady() {
    Get.log('SmallKitController - onReady !!');

  }
}
