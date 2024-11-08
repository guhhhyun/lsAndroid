

import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/model/ipgoModel/ipgo_model.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:pluto_grid/pluto_grid.dart';

class IpgoController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();
  late TabController tabController;

  var textInvnrController = TextEditingController();
  var textItemController = TextEditingController();
  var textProjectController = TextEditingController();
  var textQrController = TextEditingController();
  var textStatusController = TextEditingController();
  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;
  /// 입고취소
  var textInvnrController2 = TextEditingController();
  var textItemController2 = TextEditingController();
  var textProjectController2 = TextEditingController();
  late  PlutoGridStateManager gridStateMgr3;

  /// 리스트
  RxList<dynamic> invnrList = [].obs; // 거래명세서 리스트
  RxList<dynamic> ipgoList = [].obs; // 최종입고등록 리스트
  RxList<dynamic> ipgoQrList = [].obs; // qr코드 찍을 때 조회되는 리스트

  RxList<dynamic> ipgoCancelList = [].obs; // 입고취소리스트
 // RxList<dynamic> selectedCancelList = [].obs; // 선택된 입고취소리스트
  RxList<dynamic> ipgoCancelBollList = [].obs;
  RxDouble height = 50.0.obs;

  RxDouble invnrHeight = 100.0.obs;

  RxList<dynamic> cheburnIpgoList = [].obs; // 채번리스트



  /// 그리드
  List<PlutoRow> rowDatas = [];
  var rowDatas2 = <PlutoRow>[].obs;
  List<PlutoRow> insertRow = [];

  var rowDatas3 = <PlutoRow>[].obs;


  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime.now();
  DateTime firstDayOfMonth2 = DateTime.now();
  RxString dayStartValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayEndValue = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString dayStartValue2 = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs; ///입고취소 입고일자
  RxString dayEndValue2 = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs; ///입고취소 입고일자

  RxList<dynamic> containerList = [{'CODE':'1', 'NAME': 'KIT 작업장'}].obs;
  RxMap<String, String> selectedContainer = {'CODE':'', 'NAME': 'KIT 작업장'}.obs;
  RxList<dynamic> cancelContainerList = [{'CODE':'1', 'NAME': 'KIT 작업장'}].obs;
  RxMap<String, String> selectedCancelContainer = {'CODE':'', 'NAME': 'KIT 작업장'}.obs;
  RxList<dynamic> zoneTotalList = [].obs;
  RxList<dynamic> zoneList = [{'CODE':'', 'NAME': '전체'}].obs;
  RxMap<String, String> selectedZone = {'CODE':'', 'NAME': '전체'}.obs;
  RxList<dynamic> ipgoDropdownTotalList = [].obs;
  RxList<dynamic> ipgoDropdownList = [{'CODE':'', 'NAME': '전체'}].obs;
  RxMap<String, String> selectedIpgoDropdown = {'CODE':'', 'NAME': '전체'}.obs;
  RxBool bLoading = false.obs;
  RxInt focusCnt = 0.obs;
  RxBool isSelectedInvnr = false.obs; // 거래명세서 선택된 값이 있는지 여부
  RxBool isDuplQr = false.obs; // 중복qr 선택된 값이 있는지 여부
  RxInt selectedInvnrIndex = 1.obs; // 선택된 거래명세서의 index
  RxString statusText = ''.obs;
  RxString cheburnDate = ''.obs; // 채번날짜
  RxString cheburnInbNumber = ''.obs; // 끝 6자리
  RxString cheburnLotNumber = ''.obs; // 끝 6자리
  RxBool isQr = false.obs;


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
          zoneTotalList.addAll(retVal.body![1]);
          for(var i = 0; i < zoneTotalList.length; i++) {
            zoneList.add(
                {'CODE': '${zoneTotalList[i]['ZONE_CD']}',
                  'NAME': '${zoneTotalList[i]['ZONE_NM']}'
                }

            );
          }
          Get.log('조회 성공');
          Get.log('$zoneList');
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
          ipgoDropdownTotalList.addAll(retVal.body![1]);
          for(var i = 0; i < ipgoDropdownTotalList.length; i++) {
            ipgoDropdownList.add(
              {'CODE': '${ipgoDropdownTotalList[i]['DTL_CD']}',
                'NAME': '${ipgoDropdownTotalList[i]['CD_NM']}'
              }

            );
          }
          Get.log('조회 성공');
          Get.log('$ipgoDropdownList');
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

  /// 입고 채번 조회
  Future<void> reqCheburnIpgo() async {

    bLoading.value = true;
    cheburnIpgoList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A1020_R04',
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
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCheburnIpgo(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          cheburnIpgoList.value.addAll(retVal.body![1]);
          Get.log('채번 리스트 조회: ${cheburnIpgoList.toString()}');
          Get.log('조회 성공');
          cheburnDate.value = DateFormat('yyMMdd').format(DateTime.now());
          int lastTwoDigits = int.parse(cheburnIpgoList[0]['inbNo'].toString().substring(cheburnIpgoList[0]['inbNo'].toString().length - 2));
          cheburnInbNumber.value = (int.parse(cheburnIpgoList[0]['inbNo'].toString().replaceRange(0, 10, '')) + 1).toString();
          cheburnLotNumber.value = (int.parse(cheburnIpgoList[0]['inbLotNo'].toString().replaceRange(0, 10, '')) + 1).toString();

        }else{
          Get.log('${retVal.body![0]['resultMessage']}');
        }

      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('cheburnIpgoList catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;

    }
  }

  /// 입고 취소
  Future<void> registCancelIpgoBtn() async {
    Get.log('입고취소 클릭');

    bLoading.value = true;

    for(var e = 0; e < ipgoCancelBollList.length; e++) {
      if(ipgoCancelBollList[e] == true) {
          var params = {
            'programId': 'A1020',
            'procedure': 'USP_A1020_S02',
            'params': [
              {
                'paramName': 'p_work_type',
                'paramValue': 'D',
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
                'paramValue': ipgoCancelList[e]['whCd'],
                'paramJdbcType': 'VARCHAR',
                'paramMode': 'IN'
              },
              {
                'paramName': 'p_INB_NO',
                'paramValue': ipgoCancelList[e]['inbNo'],
                'paramJdbcType': 'VARCHAR',
                'paramMode': 'IN'
              },
              {
                'paramName': 'p_INB_SEQ',
                'paramValue': ipgoCancelList[e]['inbSeq'],
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
            final retVal = await HomeApi.to.registCancelIpgo(params);

            if (retVal == '0000') {
              Get.log('입고취소되었습니다');

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

  /// 입고취소 조회
  Future<void> cancelCheckBtn() async {
    Get.log('입고취소 조회 버튼 클릭');

    bLoading.value = true;
    ipgoCancelList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A1020_R03',
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
          'paramName': 'p_INB_DT_FR',
          'paramValue': '${dayStartValue2.replaceAll('-', '')}',
          //   'paramValue': '20240101',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_INB_DT_TO',
          'paramValue': '${dayEndValue2.replaceAll('-', '')}',
          // 'paramValue': '20240924',
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
          'paramName': 'p_ZONE_CD',
          'paramValue': selectedZone['CODE'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_INB_TYPE',
          'paramValue': selectedIpgoDropdown['CODE'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_DOC_NO',
          'paramValue': textInvnrController2.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_ITEM_CD',
          'paramValue': textItemController2.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PJT_NM',
          'paramValue': textProjectController2.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqCancelIpgo(params);

      if (retVal.resultCode == '0000') {
        ipgoCancelList.value.addAll(retVal.body![1]);
        for(var i = 0; i < ipgoCancelList.length; i++) {
          ipgoCancelBollList.add(false);
        }
        Get.log(ipgoCancelList.toString());
        Get.log('입고취소 조회 성공');
      } else {
        Get.log('입고취소 조회 실패');

      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
      plutoRow3();
    }
  }

  /// 입고 등록
  Future<void> registIpgoBtn() async {
    Get.log('입고 등록 클릭');

    bLoading.value = true;

    for(var i = 0; i < ipgoList.length; i++) {
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A1020_S01',
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
            'paramValue': invnrList[selectedInvnrIndex.value]['whCd'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_NO',
            'paramValue': 'INBN$cheburnDate$cheburnInbNumber',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_TYPE',
            'paramValue': invnrList[selectedInvnrIndex.value]['inbType'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_DT',
            'paramValue': DateFormat('yyyyMMdd').format(DateTime.now()),
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_LOT_NO',
            'paramValue': 'LINB$cheburnDate$cheburnLotNumber',
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_DOC_NO',
            'paramValue': invnrList[selectedInvnrIndex.value]['inbType'] == '20' ? null : invnrList[selectedInvnrIndex.value]['doc1'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QR_NO',
            'paramValue': ipgoList[i]['qrNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_QTY',
            'paramValue': ipgoList[i]['qty'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_FST_ROW_YN',
            'paramValue': i == 0 ? 'Y' : 'N',
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
        final retVal = await HomeApi.to.registIpgo(params);

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

  }

  /// 입고 QR 조회
  Future<void> checkQR() async {
    Get.log('QR 조회');

    bLoading.value = true;
    ipgoQrList.clear();
    statusText.value = '';
    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A1020_R02',
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
          'paramValue': invnrList[selectedInvnrIndex.value]['whCd'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_DOC1',
          'paramValue': invnrList[selectedInvnrIndex.value]['doc1'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_QR_NO',
          'paramValue': textQrController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        }

      ]
    };

    try {
      final retVal = await HomeApi.to.reqIpgoQr(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          ipgoQrList.value.addAll(retVal.body![1]);
          Get.log(ipgoQrList.toString());
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

    }
  }


  /// 입고 조회
  Future<void> checkBtn() async {
    Get.log('조회 버튼 클릭');

    bLoading.value = true;
    invnrList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A1020_R01',
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
          'paramName': 'p_GR_DT_FR',
          'paramValue': '${dayStartValue.replaceAll('-', '')}',
       //   'paramValue': '20240101',
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_GR_DT_TO',
          'paramValue': '${dayEndValue.replaceAll('-', '')}',
         // 'paramValue': '20240924',
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
          'paramName': 'p_DOC1',
          'paramValue': textInvnrController2.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_ITEM_CD',
          'paramValue': textItemController2.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PJT_NM',
          'paramValue': textProjectController2.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqIpgo(params);

      if (retVal.resultCode == '0000') {
        invnrList.value.addAll(retVal.body![1]);
        Get.log(invnrList.toString());
        Get.log('조회 성공');
      } else {
        Get.log('조회 실패');

      }
    } catch (e) {
      Get.log('checkBtn catch !!!!');
      Get.log(e.toString());
    } finally {
      bLoading.value = false;
      plutoRow();
    }
  }

  Future<void> plutoRow() async {
    rowDatas = List<PlutoRow>.generate(invnrList.length, (index) =>
        PlutoRow(cells:
        Map.from((invnrList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
        )))
    );
    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas);
    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }
  Future<void> plutoRow2() async {
    rowDatas2.value = List<PlutoRow>.generate(ipgoList.length, (index) =>
        PlutoRow(cells:
        Map.from((ipgoList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
        )))
    );
    gridStateMgr2.removeAllRows();
    gridStateMgr2.appendRows(rowDatas2.value);
    gridStateMgr2.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  Future<void> plutoRow3() async {
    if(ipgoCancelList.isNotEmpty) {
      for(var i = 0; i < ipgoCancelList.length; i++) {
        ipgoCancelList[i].addAll({'checkBox': ''});
      }
    }
    Get.log('입고취소리스트: ${ipgoCancelList}');
    rowDatas3.value = List<PlutoRow>.generate(ipgoCancelList.length, (index) =>
        PlutoRow(cells:
        Map.from((ipgoCancelList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value ?? ''/*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */ )),
        )))
    );
    gridStateMgr3.removeAllRows();
    gridStateMgr3.appendRows(rowDatas3.value);
    gridStateMgr3.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
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
    firstDayOfMonth = DateTime(now.year, now.month, 1);
    firstDayOfMonth2 = DateTime(now.year, now.month -1, 1);
    dayStartValue.value = DateFormat('yyyy-MM-dd').format(firstDayOfMonth);
    dayStartValue2.value = DateFormat('yyyy-MM-dd').format(firstDayOfMonth2);
    tabController = TabController(length: 2, vsync: this);
    reqCommon();
    reqCommon2();
  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
