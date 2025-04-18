// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/etcIpgo/etc_ipgo_controller.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';

import 'package:pluto_grid/pluto_grid.dart';

class EtcIpgoPage extends StatefulWidget {
  const EtcIpgoPage({super.key});

  @override
  State<EtcIpgoPage> createState() => _EtcIpgoPageState();
}

class _EtcIpgoPageState extends State<EtcIpgoPage> {
  @override
  void initState() {
    super.initState();
  }


  EtcIpgoController controller = Get.find();


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

      controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value][controller.currentCell!.row!.sortIdx].addAll({'qty': controller.gridStateMgr5.textEditingController?.text});
      controller.etcIpgoSaveQrList[controller.currentRowIndex2.value].addAll({'qty': controller.gridStateMgr5.textEditingController?.text});

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
                  CommonAppbarWidget(title: '기타입고', isLogo: false, isFirstPage: true ),
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
        child: Obx(() => Column(
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
              padding: const EdgeInsets.only(left: 24, right: 24),
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
          ],
        ),)
    );


  }


  Widget _SearchCondition(BuildContext context) {
    return Row(
      children: [
        Container(
          width:  MediaQuery.of(context).size.width ,
          padding: EdgeInsets.only(left: 24, right: 24),
          child: _dropDownItem(),
        ),

      ],
    );
  }


  Widget _dropDownItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('창고', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
            SizedBox(width: 8,),
            Container(
              height: 40,
              width: 120,
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
                  width: 120,
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
                    itemTextStyle: AppTheme.a20400.copyWith(color: AppTheme.black),
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
                  width: 120,
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
            SizedBox(width: 24,),
            _inbTypeDropDownItem()
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
                  Get.dialog(
                    Center(child: CircularProgressIndicator()),
                    barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
                  );
                  if(controller.isChecked.value == false) {
                    controller.isChecked.value = true;
                    controller.gridStateMgr3.removeAllRows();
                    await controller.checkQR();
                    if(controller.etcIpgoList.isNotEmpty) {
                      controller.gridStateMgr2.setCurrentCell(controller.gridStateMgr2.firstCell, 0);
                      Get.log('현재위치: ${controller.gridStateMgr2.currentRowIdx}');
                      controller.currentRowIndex.value = controller.gridStateMgr2.currentRowIdx!;
                     // await controller.plutoRow3();

                      controller.rowDatas3.value = List<PlutoRow>.generate(controller.itemTotalList[controller.currentRowIndex.value].length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.itemTotalList[controller.currentRowIndex.value][index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value ?? '' )),
                          )))
                      );


                      controller.gridStateMgr3.removeAllRows();
                      controller.gridStateMgr3.appendRows(controller.rowDatas3.value);
                    }
                    Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                  }

                  controller.isChecked.value = false;

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
                    barrierDismissible: false,
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
                  Get.log('길이: ${controller.etcIpgoCheckList.length}');
                  for(var i = 0; i < controller.etcIpgoCheckList.length; i++) {
                    if(controller.etcIpgoCheckList[i] == true) {
                      controller.isRowChecked.value = true;
                      break;
                    }else {
                      controller.isRowChecked.value = false;
                    }

                  }
                  if(controller.isRowChecked.value) {
                    await controller.registCancelIpgoBtn('D');
                    await controller.checkQR();
                    controller.itemTotalList.clear();
                    controller.gridStateMgr3.removeAllRows();
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

  Widget _inbTypeDropDownItem() {
    return Row(
      children: [
        Text('입고유형', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
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
              value: controller.selectedInbTypeDropdown['NAME'],
              items: controller.inbTypeList.map((value) {
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
                controller.inbTypeList.map((e) {
                  if(e['NAME'] == value) {
                    controller.selectedInbTypeDropdown['CODE'] = e['CODE'];
                    controller.selectedInbTypeDropdown['NAME'] = e['NAME'];
                  }
                }).toList();
              }),
        ),
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
              style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
              // maxLines: 5,
              controller: plag == 0 ? controller.textItemCdController : controller.textItemNmController ,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                fillColor: Colors.white,
                // filled: true,
                hintText: '',
                hintStyle: AppTheme.a20400.copyWith(color: AppTheme.aBCBCBC),
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
                        for(var i = 0; i < controller.etcIpgoCheckList.length; i++) {
                          controller.etcIpgoCheckList[i] = true;
                        }
                        Get.log('이거 봐야함1 true ${controller.etcIpgoCheckList.value}');
                      }else{
                        for(var i = 0; i < controller.etcIpgoCheckList.length; i++) {
                          controller.etcIpgoCheckList[i] = false;
                        }
                        Get.log('이거 봐야함1 false ${controller.etcIpgoCheckList.value}');
                      }


                    }else {
                      if (event.isChecked == true) {
                        controller.etcIpgoCheckList[event.rowIdx!] = true;
                        // controller.selectedCancelList.add(event.row!.cells.entries);
                        Get.log('이거 봐야함2 ${controller.etcIpgoCheckList.value}');
                      } else {
                        controller.etcIpgoCheckList[event.rowIdx!] = false;
                        //  controller.selectedCancelList.remove(event.rowIdx);
                        Get.log('이거 봐야함3 ${controller.etcIpgoCheckList.value}');
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
                onSelected: (c) async{
                  Get.log('controller.itemTotalList::: ${controller.itemTotalList}');
                  print(controller.gridStateMgr2.currentRowIdx);
                  controller.currentRowIndex.value = c.rowIdx!;
                  controller.currentRowIndex.value != controller.gridStateMgr2.currentRowIdx!
                      ? {/*controller.ipgoQrList.clear(), controller.ipgoList.clear(),*/ controller.gridStateMgr3.removeAllRows()} : null;
                  controller.currentRowIndex.value = controller.gridStateMgr2.currentRowIdx!;

                 /* // 만약 클릭했을 때 단건으로 바꾸게된다면
                  await controller.checkDetailQROne();
                  /// 오른쪽 분할 그리드 시작!!
                  controller.rowDatas3.value = List<PlutoRow>.generate(controller.itemTotalListOne.length, (index) =>
                      PlutoRow(cells:
                      Map.from((controller.itemTotalListOne[index]).map((key, value) =>
                          MapEntry(key, PlutoCell(value: value ?? '' )),
                      )))
                  );*/


                  /// 오른쪽 분할 그리드 시작!!
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
          width: 140,
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
        title: '입고번호',
        field: 'inbNo',
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
        title: '입고일',
        field: 'inbDt',
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
        width: 230,
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

        content: _rackIpgoList3(context),

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
                        controller.etcIpgoQrList.clear();
                        controller.etcIpgoSaveQrList.clear();
                        controller.etcIpgoQrDetailTotalList.clear();
                        controller.gridStateMgr4.removeAllRows();
                        controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcIpgoSaveQrList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcIpgoSaveQrList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.gridStateMgr4.appendRows(controller.rowDatas4.value);

                        /// 우측 리스트 삭제
                        controller.gridStateMgr5.removeAllRows();
                        controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcIpgoQrDetailTotalList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcIpgoQrDetailTotalList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.gridStateMgr5.appendRows(controller.rowDatas5.value);
                        controller.statusText.value = '';
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
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 200;
    return SingleChildScrollView (
      child: Container(
        //padding: EdgeInsets.only(bottom: 20),
        width: 550,
        height: 400,
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            _SearchCondition2(context),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2 -220,
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
                              for(var i = 0; i < controller.etcIpgoQrCheckList.length; i++) {
                                controller.etcIpgoQrCheckList[i] = true;
                              }
                              Get.log('이거 봐야함1 true ${controller.etcIpgoQrCheckList.value}');
                            }else{
                              for(var i = 0; i < controller.etcIpgoQrCheckList.length; i++) {
                                controller.etcIpgoQrCheckList[i] = false;
                              }
                              Get.log('이거 봐야함1 false ${controller.etcIpgoQrCheckList.value}');
                            }


                          }else {
                            if (event.isChecked == true) {
                              controller.etcIpgoQrCheckList[event.rowIdx!] = true;
                              // controller.selectedCancelList.add(event.row!.cells.entries);
                              Get.log('이거 봐야함2 ${controller.etcIpgoQrCheckList.value}');
                            } else {
                              controller.etcIpgoQrCheckList[event.rowIdx!] = false;
                              //  controller.selectedCancelList.remove(event.rowIdx);
                              Get.log('이거 봐야함3 ${controller.etcIpgoQrCheckList.value}');
                            }
                          }
                        }

                      },
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        controller.isNewFocus.value = true;
                        controller.gridStateMgr4 = event.stateManager;
                        controller.gridStateMgr4.setSelectingMode(PlutoGridSelectingMode.none);
                        // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                        //gridStateMgr.setShowColumnFilter(true);
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

                        controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value].length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value][index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value ?? '' )),
                            )))
                        );

                        controller.gridStateMgr5.removeAllRows();
                        controller.gridStateMgr5.appendRows(controller.rowDatas5);

                        print('이거 ${controller.currentRowIndex2.value}');
                        print('이거 ${controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value]}');
                        print('이거 ${controller.etcIpgoQrDetailTotalList}');
                        print('이거 ${controller.etcIpgoQrDetailTotalList.length}');


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
                Container(
                  width: MediaQuery.of(context).size.width/2 + 90,
                  height: 290,
                  child: PlutoGrid(
                    columns: gridCols4(context),
                    rows: controller.rowDatas5.value,
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      controller.gridStateMgr5 = event.stateManager;
                      controller.gridStateMgr5.setSelectingMode(PlutoGridSelectingMode.none);
                      controller.gridStateMgr5.addListener(_listener);
                      // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                      //gridStateMgr.setShowColumnFilter(true);
                    },
                    onChanged: (PlutoGridOnChangedEvent event) {
                      print(event);

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
                )
               // Obx(() =>_rackIpgoList4(context))
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
     /* PlutoColumn(
        title: '창고',
        field: 'whNm',
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
      ),*/
      PlutoColumn(
        title: '실사여부',
        field: 'stkIspSts',
        type: PlutoColumnType.text(),
        width: 100,
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
      /*PlutoColumn(
        title: '입고번호',
        field: 'inbNo',
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
      ),*/
      /*PlutoColumn(
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
      ),*/
   /*   PlutoColumn(
        title: '입고일',
        field: 'inbDt',
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
      ),*/
     /* PlutoColumn(
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
      PlutoColumn(
        title: '비고',
        field: 'remark',
        type: PlutoColumnType.text(),
        width: 100,
        enableSorting: false,
        enableEditingMode: false,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),*/
    ];
    return gridCols;
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
          var isCheck = true;
          if(controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value].isNotEmpty) {
            if(controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value][row.sortIdx]['qrNo'].toString().contains('^^^^')) {
              isCheck = false;
            }else {
              isCheck = true;
            }
          }
          return isCheck;
          /*controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value]['qty'].toString() == '1';*/
        },
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
        width: 210,
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
                    width: 50,
                    child: Text('창고', textAlign: TextAlign.end, style: AppTheme.a16700.copyWith(color: AppTheme.black),)),
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
                _invnrTextForm2('입고번호', 0),
                SizedBox(width: 24,),
                _invnrTextForm2('입고담당자', 1),
                SizedBox(width: 24,),
               // _locSave(),
                _invnrTextForm2('저장위치', 2),
                SizedBox(width: 24,),
                _invnrTextForm2('비고', 3),
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
                  ),
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
                        /// 좌측 리스트 삭제
                        controller.gridStateMgr4.removeAllRows();
                        controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcIpgoSaveQrList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcIpgoSaveQrList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                            )))
                        );
                        controller.gridStateMgr4.appendRows(controller.rowDatas4.value);

                        /// 우측 리스트 삭제
                        controller.gridStateMgr5.removeAllRows();
                        controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcIpgoQrDetailTotalList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcIpgoQrDetailTotalList[index]).map((key, value) =>
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
                            style: AppTheme.a16700.copyWith(
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
                      for(var e = controller.etcIpgoQrCheckList.length - 1; e >= 0; e--) {
                        if(controller.etcIpgoQrCheckList[e] == true) {
                          controller.etcIpgoSaveQrList.removeAt(e); // 좌측리스트 삭제
                          controller.etcIpgoQrDetailTotalList.removeAt(e); // 우측 디테일 삭제
                          controller.etcIpgoQrCheckList.removeAt(e);
                        }
                      }
                      /// 좌측 리스트 삭제
                      controller.gridStateMgr4.removeAllRows();
                      controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcIpgoSaveQrList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.etcIpgoSaveQrList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                          )))
                      );
                      controller.gridStateMgr4.appendRows(controller.rowDatas4.value);

                      /// 우측 리스트 삭제
                      controller.gridStateMgr5.removeAllRows();
                      controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcIpgoQrDetailTotalList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.etcIpgoQrDetailTotalList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                          )))
                      );
                      controller.gridStateMgr5.appendRows(controller.rowDatas5.value);
                      // inbe창고 창고// 가속도의 힘으로
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
                            style: AppTheme.a16700.copyWith(
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

  Widget _locSave() {
    return Row(
      children: [
        Text('저장위치',
            style: AppTheme.a16700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        TextButton(
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

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog2(context);
                },
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 12, top: 8, right: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.ae2e2e2)
              ),
              width: 150,
              height: 40,

              child: Text(controller.locSaveText.value, //입고취소 조회
                    style: AppTheme.a14400.copyWith(
                      color: AppTheme.a6c6c6c,
                    )
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
            style: AppTheme.a16700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 8, left: 8),
          height: 40,
          width: plag == 1 ? 100 : plag == 2 ? 130 : 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Container(
            height: 40,
            child: TextFormField(
              onTap: (){
                controller.isNewFocus.value = true;
              },
              readOnly:  plag == 0 ? true : false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),

              // maxLines: 5,
              controller: plag == 0 ? controller.textInbNoController : plag == 1 ? controller.textMgrController : plag == 2 ? controller.textLocController
                  : controller.textRemarkController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
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
            style: AppTheme.a16700
                .copyWith(color: AppTheme.black)),
        const SizedBox(width: 8,),
        Container(
          padding: const EdgeInsets.only(top: 4),
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
                        for(var i = 0; i < controller.etcIpgoQrList.length; i++) {
                          if(controller.etcIpgoQrList[i]['qrNo'].contains(controller.textQrController.text)) {
                            controller.isDuplQr.value = true;
                          }
                        }
                        if(controller.isDuplQr.value) {
                          controller.statusText.value = '중복된 QR코드입니다.';
                          controller.textQrController.text = '';
                        }else{
                          await controller.checkQR2(); // 조회
                          if(controller.etcIpgoQrList.isNotEmpty) {
                            await controller.checkDetailQR2(); // 디테일 조회
                            controller.etcIpgoSaveQrList.add(controller.etcIpgoQrList[0]);
                          }
                          controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcIpgoSaveQrList.length, (index) =>
                              PlutoRow(cells:
                              Map.from((controller.etcIpgoSaveQrList[index]).map((key, value) =>
                                  MapEntry(key, PlutoCell(value: value ?? '' )),
                              )))
                          );

                           controller.gridStateMgr4.removeAllRows();
                          controller.gridStateMgr4.appendRows(controller.rowDatas4);

                          if(controller.etcIpgoQrDetailTotalList.isNotEmpty) {
                            controller.rowDatas5.value = List<PlutoRow>.generate(controller.etcIpgoQrDetailTotalList[controller.etcIpgoQrDetailTotalList.length - 1].length, (index) =>
                                PlutoRow(cells:
                                Map.from((controller.etcIpgoQrDetailTotalList[controller.currentRowIndex2.value][index]).map((key, value) =>
                                    MapEntry(key, PlutoCell(value: value ?? '' )),
                                )))
                            );
                            controller.gridStateMgr5.removeAllRows();
                            controller.gridStateMgr5.appendRows(controller.rowDatas5);
                          }
                          controller.focusNode.requestFocus();
                          controller.textQrController.text = '';
                        }
                        controller.focusNode.requestFocus();
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
                  /*    if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                      else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                    },
                    onTapOutside:(event) => { controller.focusCnt.value = 0 },
                    onFieldSubmitted: (value) async {
                      /*controller.isDuplQr.value = false;
                      for(var i = 0; i < controller.etcIpgoQrList.length; i++) {
                        if(controller.etcIpgoQrList[i]['qrNo'].contains(controller.textQrController.text)) {
                          controller.isDuplQr.value = true;
                        }
                      }
                      if(controller.isDuplQr.value) {
                        controller.statusText.value = '중복된 QR코드입니다.';
                        controller.textQrController.text = '';
                      }else{
                        await controller.checkQR2(); // 조회
                        if(controller.etcIpgoQrList.isNotEmpty) {
                          await controller.checkDetailQR2(); // 디테일 조회
                          controller.etcIpgoSaveQrList.add(controller.etcIpgoQrList[0]);
                        }
                        controller.rowDatas4.value = List<PlutoRow>.generate(controller.etcIpgoSaveQrList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.etcIpgoSaveQrList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value ?? '' )),
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
        SizedBox(
          width: 55,
          child: Text('상태',
              style: AppTheme.a16700
                  .copyWith(color: AppTheme.black), textAlign: TextAlign.end,),
        ),
        const SizedBox(width: 8,),
        Container(

          padding: const EdgeInsets.only(top: 6, left: 8, right: 8),
          height: 40,
          width: controller.statusText.value == '' ? 353 : null,
          decoration: BoxDecoration(
              color: AppTheme.gray_gray_100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Text(controller.statusText.value,
            style:  AppTheme.a14700.copyWith(color: AppTheme.red_red_900),
            // maxLines: 5,

          ),

        ),
      ],
    );
  }

  Widget _alertDialog2(BuildContext context) {
    return AlertDialog(
        backgroundColor: AppTheme.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
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
                    '로케이션 선택',
                    style: AppTheme.a22700.copyWith(color: AppTheme.black),
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
              height: 12,
            ),
            _invnrTextForm3()
          ],
        ),
        content: _alertBody2(context, 0),

        /// 내부 메인body

        buttonPadding: const EdgeInsets.all(0),
        // insetPadding 이게 전체크기 조정
        insetPadding: const EdgeInsets.only(left: 45, right: 45),
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        //
        actions: [
          Container(
            width: 800,
            child: Column(
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
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)))),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                        onPressed: () async {
                          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                    color: const Color(0x5c3c3c43),
                                  )),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                              color: AppTheme.navy_navy_900),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            top: AppTheme.spacing_s_12,
                            bottom: AppTheme.spacing_s_12,
                          ),
                          child: Center(
                            child: Text('선택', style: AppTheme.titleHeadline.copyWith(color: AppTheme.white, fontSize: 17)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)))),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                        onPressed: () {
                          Get.log('닫기 클릭!');
                          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            top: AppTheme.spacing_s_12,
                            bottom: AppTheme.spacing_s_12,
                          ),
                          child: Center(
                            child: Text('닫기', style: AppTheme.titleHeadline.copyWith(color: AppTheme.black, fontSize: 17)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]);
  }


  Widget _alertBody2(BuildContext context, int idx) {
    return _alertBody(idx);
  }

  Widget _alertBody(int idx) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0))
      ),
      // padding: EdgeInsets.only(top: 40, bottom: 24, left: 16, right: 16),
      height: 600,
      width: 150,
      child: CustomScrollView(
        slivers: [
          // _title(),
          Obx(() =>   controller.popUpDataList.isNotEmpty ?
          _listArea2(idx) : SliverToBoxAdapter(child: Container())),
          SliverToBoxAdapter(child: SizedBox(height: 12,))
          // _bottom(context)
        ],
      ),
    );
  }


  Widget _listArea2(int idx) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          controller.selectedPopList.add(false);
          return _listItem2(index: index, context: context, idx: idx);
        }, childCount: controller.popUpDataList.length));
  }

  Widget _listItem2({required BuildContext context, required int index , required int idx}) {


    //  var regDttmFirstIndex =
    //  controller.noticeList[index].regDttm.toString().lastIndexOf(' ');

    return Obx(() => TextButton(
      style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5)))),
          /*backgroundColor: MaterialStateProperty.all<Color>(
                AppTheme.light_primary,
              ),*/
          padding:
          MaterialStateProperty.all(const EdgeInsets.all(0))),
      onPressed: () {
        if(controller.selectedPopList[index] == true) {
          controller.selectedPopList[index] = false;

        }else {
          for(var i = 0; i < controller.selectedPopList.length; i++) {
            controller.selectedPopList[i] = false;
          }
          controller.selectedPopList[index] = true;
          if(controller.selectedPopList[index] == true) {
            //    controller.isChoiceSheet.value = true;

            controller.selectedItemPopContainer.add(controller.popUpDataList[index]);
            /*  controller.measList[0]['CAR_NO'] = controller.selectedContainer[0]['CAR_NO'];
              controller.measList[0]['CUST_NM'] = controller.selectedContainer[0]['NAME'];
              controller.weighingInfoTextController.text = controller.selectedContainer[0]['CODE'];*/
            controller.locSaveText.value = controller.selectedItemPopContainer[0]['locCd'];
          }
        }

        Get.log('controller.selectedQrNo.value:: ${controller.selectedQrNo.value}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 12),
                padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  border: controller.selectedPopList[index] == true ? Border.all(color: AppTheme.black, width: 2) : Border.all(color: AppTheme.gray_c_gray_200),
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('존 명', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['zoneNm']}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('로케이션', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['locCd']}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    ),

    );
  }

  Widget _invnrTextForm3() {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('로케이션',
                  style: AppTheme.a20700
                      .copyWith(color: AppTheme.black)),
              SizedBox(width: 8,),
              Container(
                padding: EdgeInsets.only(top: 4, left: 8),
                height: 40,
                width: 570,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.ae2e2e2)),
                child: Container(
                  height: 40,
                  child: TextFormField(
                    readOnly: false,
                    expands :true,
                    minLines: null,
                    maxLines: null,
                    style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
                    controller: controller.textLocController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
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
          ),
          SizedBox(width: 8,),
          Container(
            margin: EdgeInsets.only(right: 8),
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
                await controller.reqLocation();
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
                  child: Text('조회', //입고취소 조회
                      style: AppTheme.a20700.copyWith(
                        color: AppTheme.white,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}


