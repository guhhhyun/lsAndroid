
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/picking/picking_controller.dart';
import 'package:lsandroid/app/pages/picking/picking_second_page.dart';
import 'package:lsandroid/app/routes/app_route.dart';


import 'package:pluto_grid/pluto_grid.dart';


class PickingPage extends StatelessWidget {
  PickingPage({super.key});

  PickingController controller = Get.find();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  late double test;
  late double ipgoDateWidth;

  @override
  Widget build(BuildContext context) {
    test = MediaQuery.of(context).size.width - 570;
    ipgoDateWidth = MediaQuery.of(context).size.width - 760;
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
                  CommonAppbarWidget(title: '피킹 작업(랙출고)', isLogo: false, isFirstPage: true ),
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
          _subBody(context)
        ]),
      ),
    );
  }

  Widget _subBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 4,),
          Obx(() => _SearchCondition2(context),),
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
          height: MediaQuery.of(context).size.height - 150,
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
                  cellTextStyle: AppTheme.a16700.copyWith(color: AppTheme.black)
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
          title: '랙출고',
          field: 'rackOutBtn',
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
          renderer: (c) {
            return Container(
              child: InkWell(
                  onTap: () async{
                    Get.log('랙출고 클릭!');
                    controller.currentFirstIndex.value = c.rowIdx!;
                    Get.log('랙출고 클릭!');
                    await controller.reqPickingSecond();

                    Get.to(PickingSecondPage());

                  },
                  child: Center(
                    child: const Icon(Icons.play_circle),
                  )
              ),
            );
          }
      ),
      PlutoColumn(
        title: '지시번호',
        field: 'pickNo',
        type: PlutoColumnType.text(),
        width: 160,
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
        title: '지시자',
        field: 'pickUser',
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
        title: '프로젝트',
        field: 'pjtNm',
        type: PlutoColumnType.text(),
        width: 300,
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
        title: '제조번호',
        field: 'wrkNo',
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
    ];
    return gridCols;
  }

  Widget _SearchCondition2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width:  MediaQuery.of(context).size.width - 400 ,
          padding: EdgeInsets.only(left: 50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text('일자', style: AppTheme.a16700.copyWith(color: AppTheme.black),),
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
                      height: 35,
                      width: 150,
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
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.ae2e2e2)),
                      width: 150,
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
                _invnrTextForm2('지시번호', 0),
                SizedBox(width: 16,),
                _invnrTextForm2('프로젝트명', 1),
              ],
            ),
          ),
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
                  controller.reqPickingFirst();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 120,
                  height: 35,
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
            /*Container(
              margin: EdgeInsets.only(right: 12),
              width: 120,
              height: 35,
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
                  Get.log('엑셀 클릭!');
                  Get.log('저장할 리스트!: ${controller.pickingFirstList.length}');
                  if(controller.pickingFirstList.isNotEmpty) {
                    await controller.exportToExcel(controller.rowDatas, ['지시번호','지시자','프로젝트','자재코드','자재명','제조번호','랙출고']);
                    await controller.moveFileToDownloads();
                    controller.isExelSuc.value ?
                    Get.dialog(CommonDialogWidget(contentText: '다운로드되었습니다', pageFlag: 3,)) : null;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 120,
                  height: 35,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('엑셀', //입고취소 조회
                        style: AppTheme.a12700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 120,
              height: 35,
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
                  if(controller.pickingFirstList.isNotEmpty) {
                    await controller.exportToPdf(controller.rowDatas, ['지시번호','지시자','프로젝트','자재코드','자재명','제조번호','랙출고']);
                    await controller.movePdfFileToDownloads();
                    controller.isPdfSuc.value ?
                    Get.dialog(CommonDialogWidget(contentText: '다운로드되었습니다', pageFlag: 3,)) : null;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 120,
                  height: 35,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('PDF', //입고취소 조회
                        style: AppTheme.a12700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),*/
          ],
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
          height: 35,
          width: plag == 4 ? 250 : 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Center(
            child: TextFormField(
              readOnly:  plag == 4 ? true : false,
              expands :true,
              minLines: null,
              maxLines: null,
              style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
              // maxLines: 5,
              controller: plag == 0 ? controller.textJisiController : controller.textProjectController,
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

              // onChanged: ((value) => controller.submitSearch(value)),
            ),
          ),

        ),
      ],
    );
  }





}
