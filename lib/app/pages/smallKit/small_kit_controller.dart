

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

class SmallKitController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();


  RxSet<String> changedRows = <String>{}.obs; // 동기화 시에
  RxSet<String> changedRows2 = <String>{}.obs;
  /// 리스트
  var rows = <PlutoRow>[].obs;
  var rows2 = <PlutoRow>[].obs;
  var rows3 = <PlutoRow>[].obs; //BOM
  var rows4 = <PlutoRow>[].obs; //BOM2
  var insertRow = <PlutoRow>[].obs;
  RxList<dynamic> isRow = [].obs; // 리스트 길이만큼 false 추가용

  RxList<dynamic> smallBoxList = [].obs; // 소박스 qr찍고 난 정보
  RxList<dynamic> smallBoxSave = [].obs;
  RxList<dynamic> smallBoxSaveList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트
  RxList<dynamic> smallBoxDetailList = [].obs; // 자재 qr찍고 오른쪽 최종 리스트

  RxList<dynamic> reasonDropdownTotalList = [].obs;
  RxList<dynamic> reasonDropdownList = [{'CODE':'', 'NAME': ''}].obs;
  RxMap<String, String> selectedReasonDropdown = {'CODE':'', 'NAME': ''}.obs;
  RxList<dynamic> reasonNames = [].obs;


  late PlutoGridStateManager stateManager;
  late PlutoGridStateManager stateManager2;
  late PlutoGridStateManager stateManager3; // BOM 리스트
  late PlutoGridStateManager stateManager4; // BOM 리스트 디테일
  TextEditingController textQrController = TextEditingController();
  TextEditingController textMemoController = TextEditingController();

  /// BOM
  TextEditingController textSaleOrdController = TextEditingController();
  TextEditingController textItemCdController = TextEditingController();
  TextEditingController textPrdOrdController = TextEditingController();


  RxInt focusCnt = 0.obs;
  RxString projectNm = ''.obs;
  RxString itemCdNm = ''.obs;
  RxString wrkNo = ''.obs;
  RxString boxNo = ''.obs;
  RxString wrkCfmDt = ''.obs;
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
  RxBool isConfirm = false.obs; //확정 가능상태 여부
  RxString isConfirmText = ''.obs; //확정 불가능상태 이유
  RxBool noSync = false.obs; // 이전에 동기화된 내역 확인
  RxBool isQrFocus = false.obs;

  RxBool isSaveClick = false.obs; // 중복클릭 방지
  RxBool isConfirmClick = false.obs; // 중복클릭 방지
  RxBool isDbConnected = true.obs;


  final FocusNode focusNode = FocusNode();

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
        isSaveClick.value = false;
      }

  }

  /// 메모 저장
  Future<void> registMemoSmallKitSave() async {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2025_S01',
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
      'procedure': 'USP_A2025_R01',
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
          if(retVal.body![1][0]['tagType'] == '90' && retVal.body![1][0]['qrNo'] != boxNo.value) {
            smallBoxSave.clear();
            smallBoxSaveList.clear();
            stateManager.removeAllRows();
            stateManager2.removeAllRows();
            await checkQR();
            await smallBoxScan();
            isDbConnected.value = true;
          }else {
            smallBoxSave.addAll(retVal.body![1]);
            _duplicationRow();
            //  duplicationQr.value == true ? null : smallBoxSave.addAll(retVal.body![1]);
          }
          statusText.value = '정상 조회되었습니다.';
          Get.log(smallBoxSave.toString());
          Get.log('조회 성공');
        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
          statusText.value = retVal.body![0]['resultMessage'];
          isDbConnected.value = false;
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
          wrkCfmDt.value = retVal.body![1][0]['wrkCfmDttm'].toString();
          for(var i = 0; i < smallBoxList.length; i++){
            isRow.add(false);
          }

          Get.log(smallBoxList.toString());
          Get.log('조회 성공');
          statusText.value = '정상 조회되었습니다.';
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

 /* Future<void> requestPermissions() async {
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
   //  requestPermissions();
    reqCommon();
  }

  @override
  void onReady() {
    Get.log('SmallKitController - onReady !!');

  }
}
