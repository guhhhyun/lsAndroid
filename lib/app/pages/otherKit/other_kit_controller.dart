

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class OtherKitController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();


  RxSet<String> changedRows = <String>{}.obs;
  RxSet<String> changedRows2 = <String>{}.obs;
  /// 리스트
  var rows = <PlutoRow>[].obs;
  var rows2 = <PlutoRow>[].obs;
  var insertRow = <PlutoRow>[].obs;
  RxList<dynamic> isRow = [].obs; // 리스트 길이만큼 false 추가용

  RxList<dynamic> smallBoxList = [].obs; // 별도박스 qr찍고 난 정보(왼쪽, 오른쪽)
  RxList<dynamic> smallBoxListZero = [].obs; // 왼쪽리스트
  RxList<dynamic> smallBoxSave = [].obs;
  RxList<dynamic> smallBoxSaveList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트
  RxList<dynamic> smallBoxDetailList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트


  RxList<dynamic> reasonDropdownTotalList = [].obs;
  RxList<dynamic> reasonDropdownList = [{'CODE':'', 'NAME': ''}].obs;
  RxMap<String, String> selectedReasonDropdown = {'CODE':'', 'NAME': ''}.obs;
  RxList<dynamic> reasonNames = [].obs;
  RxList<dynamic> addRowList = [].obs; // 행추가 담은 리스트
  RxList<dynamic> addRowSaveList = [].obs; // 저장된 행추가 담은 리스트



  late PlutoGridStateManager stateManager;
  late PlutoGridStateManager stateManager2;
  TextEditingController textQrController = TextEditingController();
  TextEditingController textMemoController = TextEditingController();

  /// 행추가 시
  TextEditingController textItemCdController = TextEditingController();
  TextEditingController textItemNmController = TextEditingController();
  TextEditingController textQtyController = TextEditingController();
  TextEditingController textSetController = TextEditingController();
  TextEditingController textUnitController = TextEditingController();

  RxInt focusCnt = 0.obs;
  RxString projectNm = ''.obs;
  RxString itemCdNm = ''.obs;
  RxString wrkNo = ''.obs;
  RxString boxNo = ''.obs;
  RxString wrkCfmDt = ''.obs;
  RxInt no = 990.obs;
  RxList<dynamic> noList = [].obs; // 색 구분을 위해 itemCd 담는 그릇
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
  RxBool isSave = false.obs; //저장성공 여부
  RxString isSaveText = ''.obs; //저장 불가능상태 이유
  RxBool isConfirm = false.obs; //확정 가능상태 여부
  RxString isConfirmText = ''.obs; //확정 불가능상태 이유
  RxBool isOther = false.obs; //행추가 시 똑같은 itemcd는 넣지않기
  RxBool isFocus = false.obs; // 포커스 잡냐 마냐
  RxBool isDonggi = false.obs;
  RxBool noSync = false.obs;
  RxBool isQrFocus = false.obs;
  RxBool isSaveListDup = false.obs; // 저장된 값 불러올 때 우측에 이미 넘어간 itemCd 있는지 확인

  RxBool isSaveClick = false.obs; // 중복클릭 방지
  RxBool isConfirmClick = false.obs; // 중복클릭 방지
  RxBool isDbConnected = true.obs;

  final FocusNode focusNode = FocusNode();

  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    isFocus.value = true;
  }

  List<PlutoCell> createPlutoCells(List<String> columnNames) {
    return columnNames.map((name) => PlutoCell(value: name)).toList();
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
          reasonDropdownList.add(
              {'CODE': '${reasonDropdownTotalList[i]['dtlCd']}',
                'NAME': '${reasonDropdownTotalList[i]['cdNm']}'
              }

          );
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

      for(var i = 0; i < smallBoxList.length; i++) {
        for(var ii = 0; ii < smallBoxSaveList.length; ii++) {
          if(smallBoxList[i]['wrkQty'] != null) {
            if(smallBoxList[i]['cbxQty'] == smallBoxSaveList[ii]['cbxQty']){
              if(smallBoxSaveList[ii]['extrVal'] == 'D'){
                if(smallBoxSaveList[ii]['ncbxRmk'] != null && smallBoxSaveList[ii]['ncbxRmk'] != '') {
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
          }else {
            isConfirmText.value = '스캔/동기화 되지않은 자재가 있습니다.';
            isConfirm.value = false;
          }
        }

      }


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2065_S01',
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
          'paramName': 'p_CBX_EX_NO',
          'paramValue': smallBoxList[0]['tagNo'],
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

        if (retVal == '0000') {
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
    }

  }

  /// 메모 저장
  Future<void> registMemoSmallKitSave() async {
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2065_S01',
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
          'paramValue': smallBoxList[0]['CBX_SU_NO'],
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

      if (retVal == '0000') {
        Get.log('등록되었습니다');
        isSave.value = true;
        isSaveText.value = '저장되었습니다.';
        isDbConnected.value = true;
      } else {
        Get.log('등록 실패');
        isSave.value = false;
        isSaveText.value = '저장에 실패하였습니다.';
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
    List<dynamic> withoutLeadingZero = smallBoxSaveList.where((item) => !item['no'].toString().startsWith('0')).toList();
    List<dynamic> withLeadingZero = smallBoxSaveList.where((item) => item['no'].toString().startsWith('0')).toList();

    // 각각의 그룹을 정수형으로 변환하여 정렬
    withoutLeadingZero.sort((a, b) => int.parse(a['no'].toString()).compareTo(int.parse(b['no'].toString())));
    withLeadingZero.sort((a, b) => int.parse(a['no'].toString()).compareTo(int.parse(b['no'].toString())));
    smallBoxSaveList
      ..clear()
      ..addAll(withoutLeadingZero)
      ..addAll(withLeadingZero);
    /*smallBoxSaveList.sort((a, b) {
      int noA = int.parse(a['no'].toString() ?? '0');
      int noB = int.parse(b['no'].toString() ?? '0');
      return noA.compareTo(noB); // 오름차순 정렬
    });*/
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
        'procedure': 'USP_A2065_S01',
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
            'paramName': 'p_CBX_EX_NO',
            'paramValue': smallBoxSaveList[i]['cbxExNo'] == 'null' ? null : '${smallBoxSaveList[i]['cbxExNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_EX_SEQ',
            'paramValue': smallBoxSaveList[i]['cbxExSeq'],
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
            'paramName': 'p_EX_ITEM_CD',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_NM',
            'paramValue': null,
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
            'paramValue': smallBoxSaveList[i]['qtyUnit'] == 'null' ? null :'${smallBoxSaveList[i]['qtyUnit'].toString().trim()}',
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
            'paramValue': smallBoxSaveList[i]['prtNo'] == 'O' ? 'Y':'N', //syncYn
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
/*          {
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
          },*/
          {
            'paramName': 'p_ITEM_NM_NON_KIT', // ''
            'paramValue': smallBoxSaveList[i]['itemNm'],
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
          'paramName': 'p_D_REMARK',
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

          if (retVal == '0000') {
            Get.log('등록되었습니다');
            isSave.value = true;
            isSaveText.value = '저장되었습니다.';
            isDbConnected.value = true;
          } else {
            Get.log('등록 실패');
            isSave.value = false;
            isSaveText.value = '저장에 실패하였습니다.';
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
    Get.log('저장 클릭');

    bLoading.value = true;

    for(var i = 0; i < smallBoxDetailList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2065_S01',
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
            'paramName': 'p_CBX_EX_NO',
            'paramValue': smallBoxDetailList[i]['cbxExNo'] == 'null' ? null : '${smallBoxDetailList[i]['cbxExNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_EX_SEQ',
            'paramValue': smallBoxDetailList[i]['cbxExSeq'].toString() == 'null' ? '' :'${smallBoxDetailList[i]['cbxExSeq'].toString().trim()}',
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
            'paramName': 'p_EX_ITEM_CD',
            'paramValue': smallBoxDetailList[i]['itemCd'] == null ? null :'${smallBoxDetailList[i]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_NM',
            'paramValue': smallBoxDetailList[i]['itemCd'] == null ? null :'${smallBoxDetailList[i]['itemNm'].toString().trim()}',
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
 /*         {
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
          },*/
          {
            'paramName': 'p_REMARK', // ''
            'paramValue': '',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_NM_NON_KIT', // ''
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
            'paramName': 'p_D_REMARK',
            'paramValue': '',
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

        if (retVal == '0000') {
          Get.log('디테일 등록되었습니다');
          isSave.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('디테일 등록 실패');
          isSave.value = false;
          isSaveText.value = '저장에 실패하였습니다.';
        }
      } catch (e) {
        Get.log('registSmallKitDetailSave catch !!!!');
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


  /// 소박스 KIT 자재 QR 조회
  Future<void> checkItemQr(String itemCd) async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxSave.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2065_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q2',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': itemCd == '' ? textQrController.text : itemCd,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqSmallKitSave(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
         /* if(retVal.body![1][0]['tagType'] == '90' && retVal.body![1][0]['qrNo'] != boxNo.value) {
            smallBoxSave.clear();
            smallBoxSaveList.clear();
            stateManager.removeAllRows();
            stateManager2.removeAllRows();
            await checkQR();
            await smallBoxScan();
          }else {*/
            smallBoxSave.addAll(retVal.body![1]);
            _duplicationRow();
            //  duplicationQr.value == true ? null : smallBoxSave.addAll(retVal.body![1]);
         // }

          Get.log(smallBoxSave.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회 되었습니다.';
          isDbConnected.value = true;
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
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      //plutoRow();
    }
  }
  void _duplicationRow() async{
    duplicationQr2.value = false;
    duplicationQr.value = false;
    for(var i = 0; i < smallBoxSaveList.length; i++) {
      if(smallBoxSaveList[i]['itemCd'].toString().trim() == smallBoxSave[0]['itemCd'].toString().trim()) {
        duplicationQr2.value = true;
        dupSaveListIndex.value = i;
        break;
      }else {
        duplicationQr2.value = false;
      }
    }
    for(var i = 0; i < smallBoxList.length; i++) {
      if(smallBoxList[i]['itemCd'].toString() != smallBoxSave[0]['itemCd'].toString()) {
        duplicationQr.value = true;
        //  smallBoxSave.clear();
      }else {
        duplicationQr.value = false;
        break;
      }
    }


    /*  for(var i = 0; i < smallBoxList.length; i++) {
      for(var e = 0; e < smallBoxList.length; e++) {
        if (smallBoxList[i]['itemCd'].toString() == smallBoxSaveList[e]['tagNo'].toString()) {
          isRow[i] = true;
        }
      }
    }*/
    Get.log('isRow: ${isRow}');
  }



  /// 별도박스 KIT QR 조회
  Future<void> checkQRZero() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxListZero.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2065_R01',
      'params': [
        {
          'paramName': 'p_work_type',
          'paramValue': 'Q0',
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
          smallBoxListZero.addAll(retVal.body![1]);

          Get.log(smallBoxListZero.toString());
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
      Get.log('checkQRZero catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      textQrController.text = '';
    } finally {
      bLoading.value = false;
      //  plutoRow();
    }
  }

  /// 별도박스 KIT QR 조회
  Future<void> checkQR() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxList.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2065_R01',
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
          'paramName': 'p_QR_NO',
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
          for (var i = smallBoxList.length - 1; i >= 0; i--) {
            if (smallBoxList[i]['pjtNm2'] == null) {
              final name = reasonDropdownList
                  .firstWhere((item) => item['CODE'] == smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
              smallBoxList[i].addAll({'ncbxRmkName': '$name'});
              addRowSaveList.add(smallBoxList[i]);
              smallBoxList.removeAt(i);
            }else {
              final name = reasonDropdownList
                  .firstWhere((item) => item['CODE'] == smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
              smallBoxList[i].addAll({'ncbxRmkName': '$name'});
            }
          }
          projectNm.value = smallBoxList[0]['pjtNm2'].toString();
          itemCdNm.value = '${smallBoxList[0]['itemCd'].toString()}/${smallBoxList[0]['itemNm']}';
          wrkNo.value = smallBoxList[0]['wrkNo'].toString();
          boxNo.value = textQrController.text;//retVal.body![1][''];
          wrkCfmDt.value = smallBoxList[0]['wrkCfmDttm'].toString();
          for(var i = 0; i < smallBoxList.length; i++){
            isRow.add(false);
          }

          Get.log(smallBoxList.toString());
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

  /*Future<void> requestPermissions() async {
    // WRITE_EXTERNAL_STORAGE 권한 요청
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // 권한이 허용되지 않았다면 요청
      await Permission.storage.request();
    }
  }*/

  @override
  void onClose() {
    Get.log('SmallKitController - onClose !!');
    super.onClose();
  }

  @override
  void onInit() async {
    Get.log('SmallKitController - onInit !!');
    super.onInit();
   // requestPermissions();
    reqCommon();
  }

  @override
  void onReady() {
    Get.log('SmallKitController - onReady !!');

  }
}
