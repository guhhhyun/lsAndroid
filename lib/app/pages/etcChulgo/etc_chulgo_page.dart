
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/etcChulgo/etc_chulgo_controller.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';

import 'package:pluto_grid/pluto_grid.dart';

class EtcChulgoPage extends StatefulWidget {
  const EtcChulgoPage({super.key});

  @override
  State<EtcChulgoPage> createState() => _EtcChulgoPageState();
}

class _EtcChulgoPageState extends State<EtcChulgoPage> {
  @override
  void initState() {
    //  late  PlutoGridStateManager gridStateMgr3;
    super.initState();

  }


  EtcChulgoController controller = Get.find();


  /// 키보드 엔터 없이 그리드에서 업데이트된 항목 바로 적용 시켜주기 위한 로직 /////////////////////////////////////////////////////////////
  void _listener() {
    if (controller.gridStateMgr5.currentCell == controller.currentCell) {
      return;
    }

    if (controller.gridStateMgr5.isEditing && controller.gridStateMgr5.currentCell != null) {

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.initialValue = controller.gridStateMgr5.textEditingController?.text;

        controller.gridStateMgr5.textEditingController!.addListener(_textEditingListener);
        if (controller.gridStateMgr5.textEditingController?.selection != null) {
          controller.gridStateMgr5.textEditingController!.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.gridStateMgr5.textEditingController!.text.length,
          );
        }

      });
    } else {
      controller.initialValue = null;

      controller.gridStateMgr5.textEditingController?.removeListener(_textEditingListener);
    }

    controller.currentCell = controller.gridStateMgr5.currentCell;
  }

  void _textEditingListener() {
    controller.debounce.debounce(callback: _update);
  }

  void _update() {
    if (controller.initialValue == controller.gridStateMgr5.textEditingController?.text) {
      return;
    }

    controller.initialValue = null;

    if (controller.currentCell!.column.field == 'qty') {

      print('선택한 값: ${controller.gridStateMgr5.textEditingController?.text}');

      controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][controller.currentCell!.row!.sortIdx].addAll({'qty': controller.gridStateMgr5.textEditingController?.text});
      controller.etcChulgoSaveQrList[controller.currentRowIndex2.value].addAll({'qty': controller.gridStateMgr5.textEditingController?.text});

    }


    print('이건가? ${controller.gridStateMgr5.textEditingController?.text}');
  }


  @override
  Widget build(BuildContext context) {
    controller.isFocus.value == false ? controller.requestFocus() : null;
    return WillPopScope(
      onWillPop: () {
        Get.offAll(HomePage());
        return Future(() => true);
      },
      child: Scaffold(
        backgroundColor: AppTheme.white,
        body: SafeArea(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  CommonAppbarWidget(title: '기타출고', isLogo: false, isFirstPage: true ),
                  _subBody(context),

                ],
              ),
              //  Obx(() => CommonLoading(bLoading: controller.isLoading.value))
            ],
          ),
        ),
        //  bottomNavigationBar: _bottomButton(context), // 점검의뢰 등록
      ),
    );
  }


  Widget _subBody(BuildContext context) {
    return SliverToBoxAdapter(
        child: Obx(() => Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: AppTheme.black,
                height: 1,
              ),
              Container(
                height: 12,
              ),
              _SearchCondition(context),
              Container(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    _invnrTextForm('자재코드',0),
                    SizedBox(width: 24,),
                    _invnrTextForm('자재명',1)
                  ],
                ),
              ),
              Container(
                height: 4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _rackIpgoList(context),
                  Container(
                    width: 12,
                  ),
                  _rackIpgoList2(context),
                ],
              )
              /*SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(left: 12, right: 12),
                  width: 2500,
                  // height: 1000,
                  child: Table(
                    columnWidths: {
                      0: FixedColumnWidth(80.0),
                      1: FixedColumnWidth(80.0),
                      2: FixedColumnWidth(80.0),
                      3: FixedColumnWidth(300.0),
                      4: FixedColumnWidth(120.0),
                      5: FixedColumnWidth(350.0),
                      6: FixedColumnWidth(120.0),
                      7: FixedColumnWidth(120.0),
                      8: FixedColumnWidth(120.0),
                      9: FixedColumnWidth(120.0),
                      10: FixedColumnWidth(120.0),
                      11: FixedColumnWidth(120.0),
                      12: FixedColumnWidth(150.0),
                      13: FixedColumnWidth(80.0),
                    },
                    border: TableBorder(
                      horizontalInside: BorderSide(color: Colors.transparent),
                      //  bottom: BorderSide(color: Colors.transparent)
                    ),
                    children: controller.tableRows.value,
                  ),
                ),
              ),*/
            ],
          ),
        ),)
    );


  }


  Widget _SearchCondition(BuildContext context) {
    return Row(
      children: [
        Container(
          width:  MediaQuery.of(context).size.width ,
          padding: EdgeInsets.only(left: 24, right: 24),
          child: _dropDownItem(context),

        ),
      ],
    );
  }


  Widget _dropDownItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('창고', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
            SizedBox(width: 8,),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.ae2e2e2)),
              padding: const EdgeInsets.only(right: 12),
              child: DropdownButton(
                  padding: EdgeInsets.only(left: 12),
                  borderRadius: BorderRadius.circular(3),
                  isExpanded: true,
                  underline: Container(
                    height: 1,
                    color: Colors.white,
                  ),
                  icon: SvgPicture.asset(
                    'assets/app/arrowBottom.svg',
                    color: AppTheme.light_placeholder,
                  ),
                  dropdownColor: AppTheme.light_ui_01,
                  value: controller.selectedContainer['NAME'],
                  items: controller.containerList.map((value) {
                    return DropdownMenuItem<String>(
                      value: value['NAME'].toString(),
                      child: Text(
                        value['NAME'].toString(),
                        style: AppTheme.a16400
                            .copyWith(color: value['NAME'].toString() == '선택해주세요' ? AppTheme.aBCBCBC : AppTheme.a6c6c6c),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.containerList.map((e) {
                      if(e['NAME'] == value) {
                        controller.selectedContainer['CODE'] = e['CODE'];
                        controller.selectedContainer['NAME'] = e['NAME'];
                      }
                    }).toList();
                  }),
            ),
            SizedBox(width: 24,),
            Text('일자', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
            SizedBox(width: 8,),
            Container(
              child: InkWell(
                onTap: () async{
                  var datePicked = await DatePicker.showSimpleDatePicker(
                    titleText: '날짜 선택',
                    itemTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                    context,
                    confirmText: '확인',
                    cancelText: '취소',
                    textColor: AppTheme.black,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2060),
                    dateFormat: "yyyy-MM-dd",
                    locale: DateTimePickerLocale.ko,
                    looping: true,
                  );

                  if(datePicked != null) {
                    int startIndex = datePicked.toString().indexOf(' ');
                    int lastIndex = datePicked.toString().length;
                    controller.dayStartValue.value = datePicked.toString().replaceRange(startIndex, lastIndex, '');
                    /*    if(controller.choiceButtonVal.value != 0) {

                           }*/
                  }else {
                    controller.dayStartValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  }
                  if(datePicked.toString() == '1994-01-01 00:00:00.000') {
                    controller.dayStartValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  }
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all( color: AppTheme.ae2e2e2)),
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.dayStartValue.value, style: AppTheme.a20400
                          .copyWith(color: AppTheme.a6c6c6c
                          , fontSize: 17),),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8,),
            Container(
              child: InkWell(
                onTap: () async{
                  var datePicked = await DatePicker.showSimpleDatePicker(
                    titleText: '날짜 선택',
                    itemTextStyle: AppTheme.a16400.copyWith(color: AppTheme.black),
                    context,
                    confirmText: '확인',
                    cancelText: '취소',
                    textColor: AppTheme.black,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2060),
                    dateFormat: "yyyy-MM-dd",
                    locale: DateTimePickerLocale.ko,
                    looping: true,
                  );
                  if(datePicked != null) {
                    int startIndex = datePicked.toString().indexOf(' ');
                    int lastIndex = datePicked.toString().length;
                    controller.dayEndValue.value = datePicked.toString().replaceRange(startIndex, lastIndex, '');
                    /* if(controller.choiceButtonVal.value != 0) {

                           }*/
                  }else {
                    controller.dayEndValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  }
                  if(datePicked.toString() == '1994-01-01 00:00:00.000') {
                    controller.dayEndValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  }

                  Get.log("Date Picked ${datePicked.toString()}");
                  //  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)),
                  width: 150,
                  padding: const EdgeInsets.only( right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.dayEndValue.value, style: AppTheme.a20400
                          .copyWith(color: AppTheme.a6c6c6c
                          , fontSize: 17),),
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 120,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.all(0))),
                onPressed: () async {
                  Get.log('조회 클릭!');
                  if(controller.isChecked.value == false) {
                    controller.isChecked.value = true;
                    controller.gridStateMgr3.removeAllRows();
                    await controller.checkQR();
                    if (controller.etcChulgoList.isNotEmpty) {
                      controller.gridStateMgr2.setCurrentCell(controller.gridStateMgr2.firstCell, 0);
                      Get.log('현재위치: ${controller.gridStateMgr2.currentRowIdx}');
                      controller.currentRowIndex.value = controller.gridStateMgr2.currentRowIdx!;
                      // await controller.plutoRow3();
                      // await controller.plutoRow3();

                      controller.rowDatas3.value = List<PlutoRow>.generate(controller.itemTotalList[controller.currentRowIndex.value].length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.itemTotalList[controller.currentRowIndex.value][index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value ?? '')),
                          )))
                      );

                      controller.gridStateMgr3.removeAllRows();
                      controller.gridStateMgr3.appendRows(controller.rowDatas3.value);
                    }
                  }

                  controller.isChecked.value = false;
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 120,
                  height: 40,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('조회',
                        style: AppTheme.a20700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12,),
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 120,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.all(0))),
                onPressed: () async {
                  Get.log('신규 클릭!');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _alertDialog(context);
                    },
                  );
                  /* await controller.checkBtn();
                  controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 1);
                  Get.log('현재위치: ${controller.gridStateMgr.currentRowIdx}');
                  controller.invnrHeight.value = 53*(double.parse((controller.ipgoCancelList.length + 1).toString()));*/
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 120,
                  height: 40,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('신규',
                        style: AppTheme.a20700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12,),
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 120,
              height: 40,
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<
                        RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.all(0))),
                onPressed: () async {
                  Get.log('삭제 클릭!');
                  for(var i = 0; i < controller.etcChulgoCheckList.length; i++) {
                    if(controller.etcChulgoCheckList[i] == true) {
                      controller.isRowChecked.value = true;
                      break;
                    }else {
                      controller.isRowChecked.value = false;
                    }
                  }
                  if(controller.isRowChecked.value) {
                    await controller.registCancelIpgoBtn('D');
                    await controller.checkQR();
                    Get.dialog(CommonDialogWidget(contentText: '삭제되었습니다.', pageFlag: 0));
                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '선택된 항목이 없습니다.', pageFlag: 0));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 120,
                  height: 40,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('삭제',
                        style: AppTheme.a20700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),

          ],
        )
      ],
    );
  }

  Widget _invnrTextForm(String title, int plag) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 4, left: 8),
          height: 40,
          width: plag != 0 ? 300 : 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Center(
            child: TextFormField(
              focusNode: title == '자재코드' ? controller.focusNode2 : null,
              readOnly: false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
              // maxLines: 5,
              controller: plag == 0 ? controller.textItemCdController : controller.textItemNmController ,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                // filled: true,
                hintText: '',
                hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
                border: InputBorder.none,
              ),
              showCursor: true,
              onTap: () {
                controller.isFocus.value = true;
                if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
              },
              // onChanged: ((value) => controller.submitSearch(value)),
            ),
          ),

        ),
      ],
    );
  }


  Widget _rackIpgoList(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 200;
    return Container(
      // padding: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width/2 + 100,
      height: MediaQuery.of(context).size.height - 250,
      margin: EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width-32,
              height: MediaQuery.of(context).size.height - 250,
              child: PlutoGrid(
                mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
                columns: gridCols(context),
                rows: controller.rowDatas2.value,
                onRowChecked: (event) {
                  if (event.isChecked != null) {
                    if(event.isAll == true) {
                      if (event.isChecked == true) {
                        for(var i = 0; i < controller.etcChulgoCheckList.length; i++) {
                          controller.etcChulgoCheckList[i] = true;
                        }
                        Get.log('이거 봐야함1 true ${controller.etcChulgoCheckList.value}');
                      }else{
                        for(var i = 0; i < controller.etcChulgoCheckList.length; i++) {
                          controller.etcChulgoCheckList[i] = false;
                        }
                        Get.log('이거 봐야함1 false ${controller.etcChulgoCheckList.value}');
                      }


                    }else {
                      if (event.isChecked == true) {
                        controller.etcChulgoCheckList[event.rowIdx!] = true;
                        // controller.selectedCancelList.add(event.row!.cells.entries);
                        Get.log('이거 봐야함2 ${controller.etcChulgoCheckList.value}');
                      } else {
                        controller.etcChulgoCheckList[event.rowIdx!] = false;
                        //  controller.selectedCancelList.remove(event.rowIdx);
                        Get.log('이거 봐야함3 ${controller.etcChulgoCheckList.value}');
                      }
                    }
                  }

                },
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  controller.gridStateMgr2 = event.stateManager;
                  controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
                  // controller.requestFocus();
                  // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                  //gridStateMgr.setShowColumnFilter(true);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  print(event);
                },
                onSelected: (c) {
                  Get.log('controller.itemTotalList::: ${controller.itemTotalList}');
                  print(controller.gridStateMgr2.currentRowIdx);
                  controller.currentRowIndex.value = c.rowIdx!;
                  controller.currentRowIndex.value != controller.gridStateMgr2.currentRowIdx!
                      ? {/*controller.ipgoQrList.clear(), controller.ipgoList.clear(),*/ controller.gridStateMgr3.removeAllRows()} : null;
                  controller.currentRowIndex.value = controller.gridStateMgr2.currentRowIdx!;

                  /// 오른쪽 분할 그리드 시작!!
                  ///

                  controller.rowDatas3.value = List<PlutoRow>.generate(controller.itemTotalList[controller.currentRowIndex.value].length, (index) =>
                      PlutoRow(cells:
                      Map.from((controller.itemTotalList[controller.currentRowIndex.value][index]).map((key, value) =>
                          MapEntry(key, PlutoCell(value: value ?? '' )),
                      )))
                  );

                  controller.gridStateMgr3.removeAllRows();
                  controller.gridStateMgr3.appendRows(controller.rowDatas3);
                  //   controller.gridStateMgr3.appendRows(controller.rowDatas3);
                  controller.isQr.value = false;
                  controller.isQr.value == false ?
                  controller.requestFocus() : null;
                },
                rowColorCallback: (c) {
                  if(controller.tete.value) {
                    if(controller.gridStateMgr2.currentRowIdx == c.rowIdx) {

                      return AppTheme.blue_blue_50;

                    }
                  }
                  return Colors.transparent;
                },
                configuration: PlutoGridConfiguration(
                  style: PlutoGridStyleConfig(
                    columnHeight: 55,
                    rowHeight: 55,
                    //gridBorderColor: Colors.transparent,
                    //   activatedColor: Colors.transparent,
                    //  cellColorInReadOnlyState: Colors.white,
                    columnTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                    cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                  ),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
  List<PlutoColumn> gridCols(BuildContext context) {
    final List<PlutoColumn> gridCols = <PlutoColumn>[
      PlutoColumn(
        title: '',
        field: 'noV',
        type: PlutoColumnType.text(),
        width: 80,
        enableRowChecked: true,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '창고',
        field: 'whNm',
        type: PlutoColumnType.text(),
        width: 130,
        enableSorting: false,
        enableEditingMode: true,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,

      ),
      PlutoColumn(
        title: '출고번호',
        field: 'otbNo',
        type: PlutoColumnType.text(),
        width: 200,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '존 구분',
        field: 'zoneNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '저장위치',
        field: 'locCd',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '담당자',
        field: 'usrNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '출고일',
        field: 'otbDt',
        type: PlutoColumnType.text(),
        width: 130,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '비고',
        field: 'remark',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),


    ];
    return gridCols;
  }



  Widget _rackIpgoList2(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 200;
    return Container(
      width: MediaQuery.of(context).size.width/2 - 160,
      height: MediaQuery.of(context).size.height - 250,
      margin: EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 250,
              child: PlutoGrid(
                columns: gridCols2(context),
                rows: controller.rowDatas3.value,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  controller.gridStateMgr3 = event.stateManager;
                  controller.gridStateMgr3.setSelectingMode(PlutoGridSelectingMode.none);
                  // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                  //gridStateMgr.setShowColumnFilter(true);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  print(event);
                },
                onSelected: (c) {
                  print(controller.gridStateMgr3.currentRowIdx);
                },
                configuration: PlutoGridConfiguration(
                  style: PlutoGridStyleConfig(
                    columnHeight: 55,
                    rowHeight: 55,
                    //gridBorderColor: Colors.transparent,
                    //   activatedColor: Colors.transparent,
                    //  cellColorInReadOnlyState: Colors.white,
                    columnTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                    cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                  ),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
  List<PlutoColumn> gridCols2(BuildContext context) {
    final List<PlutoColumn> gridCols2 = <PlutoColumn>[
      PlutoColumn(
        title: '라벨타입',
        field: 'tagTypeNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '라벨번호',
        field: 'tagNo',
        type: PlutoColumnType.text(),
        width: 200,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '구성번호',
        field: 'tagSeq',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '자재코드',
        field: 'itemCd',
        type: PlutoColumnType.text(),
        width: 200,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '자재명',
        field: 'itemNm',
        type: PlutoColumnType.text(),
        width: 400,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '수량',
        field: 'qty',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '단위',
        field: 'qtyUnit',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '세트수',
        field: 'setQty',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '프로젝트명',
        field: 'pjtNm',
        type: PlutoColumnType.text(),
        width: 230,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '업체명',
        field: 'vendNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '제조일',
        field: 'prtDt',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),



    ];
    return gridCols2;
  }


  Widget _alertDialog(BuildContext context) {
    controller.isNewFocus.value == false ? controller.requestFocus() : null;
    return AlertDialog(
        backgroundColor: AppTheme.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        title: Column(
          children: [
            const SizedBox(
              height: AppTheme.spacing_l_20,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, right: 12),
                  child: Text(
                    '신규',
                    style: AppTheme.a18700
                        .copyWith(color: AppTheme.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),

        content: _rackIpgoList3(context), /// 내부 메인body

        buttonPadding: const EdgeInsets.all(0),
        // insetPadding 이게 전체크기 조정
        insetPadding: const EdgeInsets.only(left: 45, right: 45),
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        //
        actions: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: const Color(0x5c3c3c43),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () {
                        Get.log('닫기 클릭!');
                        controller.etcChulgoQrList.clear();
                        controller.etcChulgoSaveQrList.clear();
                        controller.etcChulgoQrDetailTotalList.clear();
                        controller.statusText.value = '';
                        /// 좌측 리스트 삭제
                        controller.gridStateMgr4.removeAllRows();
                        controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcChulgoSaveQrList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcChulgoSaveQrList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.gridStateMgr4.appendRows(controller.rowDatas4.value);

                        /// 우측 리스트 삭제
                        controller.gridStateMgr5.removeAllRows();
                        controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcChulgoQrDetailTotalList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcChulgoQrDetailTotalList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: const Color(0x5c3c3c43),)
                            ),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                            color: AppTheme.navy_navy_900
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          top: AppTheme.spacing_s_12,
                          bottom: AppTheme.spacing_s_12,
                        ),
                        child: Center(
                          child: Text('닫기',
                              style: AppTheme.titleHeadline.copyWith(
                                  color: AppTheme.white,
                                  fontSize: 17)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ]);
  }

  Widget _rackIpgoList3(BuildContext context) {
    return SingleChildScrollView (
      child: Container(
        width: 550,
        height: 400,
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            _SearchCondition2(context),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2 - 320,
                  height: 290,
                  child: PlutoGrid(
                    mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
                    columns: gridCols3(context),
                    rows: controller.rowDatas4.value,
                    onRowChecked: (event) {
                      controller.isNewFocus.value = true;
                      if (event.isChecked != null) {
                        if(event.isAll == true) {
                          if (event.isChecked == true) {
                            for(var i = 0; i < controller.etcChulgoQrCheckList.length; i++) {
                              controller.etcChulgoQrCheckList[i] = true;
                            }
                            Get.log('이거 봐야함1 true ${controller.etcChulgoQrCheckList.value}');
                          }else{
                            for(var i = 0; i < controller.etcChulgoQrCheckList.length; i++) {
                              controller.etcChulgoQrCheckList[i] = false;
                            }
                            Get.log('이거 봐야함1 false ${controller.etcChulgoQrCheckList.value}');
                          }


                        }else {
                          if (event.isChecked == true) {
                            controller.etcChulgoQrCheckList[event.rowIdx!] = true;
                            // controller.selectedCancelList.add(event.row!.cells.entries);
                            Get.log('이거 봐야함2 ${controller.etcChulgoQrCheckList.value}');
                          } else {
                            controller.etcChulgoQrCheckList[event.rowIdx!] = false;
                            //  controller.selectedCancelList.remove(event.rowIdx);
                            Get.log('이거 봐야함3 ${controller.etcChulgoQrCheckList.value}');
                          }
                        }
                      }

                    },
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      controller.isNewFocus.value = true;
                      controller.gridStateMgr4 = event.stateManager;
                      controller.gridStateMgr4.setSelectingMode(PlutoGridSelectingMode.none);
                    },
                    onChanged: (PlutoGridOnChangedEvent event) {
                      print(event);
                    },
                    onSelected: (c) {
                      print(controller.gridStateMgr4.currentRowIdx);

                      print(controller.gridStateMgr4.currentRowIdx);
                      controller.currentRowIndex2.value = c.rowIdx!;
                      controller.currentRowIndex2.value != controller.gridStateMgr4.currentRowIdx!
                          ? {/*controller.ipgoQrList.clear(), controller.ipgoList.clear(),*/ controller.gridStateMgr5.removeAllRows()} : null;
                      controller.currentRowIndex2.value = controller.gridStateMgr4.currentRowIdx!;

                      /// 오른쪽 분할 그리드 시작!!
                      controller.list3Qty.value = controller.etcChulgoSaveQrList[controller.currentRowIndex.value]['qty'];
                      controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value].length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value ?? '' )),
                          )))
                      );

                      controller.gridStateMgr5.removeAllRows();
                      controller.gridStateMgr5.appendRows(controller.rowDatas5);
                    },
                    configuration: PlutoGridConfiguration(
                      style: PlutoGridStyleConfig(
                        columnHeight: 55,
                        rowHeight: 55,
                        //gridBorderColor: Colors.transparent,
                        //   activatedColor: Colors.transparent,
                        //  cellColorInReadOnlyState: Colors.white,
                        columnTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                        cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12,),
                Obx(() =>_rackIpgoList4(context))
              ],
            ),
          ],
        ),
      ),

    );
  }
  List<PlutoColumn> gridCols3(BuildContext context) {
    final List<PlutoColumn> gridCols = <PlutoColumn>[
      PlutoColumn(
        title: '',
        field: 'noV',
        type: PlutoColumnType.text(),
        width: 80,
        enableRowChecked: true,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '존 구분',
        field: 'zoneNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '저장위치',
        field: 'locCd',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '라벨번호',
        field: 'tagNo',
        type: PlutoColumnType.text(),
        width: 200,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '수량',
        field: 'qty',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
     /* PlutoColumn(
        title: '출고수량',
        field: 'qtyUse',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: true,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        enableAutoEditing: true,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
        checkReadOnly: (PlutoRow row, PlutoCell cell) {
          var i = true;
          if(controller.list3Qty.value == 1.0) {
            i = true;
          }else {
            i = false;
          }
          return i;
          *//*controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value]['qty'].toString() == '1';*//*
        },
      ),*/
    ];
    return gridCols;
  }

  Widget _rackIpgoList4(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 200;
    return Container(
      width: MediaQuery.of(context).size.width/2 + 190,
      height: 290,
      //margin: EdgeInsets.only(left: 12),
      child: Container(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 290,
            child: PlutoGrid(
              columns: gridCols4(context),
              rows: controller.rowDatas5.value,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                controller.gridStateMgr5 = event.stateManager;
                controller.gridStateMgr5.setSelectingMode(PlutoGridSelectingMode.none);
                // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                //gridStateMgr.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
                /// 그리드에서 변경된 값 그대로 업데이트
                if (event.column.field == 'qtyUse') {
                  print('선택한 값: ${event.value}');
                  controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][event.rowIdx].addAll({'qtyUse': event.value});
                  Get.log('controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][event.rowIdx] :: '
                      '${controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][event.rowIdx]['qtyUse']}');

                  controller.etcChulgoSaveQrList[controller.currentRowIndex2.value].addAll({'qty': event.value});
                }


              },
              onSelected: (c) {
                print(controller.gridStateMgr5.currentRowIdx);
              },
              configuration: PlutoGridConfiguration(
                style: PlutoGridStyleConfig(
                  columnHeight: 55,
                  rowHeight: 55,
                  //gridBorderColor: Colors.transparent,
                  //   activatedColor: Colors.transparent,
                  //  cellColorInReadOnlyState: Colors.white,
                  columnTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                  cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                ),
              ),
            ),
          ),
        ],),
      ),
    );
  }
  List<PlutoColumn> gridCols4(BuildContext context) {
    final List<PlutoColumn> gridCols4 = <PlutoColumn>[
      PlutoColumn(
        title: '라벨타입',
        field: 'tagTypeNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '라벨번호',
        field: 'tagNo',
        type: PlutoColumnType.text(),
        width: 200,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '수량',
        field: 'qty',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '출고수량',
        field: 'qtyUse',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: true,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        enableAutoEditing: true,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
        checkReadOnly: (PlutoRow row, PlutoCell cell) {
          var i = true;
          if(controller.list3Qty.value == 1.0) {
            i = true;
          }else {
            i = false;
          }
          return i;
          /*controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value]['qty'].toString() == '1';*/
        },
      ),
      PlutoColumn(
        title: '자재코드',
        field: 'itemCd',
        type: PlutoColumnType.text(),
        width: 200,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '자재명',
        field: 'itemNm',
        type: PlutoColumnType.text(),
        width: 400,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),

      PlutoColumn(
        title: '단위',
        field: 'qtyUnit',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '세트수',
        field: 'setQty',
        type: PlutoColumnType.text(),
        width: 90,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '프로젝트명',
        field: 'pjtNm',
        type: PlutoColumnType.text(),
        width: 130,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '업체명',
        field: 'vendNm',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '제조일',
        field: 'prtDt',
        type: PlutoColumnType.text(),
        width: 120,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),


    ];
    return gridCols4;
  }


  Widget _SearchCondition2(BuildContext context) {
    return Row(
      children: [
        Container(
          width:  MediaQuery.of(context).size.width - 114 ,
          padding: EdgeInsets.only(left: 12),
          child: _dropDownItem2(),

        ),
      ],
    );
  }


  Widget _dropDownItem2() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 65,
                    child: Text('창고', textAlign: TextAlign.end, style: AppTheme.a20700.copyWith(color: AppTheme.black),)),
                SizedBox(width: 8,),
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)),
                  padding: const EdgeInsets.only(right: 12),
                  child: DropdownButton(
                      padding: EdgeInsets.only(left: 12),
                      borderRadius: BorderRadius.circular(3),
                      isExpanded: true,
                      underline: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      icon: SvgPicture.asset(
                        'assets/app/arrowBottom.svg',
                        color: AppTheme.light_placeholder,
                      ),
                      dropdownColor: AppTheme.light_ui_01,
                      value: controller.selectedContainer['NAME'],
                      items: controller.containerList.map((value) {
                        return DropdownMenuItem<String>(
                          value: value['NAME'].toString(),
                          child: Text(
                            value['NAME'].toString(),
                            style: AppTheme.a20400
                                .copyWith(color: value['NAME'].toString() == '선택해주세요' ? AppTheme.aBCBCBC : AppTheme.a6c6c6c),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.containerList.map((e) {
                          if(e['NAME'] == value) {
                            controller.selectedContainer['CODE'] = e['CODE'];
                            controller.selectedContainer['NAME'] = e['NAME'];
                          }
                        }).toList();
                      }),
                ),
                SizedBox(width: 24,),
                Obx(() => _chulgoDate(context)),
                SizedBox(width: 24,),
                _placeTextField(),
              //  _invnrTextForm2('출고번호', 0),
                SizedBox(width: 24,),
                _invnrTextForm2('출고담당자', 1),
                SizedBox(width: 12,),
        /*        _invnrTextForm2('저장위치', 2),
                SizedBox(width: 24,),*/
                _invnrTextForm2('비고', 3),
                SizedBox(width: 12,),
              ],
            ),

          ],
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                _qrCodeTextForm(),
                SizedBox(width: 24,),
                Obx(() => _statusText())
              ],
            ),
            Row(
              children: [
                /*Container(
                  margin: EdgeInsets.only(right: 12),
                  width: 120,
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(0))),
                    onPressed: () async {
                      Get.log('초기화 클릭!');

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppTheme.navy_navy_800,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.ae2e2e2)
                      ),
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.only(

                      ),
                      child: Center(
                        child: Text('초기화',
                            style: AppTheme.a16700.copyWith(
                              color: AppTheme.white,
                            )),
                      ),
                    ),
                  ), // 초기화가 왜 필요함?
                ),*/
                Container(
                  margin: EdgeInsets.only(right: 12),
                  width: 120,
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(0))),
                    onPressed: () async {
                      Get.log('저장 클릭!');
                      Get.dialog(
                        Center(child: CircularProgressIndicator()),
                        barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
                      );
                        await controller.registSaveIpgoBtn();
                       /* controller.etcChulgoSaveQrList.removeAt(controller.isEtcChulgoQrCheckListIdx.value); // 좌측리스트 삭제
                        controller.etcChulgoQrDetailTotalList.removeAt(controller.isEtcChulgoQrCheckListIdx.value); // 우측 디테일 삭제
                        controller.etcChulgoQrCheckList.removeAt(controller.isEtcChulgoQrCheckListIdx.value);*/
                        /// 좌측 리스트 삭제
                        controller.gridStateMgr4.removeAllRows();
                        controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcChulgoSaveQrList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcChulgoSaveQrList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.gridStateMgr4.appendRows(controller.rowDatas4.value);

                        /// 우측 리스트 삭제
                        controller.gridStateMgr5.removeAllRows();
                        controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcChulgoQrDetailTotalList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcChulgoQrDetailTotalList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.gridStateMgr5.appendRows(controller.rowDatas5.value);
                        controller.statusText.value = '';
                        Get.dialog(CommonDialogWidget(contentText: '저장되었습니다', pageFlag: 3,));

                     /* }else {
                        Get.dialog(CommonDialogWidget(contentText: '선택된 리스트가 없습니다.', pageFlag: 3,));
                      }*/

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppTheme.navy_navy_800,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.ae2e2e2)
                      ),
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.only(

                      ),
                      child: Center(
                        child: Text('저장',
                            style: AppTheme.a20700.copyWith(
                              color: AppTheme.white,
                            )),
                      ),
                    ),
                  ),
                ),
                Container(

                  width: 120,
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(0))),
                    onPressed: () async {
                      Get.log('행 삭제 클릭!');
                      for(var e = controller.etcChulgoQrCheckList.length - 1; e >= 0; e--) {
                        if(controller.etcChulgoQrCheckList[e] == true) {
                          controller.etcChulgoSaveQrList.removeAt(e); // 좌측리스트 삭제
                          controller.etcChulgoQrDetailTotalList.removeAt(e); // 우측 디테일 삭제
                          controller.etcChulgoQrCheckList.removeAt(e);
                        }
                      }
                      /// 좌측 리스트 삭제
                      controller.gridStateMgr4.removeAllRows();
                      controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcChulgoSaveQrList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.etcChulgoSaveQrList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                          )))
                      );
                      controller.gridStateMgr4.appendRows(controller.rowDatas4.value);

                      /// 우측 리스트 삭제
                      controller.gridStateMgr5.removeAllRows();
                      controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcChulgoQrDetailTotalList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.etcChulgoQrDetailTotalList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                          )))
                      );
                      controller.gridStateMgr5.appendRows(controller.rowDatas5.value);

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppTheme.navy_navy_800,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.ae2e2e2)
                      ),
                      width: 120,
                      height: 40,
                      padding: const EdgeInsets.only(

                      ),
                      child: Center(
                        child: Text('행 삭제',
                            style: AppTheme.a20700.copyWith(
                              color: AppTheme.white,
                            )),
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        )
      ],
    );
  }


  Widget _chulgoDate(BuildContext context) {
    return Row(
      children: [
        Text('출고일자', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
        SizedBox(width: 8,),
        Container(
          child: InkWell(
            onTap: () async{
              final selectedDate = await showDatePicker(
                locale : const Locale('ko', 'KR'),
                context: context, // 팝업으로 띄우기 때문에 context 전달
                initialDate: DateTime.now(), // 달력을 띄웠을 때 선택된 날짜. 위에서 date 변수에 오늘 날짜를 넣었으므로 오늘 날짜가 선택돼서 나옴
                firstDate: DateTime(1950), // 시작 년도
                lastDate: DateTime.now().add(Duration(days: 60)), // 마지막 년도. 오늘로 지정하면 미래의 날짜는 선택할 수 없음
              );
              if (selectedDate != null) {
                controller.chulgoDate.value = DateFormat('yyyyMMdd').format(selectedDate);
                /*var datePicked = await DatePicker.showSimpleDatePicker(
                titleText: '날짜 선택',
                itemTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                context,
                confirmText: '확인',
                cancelText: '취소',
                textColor: AppTheme.black,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2060),
                dateFormat: "yyyy-MM-dd",
                locale: DateTimePickerLocale.ko,
                looping: false,
              );

              if(datePicked != null) {
                int startIndex = datePicked.toString().indexOf(' ');
                int lastIndex = datePicked.toString().length;
                controller.chulgoDate.value = datePicked.toString().replaceRange(startIndex, lastIndex, '');
                controller.chulgoDate.value = DateFormat('yyyyMMdd').format(datePicked);
                */ /*    if(controller.choiceButtonVal.value != 0) {

                           }*/ /*
              }else {
                controller.chulgoDate.value = DateFormat('yyyyMMdd').format(DateTime.now());
              }
              if(datePicked.toString() == '1994-01-01 00:00:00.000') {
                controller.chulgoDate.value = DateFormat('yyyyMMdd').format(DateTime.now());
              }*/
              }},
            child: Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all( color: AppTheme.ae2e2e2)),
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text(controller.chulgoDate.value, style: AppTheme.a20400
                      .copyWith(color: AppTheme.a6c6c6c
                      , fontSize: 17),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _placeTextField() {
    return Row(
      children: [
        Text('출고처명',
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 5, left: 8),
          height: 40,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Container(
            height: 40,
            child: TextFormField(
              readOnly:  false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),

              // maxLines: 5,
              controller: controller.textPlaceController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              showCursor: true,

              // onChanged: ((value) => controller.submitSearch(value)),
            ),
          ),

        ),
      ],
    );
  }


  Widget _invnrTextForm2(String title, int plag) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 5, left: 8),
          height: 40,
          width: plag == 1 ? 100 : plag == 2 ? 130 : 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Container(
            height: 40,
            child: TextFormField(
              onTap: () {
                controller.isNewFocus.value = true;
              },
              readOnly:  plag == 0 ? true : false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),

              // maxLines: 5,
              controller: plag == 0 ? controller.textInbNoController : plag == 1 ? controller.textMgrController : plag == 2 ? controller.textLocController
                  : controller.textRemarkController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              showCursor: true,

              // onChanged: ((value) => controller.submitSearch(value)),
            ),
          ),

        ),
      ],
    );
  }

  Widget _qrCodeTextForm() {
    return Row(
      children: [
        Text('QR 코드',
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          width: 150,
          height: 40,
          // padding: const EdgeInsets.only(left: 20, right: 12, top: 4),
          child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.ae2e2e2),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                ),
                child: KeyboardListener(
                  focusNode: controller.focusNodeKey,
                  onKeyEvent: (event) async {
                    if (event is KeyDownEvent) {
                      //  final inputChar = event.character ?? '';
                      //  controller.textLocController.text += inputChar;
                      // 키보드 입력값 수신 처리
                      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                        controller.isDuplQr.value = false;
                        for(var i = 0; i < controller.etcChulgoQrList.length; i++) {
                          if(controller.etcChulgoQrList[i]['qrNo'].contains(controller.textQrController.text)) {
                            controller.isDuplQr.value = true;
                          }
                        }
                        if(controller.isDuplQr.value) {
                          controller.statusText.value = '중복된 QR코드입니다.';
                          controller.textQrController.text = '';
                        }else{
                          await controller.reqChulThird(); // 조회
                          /// 자재선택 추가
                          if(controller.etcChulgoQrList.length > 1) {
                            controller.alertIndex.value = 0;
                            await showDialog(
                              barrierDismissible: false,
                              context: context, //context
                              builder: (BuildContext context) {
                                return _dupAlertDialog(context);
                              },
                            ); // context가 왜?
                          }else {
                            if(controller.etcChulgoQrList.isNotEmpty) {
                              await controller.reqChulThirdDetail(); // 디테일 조회

                              controller.etcChulgoSaveQrList.add(controller.etcChulgoQrList[0]);
                              controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcChulgoSaveQrList.length, (index) =>
                                  PlutoRow(cells:
                                  Map.from((controller.etcChulgoSaveQrList[index]).map((key, value) =>
                                      MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                                  )))
                              );
                              controller.textQrController.text = '';
                              controller.gridStateMgr4.removeAllRows();
                              controller.gridStateMgr4.appendRows(controller.rowDatas4);

                              controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcChulgoQrDetailTotalList[controller.etcChulgoQrDetailTotalList.length - 1].length, (index) =>
                                  PlutoRow(cells:
                                  Map.from((controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][index]).map((key, value) =>
                                      MapEntry(key, PlutoCell(value: value ?? '' )),
                                  )))
                              );

                              controller.gridStateMgr5.removeAllRows();
                              controller.gridStateMgr5.appendRows(controller.rowDatas5);
                            }
                          }

                          controller.focusNode.requestFocus();

                        }
                      }
                    }
                  },
                  child: TextFormField(
                    expands :true,
                    minLines: null,
                    maxLines: null,
                    focusNode: controller.focusNode,
                    style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
                    // maxLines: 5,
                    controller: controller.textQrController,
                    textAlignVertical: TextAlignVertical.center,
                    onTap: () {
                      controller.isQrFocus.value = false;
                    /*  if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                      else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                    },
                    onTapOutside:(event) => { controller.focusCnt.value = 0 },
                    onFieldSubmitted: (value) async{
                      /*controller.isDuplQr.value = false;
                      for(var i = 0; i < controller.etcChulgoQrList.length; i++) {
                        if(controller.etcChulgoQrList[i]['qrNo'].contains(controller.textQrController.text)) {
                          controller.isDuplQr.value = true;
                        }
                      }
                      if(controller.isDuplQr.value) {
                        controller.statusText.value = '중복된 QR코드입니다.';
                        controller.textQrController.text = '';
                      }else{
                        await controller.reqChulThird(); // 조회
                        if(controller.etcChulgoQrList.isNotEmpty) {
                          await controller.reqChulThirdDetail(); // 디테일 조회
                          controller.etcChulgoSaveQrList.add(controller.etcChulgoQrList[0]);
                        }
                        controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcChulgoSaveQrList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcChulgoSaveQrList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.textQrController.text = '';
                        controller.gridStateMgr4.removeAllRows();
                        controller.gridStateMgr4.appendRows(controller.rowDatas4);




                        controller.focusNode.requestFocus();
                        Future.delayed(const Duration(), (){
                          controller.focusNode.requestFocus();
                          //  FocusScope.of(context).requestFocus(focusNode);
                          Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                        });
                      }*/



                    },
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                      filled: true,
                      hintText: '',
                      hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
                      border: InputBorder.none,
                    ),
                    showCursor: true,


                  ),
                ),)
          ),
        ),
      ],
    );

  }

  Widget _statusText() {
    return Row(
      children: [
        Container(
          width: 70,
          child: Text('상태',
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black), textAlign: TextAlign.end,),
        ),
        SizedBox(width: 8,),
        Container(

          padding: EdgeInsets.only(top: 6, left: 8, right: 8),
          height: 40,
          width: controller.statusText.value == '' ? 373 : null,
          decoration: BoxDecoration(
              color: AppTheme.gray_gray_100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Text(controller.statusText.value,
            style:  AppTheme.a18700.copyWith(color: AppTheme.red_red_900),
            // maxLines: 5,

          ),

        ),
      ],
    );
  }

  Widget _dupAlertDialog(BuildContext context) {

    return AlertDialog(
        backgroundColor: AppTheme.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        title: Column(
          children: [
            const SizedBox(
              height: AppTheme.spacing_l_20,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, right: 12),
                  child: Text(
                    'QR 선택',
                    style: AppTheme.a18700
                        .copyWith(color: AppTheme.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),

        content: _dupAlertList(context), /// 내부 메인body

        buttonPadding: const EdgeInsets.all(0),
        // insetPadding 이게 전체크기 조정
        insetPadding: const EdgeInsets.only(left: 45, right: 45),
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        //
        actions: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 1,
                color: const Color(0x5c3c3c43),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    /*bottomRight: Radius.circular(15)*/))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () async {
                        Get.log('닫기 클릭!');
                        controller.textQrController.text = '';
                        controller.statusText.value = '';
                        controller.etcChulgoQrList.clear();
                        controller.alertIndex.value = 0;
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: const Color(0x5c3c3c43),)
                            ),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)/*, bottomRight: Radius.circular(15)*/),
                            color: AppTheme.white
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          top: AppTheme.spacing_s_12,
                          bottom: AppTheme.spacing_s_12,
                        ),
                        child: Center(
                          child: Text('닫기',
                              style: AppTheme.titleHeadline.copyWith(
                                  color: AppTheme.black,
                                  fontSize: 17)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    /*bottomLeft: Radius.circular(15),*/
                                      bottomRight: Radius.circular(15)))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () async {
                        Get.log('선택 클릭!');
                        if(controller.etcChulgoQrList.isNotEmpty) {
                          await controller.reqChulThirdDetailMulti(); // 디테일 조회

                          controller.etcChulgoSaveQrList.add(controller.etcChulgoQrList[controller.alertIndex.value]);
                          controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcChulgoSaveQrList.length, (index) =>
                              PlutoRow(cells:
                              Map.from((controller.etcChulgoSaveQrList[index]).map((key, value) =>
                                  MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                              )))
                          );
                          controller.textQrController.text = '';
                          controller.gridStateMgr4.removeAllRows();
                          controller.gridStateMgr4.appendRows(controller.rowDatas4);

                          controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcChulgoQrDetailTotalList[controller.etcChulgoQrDetailTotalList.length - 1].length, (index) =>
                              PlutoRow(cells:
                              Map.from((controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value][index]).map((key, value) =>
                                  MapEntry(key, PlutoCell(value: value ?? '' )),
                              )))
                          );

                          controller.gridStateMgr5.removeAllRows();
                          controller.gridStateMgr5.appendRows(controller.rowDatas5);
                        }
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: const Color(0x5c3c3c43),)
                            ),
                            borderRadius: BorderRadius.only(/*bottomLeft: Radius.circular(15),*/ bottomRight: Radius.circular(15)),
                            color: AppTheme.navy_navy_900
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          top: AppTheme.spacing_s_12,
                          bottom: AppTheme.spacing_s_12,
                        ),
                        child: Center(
                          child: Text('선택',
                              style: AppTheme.titleHeadline.copyWith(
                                  color: AppTheme.white,
                                  fontSize: 17)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ]);
  }

  Widget _dupAlertList(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: CustomScrollView(
        slivers: [
          _listArea()
        ],
      ),
    );
  }


  Widget _listArea() {
    return Obx(() => SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return _listItem(index: index, context: context);
        }, childCount: controller.popUpDataList2.length)));
  }


  Widget _listItem({required BuildContext context, required int index}) {
    return  TextButton(
        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5)))),
            /*backgroundColor: MaterialStateProperty.all<Color>(
                AppTheme.light_primary,
              ),*/
            padding:
            MaterialStateProperty.all(const EdgeInsets.all(0))),
        onPressed: () async{
          if(controller.isSelect2[index] == true) {
            controller.isSelect2[index] = false;

          }else {
            for(var i = 0; i < controller.isSelect2.length; i++) {
              controller.isSelect2[i] = false;
            }
            controller.isSelect2[index] = true;

          }
          /*for(var i = 0; i < controller.smallBoxDataList.length; i++) {
            if(controller.smallBoxDataList[i]['tagNo'] == controller.popUpDataList[index]['tagNo']) {
              controller.alertIndex.value = i;
            }
          }*/
          controller.alertIndex.value = index;
          //  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
        },
        child: Obx(() => Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18, right: 18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: controller.isSelect2[index] ? Border.all(color: AppTheme.black, width: 3) : Border.all(color: AppTheme.ae2e2e2),
              color: AppTheme.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.gray_c_gray_100.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('라벨번호: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['tagNo']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('자재코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['itemCd']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('수량: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['qty']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('존: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['zoneNm']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('현재위치: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['locCd']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                    ],
                  ),

                ],
              )

            ],
          ),
        ),)
    );
  }

}


