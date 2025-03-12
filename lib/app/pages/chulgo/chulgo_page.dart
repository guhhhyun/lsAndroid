
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_controller.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_second_new_page.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_second_page.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class ChulgoPage extends StatelessWidget {
  ChulgoPage({super.key});

  ChulgoController controller = Get.find();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  late double test;
  late double ipgoDateWidth;

  @override
  Widget build(BuildContext context) {
    controller.isFocus.value == false ? controller.requestFocus2() : null;
    test = MediaQuery.of(context).size.width - 570;
    ipgoDateWidth = MediaQuery.of(context).size.width - 900;
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
                  CommonAppbarWidget(title: '출고등록', isLogo: false, isFirstPage: true ),
                  _mainBody(context),

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

  Widget _mainBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            color: AppTheme.dark_text_secondary,
            height: 1,
          ),
          _subBody(context),

         // _subBody2(context)
        ]),
      ),
    );
  }

  Widget _subBody(BuildContext context) {
    return Container(
      child: Column(
        children: [

          SizedBox(height: 4,),
          Obx(() => _SearchCondition3(context),),
          SizedBox(height: 4,),
          Container(
            color: AppTheme.dark_text_secondary,
            height: 1,
          ),
          Container(
            height: 4,
          ),
          Container(
            //margin: EdgeInsets.only(right: 12),
            width: MediaQuery.of(context).size.width-26,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 12,),
                    Obx(() => _dropDownItem2(),)
                  ],
                ),
                Row(
                  children: [
                    Obx(() => Container(
                      margin: const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                          color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      width: 40,
                      height: 40,
                    ),),
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
                        Get.log('출고등록 클릭!');
                        // 로직 넣기
                        await controller.checkQR2();
                        await controller.reqChulSecond();
                        controller.isQr.value = false;
                        Get.to(ChulgoSecondNewPage()); 

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
                          child: Text('출고등록',
                              style: AppTheme.a20700.copyWith(
                                color: AppTheme.white,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
          SizedBox(height: 12,),
          _rackIpgoList(context),
          SizedBox(height: 12,),
        ],
      ),
    );
  }


  Widget _rackIpgoList(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 500;
    return Container(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width-32,
          height: MediaQuery.of(context).size.height - 200,
          child: PlutoGrid(
            mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
            columns: gridCols(context),
            rows: controller.rowDatas.value,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              controller.isSelectedInvnr.value = false;
              controller.gridStateMgr = event.stateManager;
              controller.gridStateMgr.setSelectingMode(PlutoGridSelectingMode.none);
              //gridStateMgr.setShowColumnFilter(true);
            },
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            onSelected: (c) {
              Get.log('클릭!!!!!!!!!!!!');
              controller.currentFirstIndex.value = c.rowIdx!;
              /*  controller.zoneText.value = controller.rackIpgoList[controller.gridStateMgr.currentRowIdx!]['ZONE_NM'];
              controller.locText.value = controller.rackIpgoList[controller.gridStateMgr.currentRowIdx!]['LAST_LOC'];
              controller.zoneCd.value = controller.rackIpgoList[controller.gridStateMgr.currentRowIdx!]['ZONE_CD'];
              controller.locCd.value = controller.rackIpgoList[controller.gridStateMgr.currentRowIdx!]['LOC_CD'];*/
/*
              controller.isSelectedInvnr.value = true;
              controller.selectedInvnrIndex.value != controller.gridStateMgr.currentRowIdx!
                  ? {controller.ipgoQrList.clear(), controller.ipgoList.clear(), controller.gridStateMgr2.removeAllRows()} : null;
              controller.selectedInvnrIndex.value = controller.gridStateMgr.currentRowIdx!;
*/
              // controller.currentFirstIndex.value = c.rowIdx!;
              print(controller.gridStateMgr.currentRowIdx);
            },
            configuration: PlutoGridConfiguration(
              style: PlutoGridStyleConfig(
                  columnHeight: 55,
                  rowHeight: 55,
                  //gridBorderColor: Colors.transparent,
                  //   activatedColor: Colors.transparent,
                  //  cellColorInReadOnlyState: Colors.white,
                  columnTextStyle: AppTheme.a20400.copyWith(color: AppTheme.black),
                  cellTextStyle: AppTheme.a20700.copyWith(color: AppTheme.black),
              ),
            ),
          ),
        ),
      ],),
    );
  }
  List<PlutoColumn> gridCols(BuildContext context) {
    final List<PlutoColumn> gridCols = <PlutoColumn>[
      PlutoColumn(
        title: '지시번호',
        field: 'delOrdNo',
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
        title: '출고유형',
        field: 'delOrdType',
        type: PlutoColumnType.text(),
        width: 260,
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
        title: '출고상태',
        field: 'oubStsNm',
        type: PlutoColumnType.text(),
        width: 110,
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
        title: '오더구분',
        field: 'ordType2Nm',
        type: PlutoColumnType.text(),
        width: 150,
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
        title: '오더',
        field: 'soNo',
        type: PlutoColumnType.text(),
        width: 150,
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
        title: '원오더번호',
        field: 'soNo2',
        type: PlutoColumnType.text(),
        width: 170,
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
        width: ipgoDateWidth,
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
        title: '지시자',
        field: 'delOrdUsrNm',
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
        title: '지시일',
        field: 'delOrdDt',
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
        title: '출고예정(오더)',
        field: 'delPreDt',
        type: PlutoColumnType.text(),
        width: 140,
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
        title: '출고예정(납품)',
        field: 'delPreDt2',
        type: PlutoColumnType.text(),
        width: 140,
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
        title: 'BOM 변경',
        field: 'bcStatusNm',
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
        title: 'KIT 작업',
        field: 'kcStatusNm',
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
        title: '출고가능여부',
        field: 'opStatusNm',
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
    ];
    return gridCols;
  }

  Widget _SearchCondition3(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width:  MediaQuery.of(context).size.width - 135 ,
          padding: EdgeInsets.only(left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text('피킹지시일', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
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

                      }else {
                        controller.dayStartValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                      }
                      if(datePicked.toString() == '1994-01-01 00:00:00.000') {
                        controller.dayStartValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 130,
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
                      width: 130,
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
                SizedBox(width: 16,),
                _invnrTextForm2('오더', 0),
                SizedBox(width: 16,),
                _invnrTextForm2('프로젝트명', 1), 
               // _joneDropDownItem('존 구분', 0),
             /*   SizedBox(width: 16,),
                _dropDownItem2(),*/
              //  _joneDropDownItem('입고 구분', 1),

              ],
            ),
          ),
        ),
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
              controller.isFocus.value = true;
              controller.focusNode.unfocus();
              await controller.checkQR();

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
    );
  }

  Widget _dropDownItem2() {
    return Row(
      children: [
        Text('출고유형', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
        SizedBox(width: 8,),
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          padding: const EdgeInsets.only(right: 12),
          child: DropdownButton(
              menuWidth: 300,
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
              value: controller.selectedChulgoContainer['NAME'],
              items: controller.chulgoList.map((value) {
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
                controller.chulgoList.map((e) {
                  if(e['NAME'] == value) {
                    controller.selectedChulgoContainer['CODE'] = e['CODE'];
                    controller.selectedChulgoContainer['NAME'] = e['NAME'];
                  }
                }).toList();

              }),
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
          padding: EdgeInsets.only(top: 4, left: 8),
          height: 40,
          width: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Center(
            child: TextFormField(
              focusNode: title == '판매오더번호' ? controller.focusNode : null,
              readOnly:  plag == 4 ? true : false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
              // maxLines: 5,
              controller: plag == 0 ? controller.textOrderController : plag == 1 ? controller.textProjectController
                  : controller.textOrderController,
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
              onTapOutside:(event) => { controller.focusCnt.value = 0 },

              onFieldSubmitted: (value) async {

              }
              // onChanged: ((value) => controller.submitSearch(value)),
            ),
          ),

        ),
      ],
    );
  }


  void updateRows() {
    controller.rowDatas.value = List<PlutoRow>.generate(controller.chulgoList.length, (index) =>
        PlutoRow(cells:
        Map.from((controller.chulgoList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value ?? '' )),
        )))
    );
  }

  /// bom 팝업
  ///
  Widget _alertDialog2(BuildContext context) {

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
                    'BOM/오더 변경 점검 이력',
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
              height: 12,
            ),
          ],
        ),

        content: Container(
          //padding: EdgeInsets.only(bottom: 20),
          width: 550,
          height: 650,
          margin: EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rackIpgoList3(context),
                _rackIpgoList4(context)
              ],
            ),
          ),
        ), /// 내부 메인body

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
                        Get.log('취소 클릭!');
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        // 흩날리는 RldjrQnaoverlatContext!, rootNavigtor
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
    return Column(
      children: [
        _SearchCondition2(context),
        SizedBox(height: 12,),
        Column(children: [
          Container(
            width: MediaQuery.of(context).size.width-110,
            height: 280,
            child: PlutoGrid(
              mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
              columns: gridCols3(context),
              rows: controller.rows3.value,
              onLoaded: (PlutoGridOnLoadedEvent event) {

                controller.stateManager3 = event.stateManager;
                controller.stateManager3.setSelectingMode(PlutoGridSelectingMode.none);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
              },
              onSelected: (c) async {
                print(controller.stateManager3.currentRowIdx);
                controller.bomCurrentIdx.value = c.rowIdx!;
                await controller.reqBomDetail();

              },
              configuration: PlutoGridConfiguration(
                style: PlutoGridStyleConfig(
                    columnHeight: 40,
                    rowHeight: 55,
                    //gridBorderColor: Colors.transparent,
                    //   activatedColor: Colors.transparent,
                    //  cellColorInReadOnlyState: Colors.white,
                    columnTextStyle: AppTheme.a16500.copyWith(color: AppTheme.black)
                ),
              ),
            ),
          ),
        ],),
      ],
    );
  }

  Widget _invnrTextForm3(String title, int plag) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a16700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(left: 8, top: 8),
          height: 40,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: TextFormField(
            onTap: () {
              controller.isFocus.value = true;
            },
            expands : true,
            minLines: null,
            maxLines: null,
            style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
            // maxLines: 5,
            controller: plag == 0 ? controller.textSaleOrdController : plag == 1 ? controller.textItemCdController2
                : controller.textPrdOrdController,
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
          ),


          /* Text(subTitle, style: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),)*/

        ),
      ],
    );
  }

  Widget _SearchCondition2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          //  width:  MediaQuery.of(context).size.width - 200 ,
          padding: EdgeInsets.only(left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _invnrTextForm3('판매오더', 0),
                SizedBox(width: 12,),
                _invnrTextForm3('제품코드', 1),
                /*  SizedBox(width: 12,),
                 _invnrTextForm2('생산오더', 2),*/
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsets.only(right: 12),
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
                onPressed: () async{
                  Get.log('BOM변경확인 조회');
                  await controller.reqBom();
                  if(controller.bomList.isNotEmpty) {
                    await controller.reqBomDetail();
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
                    child: Text('조회',
                        style: AppTheme.a16700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4,),
            Container(
              width: 140,
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
                onPressed: () async{
                  await controller.registBomSave();
                  if(controller.isBomSave.value) {
                    Get.dialog(CommonDialogWidget(contentText: controller.isBomSaveText.value, pageFlag: 0));
                  }else {
                    Get.dialog(CommonDialogWidget(contentText: controller.isBomSaveText.value, pageFlag: 0));
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
                  child: Center(
                    child: Text('저장',
                        style: AppTheme.a16700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  List<PlutoColumn> gridCols3(BuildContext context) {
    final List<PlutoColumn> gridCols3 = <PlutoColumn>[
      PlutoColumn(
        title: '점검번호',
        field: 'bcId',
        type: PlutoColumnType.text(),
        width: 80,
        enableRowChecked: false,
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
        title: '점검일시',
        field: 'bxDtm',
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
        title: '점검구분',
        field: 'bcType',
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
        title: '점검상태',
        field: 'bcStatus',
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
        title: '점검내용',
        field: 'bcRmk',
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
        title: '조치결과',
        field: 'bcAfRst',
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
        title: '조치일시',
        field: 'bcAfDtm',
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
        title: '조치 담당자',
        field: 'bcAfUserId',
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
        title: '판매오더',
        field: 'soNo',
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
        title: '제품번호',
        field: 'pitmCd',
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
        title: 'SET수',
        field: 'setQty',
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
    ];
    return gridCols3;
  }


  Widget _rackIpgoList4(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12,),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width-110,
              height: 300,
              child: PlutoGrid(
                // mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
                columns: gridCols4(context),
                rows: controller.rows4.value,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  controller.stateManager4 = event.stateManager;
                  controller.stateManager4.setSelectingMode(PlutoGridSelectingMode.none);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  print(event);
                  if (event.column.field == 'chgCfRmk') {
                    print('선택한 값: ${event.value}');
                    controller.bomDetailList[event.rowIdx].addAll({'chgCfRmk': event.value});
                    // bom리스트에서 사유 입력한 값
                    // 바로 insert 해준다 output 결과값 얻고
                    // controller.bomConfirm, Add Location('현재 위치: ') controller.bomConfirm.add(controller.boxNo); 현재 위치에서 out 떄리고
                    // bom 사유에서 변경됐을 경우 rowInx == 0 ? Get.log('')
                  }
                  if (event.column.field == 'chgCfFlag') {
                    print('선택한 값: ${event.value}');
                    controller.bomDetailList[event.rowIdx].addAll({'chgCfFlag': event.value});
                  }
                },
                onSelected: (c) {
                  print(controller.stateManager4.currentRowIdx);

                },
                configuration: PlutoGridConfiguration(
                  style: PlutoGridStyleConfig(
                      columnHeight: 40,
                      rowHeight: 55,
                      //gridBorderColor: Colors.transparent,
                      //   activatedColor: Colors.transparent,
                      //  cellColorInReadOnlyState: Colors.white,
                      columnTextStyle: AppTheme.a16500.copyWith(color: AppTheme.black)
                  ),
                ),
              ),
            ),
          ],),
      ],
    );
  }

  List<PlutoColumn> gridCols4(BuildContext context) {
    final List<PlutoColumn> gridCols4 = <PlutoColumn>[
      PlutoColumn(
        title: '번호',
        field: 'bcSeq',
        type: PlutoColumnType.text(),
        width: 80,
        enableRowChecked: false,
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
        title: '변경확정',
        field: 'chgCfFlag',
        type: PlutoColumnType.select(controller.bomConfirm),
        width: 100,
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
        title: '확정사유',
        field: 'chgCfRmk',
        type: PlutoColumnType.text(),
        width: 200,
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
        title: '확정 처리자',
        field: 'chgCfUid',
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
        title: '확정 처리일시',
        field: 'chgCfDtm',
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
        title: '제품/자재코드',
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
        title: '품명',
        field: 'itemNm',
        type: PlutoColumnType.text(),
        width: 210,
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
      PlutoColumn(
        title: '변경상태',
        field: 'chkRst',
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
        title: '조치결과',
        field: 'bcAfRst',
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
        title: '조치일시',
        field: 'bcAfDtm',
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
        title: '조치 담당자',
        field: 'bcAfUserId',
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


}
