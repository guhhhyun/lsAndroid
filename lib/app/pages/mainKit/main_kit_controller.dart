

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

class MainKitController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();


  RxSet<String> changedRows = <String>{}.obs;
  RxSet<String> changedRows2 = <String>{}.obs;
  /// 리스트
  var rows = <PlutoRow>[].obs;
  var rows2 = <PlutoRow>[].obs;
  var rows3 = <PlutoRow>[].obs; // bom마스터
  var rows4 = <PlutoRow>[].obs; // bom디테일
  var newRows = <PlutoRow>[].obs;
  var newRows2 = <PlutoRow>[].obs;


  var insertRow = <PlutoRow>[].obs;
  RxList<dynamic> isRow = [].obs; // 리스트 길이만큼 false 추가용

  RxList<dynamic> smallBoxDataList = [].obs; // 메인박스 qr찍고 기본 box 정보
  RxList<dynamic> smallBoxItemDataList = [].obs; // 메인박스 qr찍고 구성자재 정보
  RxList<dynamic> smallBoxItemSaveDataList = [].obs; // 메인박스 qr찍고 구성자재 저장된 정보

  RxList<dynamic> smallBoxList = [].obs; // 메인박스 qr찍고 난 정보
  RxList<dynamic> uniqueSmallBoxList = [].obs; // 중복제거된 리스트
  RxList<dynamic> smallBoxList2 = [].obs; // 메인박스 qr찍고 난 정보
  RxList<dynamic> uniqueSmallBoxList2 = [].obs; // 중복제거된 리스트
  RxList<dynamic> smallBoxSave = [].obs;
  RxList<dynamic> smallBoxSaveList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트
  RxList<dynamic> smallBoxDetailList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트

  RxList<dynamic> smallBoxItemMsgList = [].obs; // 스캔 저장 후 메세지 출력 담는 그릇
  RxList<dynamic> smallBoxDonggihwaMsgList = [].obs; // 동기화 저장 후 메세지 출력 담는 그릇
  RxList<dynamic> smallBoxConfirmMsgList = [].obs; // 확정 후 메세지 출력 담는 그릇



  RxList<dynamic> reasonDropdownTotalList = [].obs;
  RxList<dynamic> reasonDropdownList = [{'CODE':'', 'NAME': ''}].obs;
  RxMap<String, String> selectedReasonDropdown = {'CODE':'', 'NAME': ''}.obs;
  RxList<dynamic> reasonNames = [].obs;
  RxList<dynamic> addRowList = [].obs; // 행추가 담은 리스트
  RxList<dynamic> addRowSaveList = [].obs; // 저장된 행추가 담은 리스트



  RxList<dynamic> bunhalList = [].obs; // 분할 자재 판단하기 위해 자재cd 담는 것

  RxList<dynamic> bomList = [].obs; // bom list정보
  RxList<dynamic> bomDetailList = [].obs; // bom 디테일 list정보



  RxList<dynamic> bomConfirm = [{'CODE':'', 'NAME':''},{'CODE':'10', 'NAME':'미확인'}, {'CODE':'20', 'NAME':'변경 확정'}, {'CODE':'30', 'NAME':'변경 제외'},].obs;
  RxList<dynamic> bomConfirmNames = ['','미확인','변경 확정','변경 제외'].obs;

  RxList<dynamic> bomGubun = [{'CODE':'', 'NAME':'전체'}, {'CODE':'10', 'NAME':'작업표준'}, {'CODE':'30', 'NAME':'설계BOM'}, {'CODE':'40', 'NAME':'생산BOM'},].obs;
  RxMap<String, String> selectedGubun = {'CODE':'', 'NAME':'전체'}.obs;

  late PlutoGridStateManager stateManager;
  late PlutoGridStateManager stateManager2;
  late PlutoGridStateManager stateManager3; // bom
  late PlutoGridStateManager stateManager4; // bom

  TextEditingController textQrController = TextEditingController();
  TextEditingController textMemoController = TextEditingController();
  TextEditingController textWeightController = TextEditingController();
  TextEditingController textWeightController2 = TextEditingController();

  /// 행추가 시
  TextEditingController textItemCdController = TextEditingController();
  TextEditingController textItemNmController = TextEditingController();
  TextEditingController textQtyController = TextEditingController();
  TextEditingController textSetController = TextEditingController();
  TextEditingController textUnitController = TextEditingController();

  /// BOM
  TextEditingController textSaleOrdController = TextEditingController();
  TextEditingController textItemCdController2 = TextEditingController();
  TextEditingController textPrdOrdController = TextEditingController();

  RxInt focusCnt = 0.obs;
  RxString projectNm = ''.obs;
  RxString itemCdNm = ''.obs;
  RxString itemCd = ''.obs;

  RxString wrkNo = ''.obs;
  RxString qty = ''.obs; // 수량
  RxString boxNo = ''.obs;
  RxString wrkCfmDt = ''.obs;
  RxString cbxMaNo = ''.obs;
  RxString setQty = ''.obs;
  RxString tagType = ''.obs;
  RxString bcSts = ''.obs;



  RxInt no = 990.obs;
  RxList<dynamic> noList = [].obs;
  RxList<dynamic> noList2 = [].obs;
  RxList<dynamic> noList3 = [].obs; // 자재쪽 noList
  RxBool duplicationQr = false.obs; // 이미 스캔한 자재를 또 스캔했을 때
  RxBool duplicationQr2 = false.obs; // 이미 스캔한 자재를 또 스캔했을 때
  RxBool duplicationQr3 = false.obs; // 이미 스캔한 qr코드를 스캔했을 때
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
  RxBool isDetailSave = false.obs; //디테일 저장성공 여부
  RxBool isTotalDetailSave = false.obs;
  RxBool isTotalSave = false.obs;
  RxBool isConfirm = false.obs; //확정 가능상태 여부
  RxString isConfirmText = ''.obs; //확정 불가능상태 이유
  RxString smallboxNumbering = ''.obs;
  RxBool isText = false.obs; // 소박스 텍스트 출력할지
  RxBool isFocus = false.obs;
  RxBool isOther = false.obs;
  RxString cellValue = ''.obs;
  RxString currentValue = ''.obs;
  RxBool isNewItem = false.obs; // 처음 스캔되는 자재인지 판단
  RxBool isDonggi = false.obs;
  RxBool noSync = false.obs;

  RxBool isSaveClick = false.obs; // 중복클릭 방지
  RxBool isConfirmClick = false.obs; // 중복클릭 방지

  RxBool isDbConnected = true.obs;

  RxBool isDonggihwaSaveOk = false.obs; // 동기화 저장 가능여부 -> 필요없을듯? ㅇㅅㅇ

  RxString sboxNoDonggihwa = ''.obs;
  RxString ncbxRmkDonggihwa = ''.obs;

  ///bom
  RxBool isBomSave = false.obs;
  RxString isBomSaveText = ''.obs;
  RxInt bomCurrentIdx = 0.obs;

  RxBool isSuccsessDong = true.obs;




  final FocusNode focusNode = FocusNode();
  final FocusNode focusNodeKey = FocusNode();

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
    reasonDropdownTotalList.clear();
    reasonDropdownList.clear();

    var params = {
      // 'procedure': 'USP_GET_COMMON_CODE_R01',
      'grpCds': [
        'LE_NCBX_RMK'
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCommon2(params);

      if (retVal.resultCode == '0000') {
        reasonDropdownTotalList.addAll(retVal.body!);
        reasonDropdownList.add(
            {'CODE': '',
              'NAME': ''
            }
        );
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

  RxBool isWrkQty = false.obs; // 스캔 확인
  RxBool isQty = false.obs; // 수량확인
  RxBool isReason = false.obs; // 동기화 사유 확인

  /// 확정/확정취소 (confirmYn == 'Y' ? 확정 : 확정취소) // 왼쪽 오른쪽 리스트 길이 같고 수량 같고 동기화 시에 사유 다 있어야하고
  Future<void> registSmallKitConfirm(String confirmYn) async {
    Get.log('확정 클릭');
    bLoading.value = true;
    if(confirmYn == 'Y') {
      await checkQR2();
      uniqueSmallBoxList2.value = smallBoxList2
          .fold<Map<String, dynamic>>({}, (map, item) {
        String itemCd = item['itemCd'];

        // 각 항목에서 cbxQty와 wrkQty 값을 가져와 null일 경우 0으로 설정
        int currentCbxQty = int.tryParse(item['cbxQty']?.toString() ?? '0') ?? 0;
        int currentWrkQty = int.tryParse(item['wrkQty']?.toString() ?? '0') ?? 0;

        if (map.containsKey(itemCd)) {
          // 중복된 itemCd가 있는 경우 cbxQty와 wrkQty 값을 누적
          map[itemCd]['cbxQty'] = ((int.tryParse(map[itemCd]['cbxQty'].toString()) ?? 0) + currentCbxQty).toString();
          map[itemCd]['wrkQty'] = (map[itemCd]['wrkQty'] ?? 0) + currentWrkQty;
        } else {
          // 새로 추가되는 경우, 기본 wrkQty와 cbxQty 값 설정
          map[itemCd] = {
            ...item,
            'cbxQty': currentCbxQty.toString(),
            'wrkQty': currentWrkQty,
          };
        }
        return map;
      }).values.toList();
      Get.log('uniqueSmallBoxList2: ${uniqueSmallBoxList2.value.length}');
      Get.log('smallBoxList2: ${smallBoxList2.length}');
      for(var i = 0; i < uniqueSmallBoxList2.length; i++) {
        if (uniqueSmallBoxList2[i]['wrkQty'] != null && uniqueSmallBoxList2[i]['wrkQty'].toString() != '0') {
          isWrkQty.value = true;
        } else {
          isConfirmText.value = '스캔/동기화 되지않은 자재가 있습니다.';
          isConfirm.value = false;
          isWrkQty.value = false;
          break;
        }
      }
      if(isWrkQty.value) {
        for(var i = 0; i < uniqueSmallBoxList2.length; i++) {
          if (uniqueSmallBoxList2[i]['cbxQty'].toString() == uniqueSmallBoxList2[i]['wrkQty'].toString()) {
            isQty.value = true;
          } else {
            isConfirmText.value = '수량이 일치하지않습니다.';
            isConfirm.value = false;
            isQty.value = false;
            break;
          }
        }
      }
      if(isQty.value) {
        for(var i = 0; i < uniqueSmallBoxList2.length; i++) {
          if (uniqueSmallBoxList2[i]['syncYn'] == 'Y') {
            if (uniqueSmallBoxList2[i]['ncbxRmk'] != null &&
                uniqueSmallBoxList2[i]['ncbxRmk'] != '') {
              isReason.value = true;
            } else {
              isConfirmText.value = '동기화 된 자재의 사유를 입력해주세요.';
              isConfirm.value = false;
              isReason.value = false;
              break;
            }
          }
        }
      }

    }else {
      isConfirm.value = true;
    }
    if(isWrkQty.value && isQty.value && isReason.value) {
      isConfirm.value = true;
    }


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S01',
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
          'paramName': 'p_CBX_MA_NO',
          'paramValue': smallBoxList[0]['cbxMaNo'],
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
        final retVal = await HomeApi.to.registMainKitSave(params);

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
      isSaveClick.value = false;
    }

  }

  /// 메모 저장
  Future<void> registMemoSmallKitSave() async {
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S01',
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
      isConfirmClick.value = false;
    }

  }

  /// 새로운 저장!!! 단건
  Future<void> registNewSave() async {
    Get.log('저장 클릭');

    bLoading.value = true;

      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2060_S01',
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
            'paramName': 'p_CBX_MA_NO',
            'paramValue': smallBoxSave[0]['cbxMaNo'] == 'null' ? null : '${smallBoxSave[0]['cbxMaNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_MA_SEQ',
            'paramValue': smallBoxSave[0]['cbxMaSeq'].toString() == 'null' ? null : '${smallBoxSave[0]['cbxMaSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_NO',
            'paramValue': '${smallBoxSave[0]['cbxSuNo']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },

          {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_CD',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_NM',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemNm'].toString().trim()}',
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
            'paramValue': smallBoxSave[0]['qtyUnit'] == 'null' ? null :'${smallBoxSave[0]['qtyUnit'].toString().trim()}',
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
            'paramValue': smallBoxSave[0]['itemNm'],
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
        if(smallBoxSave[0]['extrVal'] != 'D') {
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
        isSaveClick.value = false;
        isConfirmClick.value = false;
      }
    isTotalSave.value = true;
  }



  /// 새로운 디테일 저장
  Future<void> registNewDetailSave() async {
    Get.log('저장 클릭');

    bLoading.value = true;

      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2060_S01',
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
            'paramName': 'p_CBX_MA_NO',
            'paramValue': smallBoxSave[0]['cbxMaNo'] == 'null' ? null : '${smallBoxSave[0]['cbxMaNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_MA_SEQ',
            'paramValue': smallBoxSave[0]['cbxMaSeq'].toString() == 'null' ? '' :'${smallBoxSave[0]['cbxMaSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxSave[0]['cbxSuNo'] == 'null' ? null : '${smallBoxSave[0]['cbxSuNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_CD',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_NM',
            'paramValue': smallBoxSave[0]['itemCd'] == null ? null :'${smallBoxSave[0]['itemNm'].toString().trim()}',
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

        final retVal = await HomeApi.to.registMainKitDetailSave(params);

        if (retVal == '0000') {
          Get.log('디테일 등록되었습니다');
          isDetailSave.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('디테일 등록 실패');
          isDetailSave.value = false;
          isSaveText.value = '저장에 실패하였습니다.';
        }
      } catch (e) {
        Get.log('registSmallKitDetailSave catch !!!!');
        Get.log(e.toString());
        isSaveText.value = '저장에 실패하였습니다.';
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isSaveClick.value = false;
        isConfirmClick.value = false;
      }
    isTotalDetailSave.value = true;
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
        'procedure': 'USP_A2060_S01',
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
            'paramName': 'p_CBX_MA_NO',
            'paramValue': smallBoxSaveList[i]['cbxMaNo'] == 'null' ? null : '${smallBoxSaveList[i]['cbxMaNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_MA_SEQ',
            'paramValue': smallBoxSaveList[i]['cbxMaSeq'].toString() == 'null' ? null : '${smallBoxSaveList[i]['cbxMaSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
           {
            'paramName': 'p_CBX_SU_NO',
            'paramValue': '${smallBoxSaveList[i]['cbxSuNo']}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },

           {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_ITEM_CD',
            'paramValue': smallBoxSaveList[i]['itemCd'] == null ? null :'${smallBoxSaveList[i]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_CD',
            'paramValue': smallBoxSaveList[i]['itemCd'] == null ? null :'${smallBoxSaveList[i]['itemCd'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_EX_ITEM_NM',
            'paramValue': smallBoxSaveList[i]['itemCd'] == null ? null :'${smallBoxSaveList[i]['itemNm'].toString().trim()}',
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
            'paramValue': smallBoxSaveList[i]['prtNo'] == 'O' ? 'Y':'', //syncYn
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
        isSaveClick.value = false;
        isConfirmClick.value = false;
      }
    }
    isTotalSave.value = true;
  }

  /// 디테일 저장
  Future<void> registSmallKitDetailSave() async {
    Get.log('저장 클릭');

    bLoading.value = true;

    for(var i = 0; i < smallBoxDetailList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2060_S01',
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
            'paramName': 'p_CBX_MA_NO',
            'paramValue': smallBoxDetailList[i]['cbxMaNo'] == 'null' ? null : '${smallBoxDetailList[i]['cbxMaNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_MA_SEQ',
            'paramValue': smallBoxDetailList[i]['cbxMaSeq'].toString() == 'null' ? '' :'${smallBoxDetailList[i]['cbxMaSeq'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_CBX_SU_NO',
            'paramValue': smallBoxDetailList[i]['cbxSuNo'] == 'null' ? null : '${smallBoxDetailList[i]['cbxSuNo'].toString().trim()}',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
           {
            'paramName': 'p_SCAN_SEQ',
            'paramValue': null,
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
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

        final retVal = await HomeApi.to.registMainKitDetailSave(params);

        if (retVal == '0000') {
          Get.log('디테일 등록되었습니다');
          isDetailSave.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('디테일 등록 실패');
          isDetailSave.value = false;
          isSaveText.value = '저장에 실패하였습니다.';
        }
      } catch (e) {
        Get.log('registSmallKitDetailSave catch !!!!');
        Get.log(e.toString());
        isSaveText.value = '저장에 실패하였습니다.';
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;
        isSaveClick.value = false;
        isConfirmClick.value = false;
      }
    }
    isTotalDetailSave.value = true;
  }


  /// 메인박스 KIT 자재 QR 조회
  Future<void> checkItemQr(String itemCd) async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxSave.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_R01',
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
          if(retVal.body![1][0]['tagType'] == '20'/* && retVal.body![1][0]['qrNo'] != boxNo.value*/) { // 다른 소박스 찍었을 때?
            smallBoxSave.clear();
            smallBoxSaveList.clear();
            stateManager.removeAllRows();
            stateManager2.removeAllRows();
            await checkQR();
            await smallBoxScan();
          }else {
            smallBoxSave.addAll(retVal.body![1]);
            _duplicationRow();
            //  duplicationQr.value == true ? null : smallBoxSave.addAll(retVal.body![1]);
          }

          Get.log(smallBoxSave.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회 되었습니다.';
            duplicationQr3.value ? statusText.value = '이미 스캔된 QR코드입니다.' : null;
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
      Get.log('checkItemQr catch !!!!');
      Get.log(e.toString());
      textQrController.text = '';
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      //plutoRow();
    }
  }
  void _duplicationRow() async{
    duplicationQr3.value = false;
    duplicationQr2.value = false;
    duplicationQr.value = false;
    outerLoop:
    for(var i = 0; i < smallBoxSaveList.length; i++) {
      for(var ii = 0; ii < smallBoxSave.length; ii++) {
        if(smallBoxSaveList[i]['qrNo'].toString().trim() == smallBoxSave[ii]['qrNo'].toString().trim()) {
          duplicationQr3.value = true;
        //  statusText.value = '이미 스캔된 QR코드입니다.';
          break outerLoop;
        }else {
          duplicationQr3.value = false;
        }
      }
    }
    outerLoop:
    for(var i = 0; i < smallBoxSaveList.length; i++) {
      for(var ii = 0; ii < smallBoxSave.length; ii++) {
        if(smallBoxSaveList[i]['itemCd'].toString().trim() == smallBoxSave[ii]['itemCd'].toString().trim()) {
          duplicationQr2.value = true;
          dupSaveListIndex.value = i;
          break outerLoop;
        }else {
          duplicationQr2.value = false;
        }
      }
    }
    outerLoop:
    for(var i = 0; i < smallBoxList.length; i++) {
      for(var ii = 0; ii < smallBoxSave.length; ii++) {
        if(smallBoxList[i]['itemCd'].toString() != smallBoxSave[ii]['itemCd'].toString()) {
          duplicationQr.value = true;
          //  smallBoxSave.clear();
        }else {
          duplicationQr.value = false;
          break outerLoop;
        }
      }
    }

    Get.log('isRow: ${isRow}');
  }

  /// //////////////////////////////////////////////새롭게 만들어진 프로시저 적용 -류 /////////////////////////////////////////////////////


  /// 메인박스 KIT 박스정보 조회
  Future<void> checkBoxData() async {
    Get.log('QR 조회');

    bLoading.value = true;

    smallBoxDataList.clear();
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_R02',
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
          'paramName': 'p_QR_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqMainKitNew(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxDataList.addAll(retVal.body![1]);

          if(smallBoxDataList[0]['tagType'] == '20') {

            smallBoxSave.clear();
            smallBoxSaveList.clear();
            smallBoxList.clear();
            stateManager.removeAllRows();
            stateManager2.removeAllRows();
            /// 박스정보들 새로 담아서 관리
            projectNm.value = smallBoxDataList[0]['pjtNm2'].toString();
            itemCdNm.value = '${smallBoxDataList[0]['pitmCd'].toString()}/${smallBoxDataList[0]['pitmNm']}';
            itemCd.value = smallBoxDataList[0]['pitmCd'].toString();
            wrkNo.value = smallBoxDataList[0]['wrkNo'].toString();
            boxNo.value = smallBoxDataList[0]['qrNo'].toString();
            wrkCfmDt.value = smallBoxDataList[0]['wrkCfmDttm'].toString();
            cbxMaNo.value = smallBoxDataList[0]['cbxMaNo'].toString();
            setQty.value = smallBoxDataList[0]['setQty'].toString();
            bcSts.value = smallBoxDataList[0]['bcSts'].toString();
          }
          tagType.value = smallBoxDataList[0]['tagType'].toString();
          Get.log(smallBoxDataList.toString());
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
        statusText.value = '조회 실패했습니다.';
        textQrController.text = '';
      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      statusText.value = '조회 실패했습니다.';
      isDbConnected.value = false;
      textQrController.text = '';
    } finally {
      bLoading.value = false;
      //  plutoRow();
    }
  }

  /// 메인박스 KIT 구성 자재정보 조회
  Future<void> checkBoxItemData() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxItemDataList.clear();
    noList2.clear();
    noList3.clear();
    changedRows.clear();
    changedRows2.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_R03',
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
          'paramName': 'p_CBX_MA_NO',
          'paramValue': smallBoxDataList[0]['cbxMaNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqMainKitNew2(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxItemDataList.addAll(retVal.body![1]);
          for(var i = 0; i < smallBoxItemDataList.length; i++) {
            smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
          }

          Get.log(smallBoxItemDataList.toString());
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
        statusText.value = '조회 실패했습니다.';
        textQrController.text = '';
      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      statusText.value = '조회 실패했습니다.';
      isDbConnected.value = false;
      textQrController.text = '';
    } finally {
      bLoading.value = false;
      plutoRowNew();
      smallBoxItemDataList.isNotEmpty ? await checkBoxItemSaveData() : null;
    }
  }


  /// 메인박스 KIT 구성 자재정보 저장된 값 조회
  Future<void> checkBoxItemSaveData() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxItemSaveDataList.clear();
    smallBoxSaveList.clear();
    noList3.clear(); // 색 클리어

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_R04',
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
          'paramName': 'p_CBX_MA_NO',
          'paramValue': cbxMaNo.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqMainKitNew3(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxItemSaveDataList.addAll(retVal.body![1]);


          for(var i = 0; i < smallBoxItemSaveDataList.length; i++) {
            outerLoop:
            for(var ii = 0; ii < smallBoxItemDataList.length; ii++) {
              if(smallBoxItemSaveDataList[i]['itemCd'] == smallBoxItemDataList[ii]['itemCd']) {
                if(smallBoxItemSaveDataList[i]['wrkQty'] == smallBoxItemDataList[ii]['cbxQty']) {
                  /// 색 변경 로직 시작
                  isSaveColor.value = false;
                  isColor.value = true;
                  noList3.add(smallBoxItemSaveDataList[i]['sboxNo']);
                }
                smallBoxItemSaveDataList[i].addAll({'no': '${smallBoxItemDataList[ii]['no']}'});
                break outerLoop;
              }else {
                smallBoxItemSaveDataList[i].addAll({'no': '${smallBoxItemDataList.length + 1}'});
              }
            }
          }
          /*outerLoop:
          for(var i = 0; i < smallBoxItemDataList.length; i++) {
            for(var ii = 0; ii < smallBoxItemSaveDataList.length; ii++) {
              if(smallBoxItemDataList[i]['itemCd'] == smallBoxItemSaveDataList[i]['itemCd']) {
                smallBoxItemSaveDataList[ii].addAll({'no': '${i}'});
                break outerLoop;
              }else {

              }
            }
          }*/
          var seenSboxNo = <String>{}; // 이미 처리한 sboxNo를 추적하기 위한 Set
          for(var ii = 0; ii < smallBoxItemSaveDataList.length; ii++) {
            final name = reasonDropdownList.firstWhere((item) => item['CODE'] == smallBoxItemSaveDataList[ii]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
            smallBoxItemSaveDataList[ii].addAll({'ncbxRmkName': name.toString()});
            smallBoxItemSaveDataList[ii].addAll({'prtNo': smallBoxItemSaveDataList[ii]['syncYn'].toString() == 'Y' ? 'O' : 'X'});
            /// 특정 cell만 드롭다운 버튼 활성화 하기위해서
            var item = smallBoxItemSaveDataList[ii];

            // 'sboxNo'가 처음 등장하고, prtNo가 'O'인 경우
            if (!seenSboxNo.contains(item['sboxNo']) && item['prtNo'] == 'O') {
              smallBoxItemSaveDataList[ii].addAll({'test': 'test'}); // 'a' 추가

              seenSboxNo.add(item['sboxNo']); // 해당 'sboxNo'를 처리된 목록에 추가
            }else {
              smallBoxItemSaveDataList[ii].addAll({'test': ''}); // 'a' 추가
            }
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
        statusText.value = '조회 실패했습니다.';
      }
    } catch (e) {
      Get.log('checkQR catch !!!!');
      Get.log(e.toString());
      statusText.value = '조회 실패했습니다.';
      isDbConnected.value = false;
      textQrController.text = '';
    } finally {
      bLoading.value = false;
      plutoRowNew2();
    }
  }

  /// 메인키트 구성자재 스캔 등록
  Future<void> registMainKitQr() async {
    Get.log('메인키트 구성자재 스캔 시작!!!');

    smallBoxItemMsgList.clear();
    bLoading.value = true;

      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2060_S03',
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

        if (retVal.body![0]['resultMessage'] == '') {
          smallBoxItemMsgList.addAll(retVal.body![1]);
          Get.log('등록되었습니다');
          isDbConnected.value = true;
          await checkBoxItemSaveData();
        } else {
          Get.log('등록 실패');
          statusText.value = retVal.body![0]['resultMessage'].toString();
        }
      } catch (e) {
        Get.log('registMainKitQr catch !!!!');
        Get.log(e.toString());
        statusText.value = '등록 실패했습니다.';
        isDbConnected.value = false;

      } finally {
        bLoading.value = false;

      }
  }

  /// 메인키트 동기화 저장
  Future<void> registMainKitDonggihwa() async {
    Get.log('메인키트 동기화 저장 시작!!!');
    smallBoxDonggihwaMsgList.clear();
    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S07',
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('등록되었습니다');
        smallBoxDonggihwaMsgList.addAll(retVal.body![1]);
        isDbConnected.value = true;
        isSuccsessDong.value = true;
      } else {
        Get.log('등록 실패');
        isSuccsessDong.value = false;
        statusText.value = retVal.body![0]['resultMessage'].toString();
      }
    } catch (e) {
      Get.log('registMainKitDonggihwa catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      isSuccsessDong.value = false;
    } finally {
      bLoading.value = false;

    }
  }


  /// 메인키트 확정처리
  Future<void> registMainKitConfirmNew(String confirmYn) async {
    smallBoxConfirmMsgList.clear();
    Get.log('메인키트 확정처리 시작!!!');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S05',
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
      final retVal = await HomeApi.to.registMainKitConfirm(params);

      if (retVal.body![0]['resultMessage'] == '') {
        smallBoxConfirmMsgList.addAll(retVal.body![1]);
        Get.log('확정되었습니다');
        isDbConnected.value = true;
        isConfirm.value = true;
      } else {
        Get.log('확정 실패');
        isConfirmText.value = retVal.body![0]['resultMessage'].toString();
        isConfirm.value = false;
      }
    } catch (e) {
      Get.log('registMainKitConfirmNew catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      isConfirm.value = false;
    } finally {
      bLoading.value = false;

    }
  }

  /// 목박스 등 자동 저장처리
  Future<void> registMainKitAuto() async {
    Get.log('목박스 자동저장 시작!!!');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S02',
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('목박스 자동저장');
        isDbConnected.value = true;

      } else {
        Get.log('목박스 자동저장 실패');
      }
    } catch (e) {
      Get.log('registMainKitConfirmNew catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;

    }
  }

  /// 메모 및 무게 저장
  Future<void> registMainKitMemoSave() async {
    Get.log('메모 및 무게 저장 시작!!!');

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
          'paramName': 'p_CBX_MA_NO',
          'paramValue': cbxMaNo.value,
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
          'paramName': 'p_BOX_WHT2',
          'paramValue': textWeightController2.text,
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('저장되었습니다');
        isDbConnected.value = true;
        isSave.value = true;
      } else {
        Get.log('확정 실패');
        isSave.value = false;
      }
    } catch (e) {
      Get.log('registMainKitMemoSave catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
      isSave.value = false;
    } finally {
      bLoading.value = false;

    }
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
          'paramValue': itemCd.value, //제품코드
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_SET_QTY',
          'paramValue': smallBoxDataList[0]['setQty'], //제품코드
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
          textItemCdController2.text = smallBoxItemDataList[0]['pitmCd'];

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
          'paramValue': smallBoxDataList[0]['setQty'], //제품코드
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

        if (retVal == '0000') {
          Get.log('등록되었습니다');
          isBomSave.value = true;
          isBomSaveText.value = '저장되었습니다.';
          isDbConnected.value = true;
        } else {
          Get.log('등록 실패');
          isBomSave.value = false;
          isBomSaveText.value = '저장에 실패하였습니다.';
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


  /// 행 추가 저장
  Future<void> registMainKitAddRow() async {
    Get.log('행추가 저장 시작!!!');

    bLoading.value = true;

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_S06',
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
          'paramName': 'p_CBX_MA_NO',
          'paramValue': cbxMaNo.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_ITEM_CD',
          'paramValue': textItemCdController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_ITEM_NM',
          'paramValue': textItemNmController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_CBX_QTY',
          'paramValue': textQtyController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QTY_UNIT',
          'paramValue': textUnitController.text,
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

      if (retVal.body![0]['resultMessage'] == '') {
        Get.log('저장되었습니다');
        isDbConnected.value = true;
       // isSave.value = true;
      } else {
        Get.log('행추가 저장 실패');
      //  isSave.value = false;
      }
    } catch (e) {
      Get.log('registMainKitAddRow catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
     // isSave.value = false;
    } finally {
      bLoading.value = false;

    }
  }


  /// ///////////////////////////////////////////////////////////////////////////////////////////////////////

  /// 메인박스 KIT QR 조회
  Future<void> checkQR() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxList.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_R01',
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
          'paramName': 'p_PDT_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqMainKit(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxList.addAll(retVal.body![1]);
          /// 소박스 이름으로 정렬
          smallBoxList.sort((a, b) {
            var cbxSuNmA = a['cbxSuNm'] ?? '';
            var cbxSuNmB = b['cbxSuNm'] ?? '';
            return cbxSuNmA.compareTo(cbxSuNmB);
          });
          for (var i = smallBoxList.length - 1; i >= 0; i--) {
            String lastTwoChars = smallBoxList[i]['cbxMaNo'].toString();
            String result = lastTwoChars.substring(lastTwoChars.length - 2);
            if (result == '-E') {
              final name = reasonDropdownList
                  .firstWhere((item) => item['CODE'] == smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];

              addRowSaveList.add(smallBoxList[i]);
              smallBoxList.removeAt(i);
            }else {
              final name = reasonDropdownList
                  .firstWhere((item) => item['CODE'] == smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
            }
            smallBoxList[i].addAll({'bomQty': (smallBoxList[i]['cbxQty'] / smallBoxList[i]['setQty']).toStringAsFixed(1)}); // bom 수량 계산

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

  /// 확정시 조회
  Future<void> checkQR2() async {
    Get.log('QR 조회');

    bLoading.value = true;
    smallBoxList2.clear();


    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2060_R01',
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
          'paramName': 'p_PDT_NO',
          'paramValue': boxNo.value,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqMainKit(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          smallBoxList2.addAll(retVal.body![1]);
          /// 소박스 이름으로 정렬
          smallBoxList2.sort((a, b) {
            var cbxSuNmA = a['cbxSuNm'] ?? '';
            var cbxSuNmB = b['cbxSuNm'] ?? '';
            return cbxSuNmA.compareTo(cbxSuNmB);
          });

          Get.log(smallBoxList2.toString());
          Get.log('조회 성공');
          isDbConnected.value = true;
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
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
              MapEntry(key,
                  PlutoCell(
                  value: value ?? value
                  )
              ),
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


  /// 새롭게 만든 프로시저 관련 시작 ----------------------------------------------------------------------------------
  ///
  ///
  Future<void> plutoRowNew() async {

    newRows.value = List<PlutoRow>.generate(smallBoxItemDataList.length, (index) =>
        PlutoRow(
          cells: Map.from(smallBoxItemDataList.value[index].map((key, originalValue) {
            // cbxSuNm 키에 대한 로직
            if (key == 'cbxSuNo') {
              if (index == 0) {
                smallboxNumbering.value = originalValue.toString();
                cellValue.value = smallboxNumbering.value; // 소박스 번호 입력
              } else {
                currentValue.value = originalValue.toString();
                if (currentValue.value != smallboxNumbering.value) {
                  smallboxNumbering.value = currentValue.value; // 값 업데이트
                  cellValue.value = currentValue.value; // 새로운 값으로 업데이트
                  isText.value = true; // 텍스트 표시
                } else {
                  isText.value = false; // 동일하면 텍스트 숨김
                  cellValue.value = ''; // 빈 문자열 설정
                }
              }
              //return MapEntry(key, PlutoCell(value: controller.cellValue.value));
            }
            // PlutoCell로 값 래핑
            return MapEntry(key, PlutoCell(value: key == 'cbxSuNo' ? cellValue.value : originalValue));
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
  /*  sortedRows.sort((a, b) {
      int noA = int.parse(a['no'].toString() ?? '0');
      int noB = int.parse(b['no'].toString() ?? '0');
      return noA.compareTo(noB); // 오름차순 정렬
    });
    smallBoxSaveList.value = sortedRows;
*/
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
/*  Future<void> requestPermissions() async {
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
