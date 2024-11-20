
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/net/home_api.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:path/path.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PickingController extends GetxController with GetSingleTickerProviderStateMixin {

  GlobalService gs = Get.find();

  var textJisiController = TextEditingController();
  var textProjectController = TextEditingController();
  var textProjectController2 = TextEditingController();
  var textItemCdController = TextEditingController();
  var textItemNmController = TextEditingController();
  var textWrkNoController = TextEditingController(); // 제조번호


  late  PlutoGridStateManager gridStateMgr;
  late  PlutoGridStateManager gridStateMgr2;


  /// 리스트
  RxList<dynamic> pickingFirstList = [].obs; // 피킹 첫번째 조회된 리스트
  RxList<dynamic> pickingSecondList = [].obs; // 피킹 두번째 조회된 리스트
  RxList<dynamic> pickingThirdList = [].obs; // 피킹 세번째 조회된 리스트
  RxList<dynamic> registRackIpgoList = [].obs; // 최종 리스트(qr입력마다 다 넣어준 리스트)
  RxList<dynamic> registPickingList = [].obs; //
  RxList<dynamic> registPickingList2 = [].obs; //



  RxDouble height = 0.0.obs;

  RxInt rowspan = 0.obs;



  /// 그리드
  //List<PlutoRow> rowDatas = [];
  var rowDatas = <PlutoRow>[].obs;
  var rowDatas2 = <PlutoRow>[].obs;

  List<PlutoRow> insertRow = [];




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
  RxString exelFileName = ''.obs; // 엑셀파일 이름
  RxString pdfFileName = ''.obs; // pdf파일 이름
  RxBool isExelSuc = false.obs; // 엑셀파일생성 성공여부
  RxBool isPdfSuc = false.obs; // PDF 파일생성 성공여부
  RxBool isFocus = false.obs;
  RxBool isDbConnected = true.obs;


  void requestFocus() {
    Future.microtask(() => focusNode.requestFocus());
    if(focusCnt.value++ > 1) focusCnt.value = 0;
    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
    isFocus.value = true;
  }

  /// 다른 위치 랙출고
  Future<void> registOtherRackBtn(int i) async {
    Get.log('다른 위치 랙출고 클릭');

    bLoading.value = true;
    isRegistOtherRackBtn.value = false;
/*    for(var ee = 0; ee < pickingThirdList.length; ee++) {
      if(pickingThirdList[ee]['pickRank'] == pickingThirdList[i]['pickRank']) {
        registPickingList2.add(pickingThirdList[ee]);
      }
    }
    for(var e = 0; e < registPickingList2.length; e++) {*/
    registPickingList2.add(pickingThirdList[i]);
      var params = {
        'programId': 'A1020',
        'procedure': 'USP_A2050_S01',
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
            'paramName': 'p_PICK_NO',
            'paramValue': registPickingList2[0]['pickNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_PICK_SEQ',
            'paramValue': registPickingList2[0]['pickSeq'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_BOX_NO',
            'paramValue': registPickingList2[0]['boxNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_LOT_NO',
            'paramValue': registPickingList2[0]['boxNo'],
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
            'paramValue': registPickingList2[0]['zoneCd'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_LOC_CD',
            'paramValue': registPickingList2[0]['locCd'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_LOC_SEQ',
            'paramValue': registPickingList2[0]['locSeq'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_LOT_NO',
            'paramValue': registPickingList2[0]['inbLotNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_INB_LOT_SEQ',
            'paramValue': registPickingList2[0]['inbLotSeq'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_TAG_NO',
            'paramValue': registPickingList2[0]['tagNo'],
            'paramJdbcType': 'VARCHAR',
            'paramMode': 'IN'
          },
          {
            'paramName': 'p_USR_ID',
            'paramValue': gs.loginId,
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
        final retVal = await HomeApi.to.registPicking(params);

        if (retVal == '0000') {
          Get.log('다른 위치 랙출고');
          isRegistOtherRackBtn.value = true;
          isDbConnected.value = true;
        } else {
          Get.log('다른 위치 랙출고 실패');

        }
      } catch (e) {
        Get.log('registOtherRackBtn catch !!!!');
        Get.log(e.toString());
        isDbConnected.value = false;
      } finally {
        bLoading.value = false;

      }

  }


  /// 랙출고
  Future<void> registRackBtn(int i) async {
    Get.log('랙출고 클릭');
    isRegistRackBtn.value = false;
    bLoading.value = true;
    for(var ee = 0; ee < pickingSecondList.length; ee++) {
      if(pickingSecondList[ee]['pickRank'] == pickingSecondList[i]['pickRank']) {
        registPickingList.add(pickingSecondList[ee]);
      }
    }
     for(var e = 0; e < registPickingList.length; e++) {

        var params = {
          'programId': 'A1020',
          'procedure': 'USP_A2050_S01',
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
              'paramName': 'p_PICK_NO',
              'paramValue': registPickingList[e]['pickNo'],
              'paramJdbcType': 'VARCHAR',
              'paramMode': 'IN'
            },
            {
              'paramName': 'p_PICK_SEQ',
              'paramValue': registPickingList[e]['pickSeq'],
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
          final retVal = await HomeApi.to.registPicking(params);

          if (retVal == '0000') {
            Get.log('랙출고');
            isRegistRackBtn.value = true;
            isDbConnected.value = true;
          } else {
            Get.log('랙출고 실패');

          }
        } catch (e) {
          Get.log('registRackBtn catch !!!!');
          Get.log(e.toString());
          isDbConnected.value = false;
        } finally {
          bLoading.value = false;

        }

      }

  }

  /// 피킹 세번째 조회
  Future<void> reqPickingThird(int i) async {
    Get.log('조회');

    bLoading.value = true;
    pickingThirdList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2050_R03',
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
          'paramName': 'p_PICK_NO',
          'paramValue': pickingSecondList[i]['pickNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PICK_SEQ',
          'paramValue': pickingSecondList[i]['pickSeq'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqPickingSecond(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          pickingThirdList.value.addAll(retVal.body![1]);
         /* pickingThirdList.value.sort((a, b) {
            int noA = int.parse(a['pickRank'].toString() ?? '0');
            int noB = int.parse(b['pickRank'].toString() ?? '0');
            return noA.compareTo(noB); // 오름차순 정렬
          });*/
          Get.log(pickingThirdList.toString());
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
      Get.log('reqPickingThird catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      plutoRow2();
    }
  }

  /// 피킹 두번째 조회
  Future<void> reqPickingSecond() async {
    Get.log('조회');

    bLoading.value = true;
    pickingSecondList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2050_R02',
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
          'paramName': 'p_PICK_NO',
          'paramValue': pickingFirstList[currentFirstIndex.value]['pickNo'],
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqPickingSecond(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {

          pickingSecondList.value.addAll(retVal.body![1]);
          pickingSecondList.value.sort((a, b) {
            int noA = int.parse(a['pickRank'].toString() ?? '0');
            int noB = int.parse(b['pickRank'].toString() ?? '0');
            return noA.compareTo(noB); // 오름차순 정렬
          });
          Get.log('${pickingSecondList.length}');
          Get.log(pickingSecondList.toString());
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
    }
  }

  /// 피킹 첫번째 조회
  Future<void> reqPickingFirst() async {
    Get.log('조회');

    bLoading.value = true;
    pickingFirstList.clear();

    var params = {
      'programId': 'A1020',
      'procedure': 'USP_A2050_R01',
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
          'paramName': 'p_PICK_ORD_DT_FR',
          'paramValue': dayStartValue.value.replaceAll('-', ''),
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PICK_ORD_DT_TO',
          'paramValue': dayEndValue.value.replaceAll('-', ''),
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
          'paramName': 'p_PICK_NO',
          'paramValue': textJisiController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
        {
          'paramName': 'p_PJT_NM',
          'paramValue': textProjectController.text,
          'paramJdbcType': 'VARCHAR',
          'paramMode': 'IN'
        },
      ]
    };

    try {
      final retVal = await HomeApi.to.reqPickingFirst(params);

      if (retVal.resultCode == '0000') {
        if(retVal.body![0]['resultMessage'] == '') {
          pickingFirstList.value.addAll(retVal.body![1]);
          Get.log(pickingFirstList.toString());
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
      Get.log('reqPickingFirst catch !!!!');
      Get.log(e.toString());
      isDbConnected.value = false;
    } finally {
      bLoading.value = false;
      plutoRow();
    }
  }


  // Excel 파일 생성 함수
  Future<void> exportToExcel(List<PlutoRow> rows, List<String> columnNames) async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();
   // List<String> columnNames = ['Name', 'Age', 'City'];
    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];
    // 컬럼 이름 추가
    for (int i = 0; i < columnNames.length; i++) {
      sheet.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).value = TextCellValue(columnNames[i]);
    }

    // 각 행 데이터를 추가
    for (int rowIndex = 0; rowIndex < rows.length; rowIndex++) {
      var row = rows[rowIndex];
      List<String> rowValues = [
        row.cells['pickNo']?.value.toString() ?? '',
        row.cells['pickUser']?.value.toString() ?? '',
        row.cells['pjtNm']?.value.toString() ?? '',
        row.cells['itemCd']?.value.toString() ?? '',
        row.cells['itemNm']?.value.toString() ?? '',
        row.cells['wrkNo']?.value.toString() ?? '',
        row.cells['rackOutBtn']?.value.toString() ?? '',
      ];

      // 행 데이터 추가
      for (int colIndex = 0; colIndex < rowValues.length; colIndex++) {
        sheet.cell(CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex + 1)).value = TextCellValue(rowValues[colIndex]);
      }
    }

    // Excel 파일 저장
    String fileName = "picking_${DateFormat('yyMMddHHmmss').format(DateTime.now())}.xlsx";
    String outputFile = "${appDocDir.path}/$fileName";
    exelFileName.value = fileName;
    List<int>? fileBytes = excel.save();
    if (fileBytes != null) {
      File(join(outputFile))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    }

    print('Excel 파일이 성공적으로 생성되었습니다: $outputFile');
  }

  Future<void> moveFileToDownloads() async {
    isExelSuc.value = false;
    try{
      // 기존 파일 경로
      Directory appDocDir = await getApplicationDocumentsDirectory();
      File originalFile = File('${appDocDir.path}/${exelFileName.value}');

      // 새 파일 경로
      Directory downloadsDir = Directory('/storage/emulated/0/Download'); // Downloads 폴더
      File newFile = File('${downloadsDir.path}/${exelFileName.value}');

      // 파일 이동
      if (await originalFile.exists()) {
        await originalFile.copy(newFile.path);
        print('파일이동 경로: ${newFile.path}');
      } else {
        print('원본파일이 존재하지않습니다.');
      }
      isExelSuc.value = true;
    }catch(e) {
      Get.log('file catch !!!!');
      Get.log(e.toString());
    }
  }

  Future<void> exportToPdf(List<PlutoRow> rows, List<String> columnNames) async {
    final pdf = pw.Document();
    // 폰트 로드
    final fontData = await rootBundle.load("assets/font/godic.ttf");
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());
    // PDF 테이블을 만들기 위한 데이터 생성
    final tableHeaders = columnNames;
    final tableData = rows.map((row) {
      return [
        row.cells['pickNo']?.value.toString() ?? '',
        row.cells['pickUser']?.value.toString() ?? '',
        row.cells['pjtNm']?.value.toString() ?? '',
        row.cells['itemCd']?.value.toString() ?? '',
        row.cells['itemNm']?.value.toString() ?? '',
        row.cells['wrkNo']?.value.toString() ?? '',
        row.cells['rackOutBtn']?.value.toString() ?? '',
      ];
    }).toList();

    // PDF 페이지에 테이블 추가
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Table.fromTextArray(
            border: pw.TableBorder.all(color: PdfColors.black),
            cellStyle: pw.TextStyle(fontSize: 10, font: ttf),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
            headers: tableHeaders,
            data: tableData,
          );
        },
      ),
    );

    // 파일 저장
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    String fileName = "picking_${DateFormat('yyMMddHHmmss').format(DateTime.now())}.pdf";
    String outputFile = "${appDocDir.path}/${fileName}";
    pdfFileName.value = fileName;
    final file = File(outputFile);
    await file.writeAsBytes(await pdf.save());

    print('PDF 파일이 성공적으로 생성되었습니다: $outputFile');
  }

  Future<void> movePdfFileToDownloads() async {
    isPdfSuc.value = false;
   try{
     // 기존 파일 경로
     Directory appDocDir = await getApplicationDocumentsDirectory();
     File originalFile = File('${appDocDir.path}/${pdfFileName.value}');

     // 새 파일 경로
     Directory downloadsDir = Directory('/storage/emulated/0/Download'); // Downloads 폴더
     File newFile = File('${downloadsDir.path}/${pdfFileName.value}');

     // 파일 이동
     if (await originalFile.exists()) {
       await originalFile.copy(newFile.path);
       print('파일이동 경로: ${newFile.path}');
     } else {
       print('원본파일이 존재하지않습니다.');
     }
     isPdfSuc.value = true;
   }catch(e) {
     Get.log('file catch !!!!');
     Get.log(e.toString());
   }
  }


  Future<void> plutoRow() async {

    rowDatas.value = List<PlutoRow>.generate(pickingFirstList.length, (index) =>
        PlutoRow(cells:
        Map.from((pickingFirstList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value == null ? '' : key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : value )),
        )))
    );
    gridStateMgr.removeAllRows();
    gridStateMgr.appendRows(rowDatas.value);
    gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  Future<void> plutoRow2() async {

    rowDatas2.value = List<PlutoRow>.generate(pickingThirdList.length, (index) =>
        PlutoRow(cells:
        Map.from((pickingThirdList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value:  value )),
        )))
    );
    gridStateMgr2.removeAllRows();
    gridStateMgr2.appendRows(rowDatas2.value);
    gridStateMgr2.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
  }

  final FocusNode focusNode = FocusNode();

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
  }

  @override
  void onReady() {
    Get.log('IpgoController - onReady !!');

  }
}
