
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => Container(
                  margin: EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                      color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: 100,
                  height: 40,
                ),),
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
                            child: Text('BOM변경확인', //입고취소 조회
                                style: AppTheme.a16700.copyWith(
                                  color: AppTheme.white,
                                )),
                          ),
                        ),
                      ),
                    ),
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
                          style: AppTheme.a16700.copyWith(
                            color: AppTheme.white,
                          )),
                    ),
                  ),
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
                  columnHeight: 40,
                  rowHeight: 55,
                  //gridBorderColor: Colors.transparent,
                  //   activatedColor: Colors.transparent,
                  //  cellColorInReadOnlyState: Colors.white,
                  columnTextStyle: AppTheme.a16500.copyWith(color: AppTheme.black),
                  cellTextStyle: AppTheme.a16700.copyWith(color: AppTheme.black),
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
        width: 180,
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
        title: '출고상태',
        field: 'oubStsNm',
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
        title: '오더구분',
        field: 'ordType2Nm',
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
        title: '오더번호',
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
        title: '보관판매오더번호',
        field: 'soNo2',
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
        title: '출고예정일',
        field: 'delPreDt',
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
        title: 'BOM 변경',
        field: 'bcStatusNm',
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
        title: 'KIT 작업',
        field: 'kcStatusNm',
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
          width:  MediaQuery.of(context).size.width - 170 ,
          padding: EdgeInsets.only(left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text('피킹지시일', style: AppTheme.a16700.copyWith(color: AppTheme.black),),
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
                          Text(controller.dayStartValue.value, style: AppTheme.a12500
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
                      width: 130,
                      padding: const EdgeInsets.only( right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controller.dayEndValue.value, style: AppTheme.a14500
                              .copyWith(color: AppTheme.a6c6c6c
                              , fontSize: 17),),
                        ],
                      ),

                    ),
                  ),
                ),
                SizedBox(width: 16,),
                _invnrTextForm2('오더번호', 0),
                SizedBox(width: 16,),
                _invnrTextForm2('프로젝트명', 1),
               // _joneDropDownItem('존 구분', 0),
                SizedBox(width: 16,),
                _dropDownItem2(),
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
                    style: AppTheme.a16700.copyWith(
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
        Text('출고유형', style: AppTheme.a16700.copyWith(color: AppTheme.black),),
        SizedBox(width: 8,),
        Container(
          height: 40,
          width: 200,
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
              value: controller.selectedChulgoContainer['NAME'],
              items: controller.chulgoList.map((value) {
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
            style: AppTheme.a16700
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
              focusNode: title == '오더번호' ? controller.focusNode : null,
              readOnly:  plag == 4 ? true : false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
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
                hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
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




}
