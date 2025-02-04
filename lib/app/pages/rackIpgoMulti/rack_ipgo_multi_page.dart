
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/rackIpgoMulti/rack_ipgo_multi_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class RackIpgoMultiPage extends StatelessWidget {
  RackIpgoMultiPage({super.key});

  RackIpgoMultiController controller = Get.find();
  final focusNode2 = FocusNode();
  final focusNode3 = FocusNode();
  final focusNode4 = FocusNode();
  final focusNode4Key = FocusNode();
  late double test;
  late double ipgoDateWidth;

  @override
  Widget build(BuildContext context) {
    test = MediaQuery.of(context).size.width - 570;
    ipgoDateWidth = MediaQuery.of(context).size.width - 760;
    controller.isQrFocus.value == false ? controller.requestFocus() : null;
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
                  CommonAppbarWidget(title: '랙입고 일괄등록', isLogo: false, isFirstPage: true ),
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
          _subBody2(context)
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
         // _SearchCondition3(context),
          _rackIpgoList2(context),
         // _rackIpgoList2(context),
        ],
      ),
    );
  }


  Widget _rackIpgoList(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 300;
    return Container(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width-32,
          height: height,
          child: PlutoGrid(
          //  mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
            columns: gridCols(context),
            rows: controller.rowDatas.value,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              controller.isSelectedInvnr.value = false;
              controller.gridStateMgr = event.stateManager;
              controller.gridStateMgr.setSelectingMode(PlutoGridSelectingMode.none);
              //gridStateMgr.setShowColumnFilter(true);
              controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 0);
              Get.log('현재위치: ${controller.gridStateMgr.currentRowIdx}');
            },
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            onSelected: (c) {
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

              print(controller.gridStateMgr.currentRowIdx);
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
    );
  }
  List<PlutoColumn> gridCols(BuildContext context) {
    final List<PlutoColumn> gridCols = <PlutoColumn>[
      PlutoColumn(
        title: 'No',
        field: 'no',
        type: PlutoColumnType.text(),
        width: 60,
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
        field: 'ITEM_CD',
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
        field: 'ITEM_NM',
        type: PlutoColumnType.text(),
        width: MediaQuery.of(context).size.width - 896,
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
        field: 'QTY',
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
        title: '보유수량',
        field: 'QTY_HOLD',
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
        field: 'PJT_NM',
        type: PlutoColumnType.text(),
        width: 200,
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
        title: '현재 위치',
        field: 'LOC_CD',
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
        title: '바꿀 위치',
        field: 'LOC_CD_TO',
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
        title: '존',
        field: 'ZONE_NM',
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
        title: '입고일',
        field: 'LOC_DT',
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
    return gridCols;
  }

  Widget _rackIpgoList2(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 300;
    return Container(
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width-32,
          height: height,
          child: PlutoGrid(
           // mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
            columns: gridCols2(context),
            rows: controller.rowDatas2.value,
            onLoaded: (PlutoGridOnLoadedEvent event) {
              controller.gridStateMgr2 = event.stateManager;
              controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
              //gridStateMgr.setShowColumnFilter(true);
            },
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            onSelected: (c) {
              print(controller.gridStateMgr2.currentRowIdx);
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
    );
  }
  List<PlutoColumn> gridCols2(BuildContext context) {
    final List<PlutoColumn> gridCols2 = <PlutoColumn>[
      PlutoColumn(
        title: '랙입고 날짜',
        field: 'updDttm',
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
        title: '바뀐 위치',
        field: 'locCd',
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
        title: '자재코드',
        field: 'itemCd',
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
        title: '자재명',
        field: 'itemNm',
        type: PlutoColumnType.text(),
        width: MediaQuery.of(context).size.width - 700,
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
    return gridCols2;
  }


  Widget _SearchCondition2(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //  width:  MediaQuery.of(context).size.width - 200 ,
              padding: EdgeInsets.only(left: 24),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _qrCodeTextForm(context),
                    // _invnrTextForm('QR 코드', 3),
                    SizedBox(width: 16,),
                    _statusText(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4,),
            _invnrTextForm3('위치'),


          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => Container(
              margin: EdgeInsets.only(right: 14),
              decoration: BoxDecoration(
                  color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8)
              ),
              width: 40,
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
                  if(controller.registRackIpgoList.isNotEmpty) {
                    for(var i = 0; i < controller.registRackIpgoList.length; i++) {
                      if(controller.registRackIpgoList[i]['LOC_CD_TO'] == '') {
                        controller.isLocSelect.value = false;
                        break;
                      }else {
                        controller.isLocSelect.value = true;
                      }
                    }
                    if(controller.isLocSelect.value == false) {
                      Get.dialog(CommonDialogWidget(contentText: '입고위치를 입력해주세요', pageFlag: 0));
                    }else{
                      await controller.registRackIpgoBtn();
                      Get.dialog(CommonDialogWidget(contentText: '저장되었습니다.', pageFlag: 0));
                      controller.textQrMultiController.text = '';
                      controller.zoneText.value = '';
                      controller.zoneCd.value = '';
                      controller.locText.value = '';
                      controller.locCd.value = '';
                      controller.textLocMultiController.text = '';
                      controller.textZoneController.text = '';
                      controller.textStatusController.text = '';
                      controller.registRackIpgoList.clear();
                      controller.rackIpgoList.clear();
                      controller.gridStateMgr.removeAllRows();
                      controller.statusText.value = '';
                      await controller.checkTodayList();
                    /*  controller.rowDatas2.value = List<PlutoRow>.generate(controller.rackIpgoTodayList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.rackIpgoTodayList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value )),
                          )))
                      );
                      controller.gridStateMgr2.removeAllRows();
                      controller.gridStateMgr2.appendRows(controller.rowDatas2.value);*/

                    }
                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '자재를 선택해주세요', pageFlag: 0));

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
                    child: Text('랙 입고',
                        style: AppTheme.a20700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4,),
            /*Container(
             // margin: EdgeInsets.only(right: 12),
              width: 130,
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
                  Get.log('입고 보류 클릭!');
                  if(controller.rackIpgoList.isNotEmpty) {
                    await controller.yetRackIpgoBtn();
                    Get.log('입고 보류 클릭!');
                    Get.dialog(CommonDialogWidget(contentText: '입고 보류되었습니다', pageFlag: 3,));
                    controller.textQrController.text = '';
                    controller.zoneText.value = '';
                    controller.zoneCd.value = '';
                    controller.locText.value = '';
                    controller.locCd.value = '';
                    controller.textLocController.text = '';
                    controller.textZoneController.text = '';
                    controller.textStatusController.text = '';
                    controller.registRackIpgoList.clear();
                    controller.rackIpgoList.clear();
                    controller.gridStateMgr.removeAllRows();
                  }else {
                    Get.log('사용재고 보류 클릭!');
                    Get.dialog(CommonDialogWidget(contentText: '자재를 선택해주세요', pageFlag: 0));
                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 130,
                  height: 40,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('사용재고 보류',
                        style: AppTheme.a20700.copyWith(
                          color: AppTheme.white,
                        )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4,),
            Container(
              margin: EdgeInsets.only(right: 12),
              width: 160,
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
                  if(controller.rackIpgoList.isNotEmpty) {
                    await controller.yetRackReIpgoBtn();
                    Get.log('사용재고 보류 취소 클릭!');
                    Get.dialog(CommonDialogWidget(contentText: '보류 취소되었습니다', pageFlag: 3,));
                    controller.textQrController.text = '';
                    controller.zoneText.value = '';
                    controller.zoneCd.value = '';
                    controller.locText.value = '';
                    controller.locCd.value = '';
                    controller.textLocController.text = '';
                    controller.textZoneController.text = '';
                    controller.textStatusController.text = '';
                    controller.registRackIpgoList.clear();
                    controller.rackIpgoList.clear();
                    controller.gridStateMgr.removeAllRows();
                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '자재를 선택해주세요', pageFlag: 0));

                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.navy_navy_800,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.ae2e2e2)
                  ),
                  width: 160,
                  height: 40,
                  padding: const EdgeInsets.only(

                  ),
                  child: Center(
                    child: Text('사용재고 보류 취소',
                        style: AppTheme.a20700.copyWith(
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

  Widget _statusText() {
    return Row(
      children: [
        Text('상태',
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(

          padding: EdgeInsets.only(top: 6, left: 8, right: 8),
          height: 40,
          width: controller.statusText.value == '' ? 250 : null,
          decoration: BoxDecoration(
            color: AppTheme.gray_gray_100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Text(controller.statusText.value,
            style:  AppTheme.a20700.copyWith(color: AppTheme.red_red_900),
            // maxLines: 5,
          ),
        ),
      ],
    );
  }

  void updateRows() {
    controller.rowDatas.value = List<PlutoRow>.generate(controller.rackIpgoList.length, (index) =>
        PlutoRow(cells:
        Map.from((controller.rackIpgoList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value )),
        )))
    );
  }

  Widget _qrCodeTextForm(BuildContext context) {
    return Row(
      children: [
        Text('QR 코드',
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 4),
          width: 250,
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
                child:


                KeyboardListener(
                  focusNode: controller.focusNodeKey,
                  onKeyEvent: (event) async {
                    if (event is KeyDownEvent) {
                      //  final inputChar = event.character ?? '';
                      //  controller.textLocController.text += inputChar;
                      // 키보드 입력값 수신 처리
                      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                        // 엔터 키 감지
                        controller.isDuplQr.value = false;
                        for(var i = 0; i < controller.registRackIpgoList.length; i++) {
                          if(controller.registRackIpgoList[i]['QR_NO'].contains(controller.textQrMultiController.text)) {
                            controller.isDuplQr.value = true;
                          }
                        }
                        if(controller.isDuplQr.value) {
                          controller.statusText.value = '중복된 QR코드입니다.';
                          controller.textQrMultiController.text = '';
                        }else{
                          await controller.checkQR(); // 조회
                          if(controller.rackIpgoList.length > 1 && controller.rackIpgoList[0]['TAG_TYPE'] != '90') {
                            // 중복 QR코드가 있을 때 선택하게끔 POP UP 띄우기
                            showDialog(
                              barrierDismissible: false,
                              context: context, //context
                              builder: (BuildContext context) {
                                return _alertDialog(context);
                              },
                            ); // context가 왜?
                            /// 혹시 랙입고 중복라벨 시 전부 넣어주는거로 바뀐거면?
                            /* /// /// 혹시 랙입고 중복라벨 시 전부 넣어주는거로 바뀐거면?
                            controller.rowDatas.value = List<PlutoRow>.generate(controller.registRackIpgoList.length, (index) =>
                                PlutoRow(cells:
                                Map.from((controller.registRackIpgoList[index]).map((key, value) =>
                                    MapEntry(key, PlutoCell(value: value == null ? '' : *//*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : *//*value )),
                                )))
                            );
                            controller.gridStateMgr.removeAllRows();
                            controller.gridStateMgr.appendRows(controller.rowDatas.value);
                            controller.gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
                            if(controller.rackIpgoList.isNotEmpty) {
                              controller.zoneText.value = controller.rackIpgoList[0]['LAST_ZONE_NM']?? '';
                              controller.locText.value = controller.rackIpgoList[0]['LAST_LOC']?? '';
                              controller.zoneCd.value = controller.rackIpgoList[0]['ZONE_CD']?? '';
                              controller.locCd.value = controller.rackIpgoList[0]['LOC_CD'] ?? '';
                            }
                            controller.textQrMultiController.text = '';*/

                          }else {
                            controller.rowDatas.value = List<PlutoRow>.generate(controller.registRackIpgoList.length, (index) =>
                                PlutoRow(cells:
                                Map.from((controller.registRackIpgoList[index]).map((key, value) =>
                                    MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
                                )))
                            ).reversed.toList();
                            controller.gridStateMgr.removeAllRows();
                            controller.gridStateMgr.appendRows(controller.rowDatas.value);
                            controller.gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
                            if(controller.rackIpgoList.isNotEmpty) {
                              controller.zoneText.value = controller.rackIpgoList[0]['LAST_ZONE_NM']?? '';
                              controller.locText.value = controller.rackIpgoList[0]['LAST_LOC']?? '';
                              controller.zoneCd.value = controller.rackIpgoList[0]['ZONE_CD']?? '';
                              controller.locCd.value = controller.rackIpgoList[0]['LOC_CD'] ?? '';
                            }

                            controller.textQrMultiController.text = '';
                            // 랙 입고 controller.textQrMultoController.text = '';
                            // controller.zoneCd.value = controller.tackIpgoList[0] controller.value.
                          }
                          controller.textQrMultiController.text = '';
                          /*        controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, controller.gridStateMgr.rows.length - 1);
                          controller.currentFirstIndex.value = controller.gridStateMgr.currentRowIdx!;*/
                        }
                        controller.focusNode.requestFocus();
                        controller.isQrFocus.value = false;
                      }
                    }
                  },

                  child: TextFormField(
                    expands :true,
                    minLines: null,
                    maxLines: null,
                    focusNode: controller.focusNode,
                    style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
                    // maxLines: 5,
                    controller: controller.textQrMultiController,
                    textAlignVertical: TextAlignVertical.center,
                    onTap: () {
                    /*  controller.isQrFocus.value = true;
                      if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                      else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                    },
                    onTapOutside:(event) => { controller.focusCnt.value = 0 },
                    onFieldSubmitted: (value) async{
                      /*controller.isDuplQr.value = false;
                        for(var i = 0; i < controller.registRackIpgoList.length; i++) {
                          if(controller.registRackIpgoList[i]['QR_NO'].contains(controller.textQrMultiController.text)) {
                            controller.isDuplQr.value = true;
                          }
                        }
                        if(controller.isDuplQr.value) {
                          controller.statusText.value = '중복된 QR코드입니다.';
                          controller.textQrMultiController.text = '';
                        }else{
                          await controller.checkQR(); // 조회
                          if(controller.rackIpgoList.length > 1) {
                            // 중복 QR코드가 있을 때 선택하게끔 POP UP 띄우기
                            showDialog(
                              barrierDismissible: false,
                              context: context, //context
                              builder: (BuildContext context) {
                                return _alertDialog(context);
                              },
                            ); // context가 왜?
                          }else {
                            controller.rowDatas.value = List<PlutoRow>.generate(controller.registRackIpgoList.length, (index) =>
                                PlutoRow(cells:
                                Map.from((controller.registRackIpgoList[index]).map((key, value) =>
                                    MapEntry(key, PlutoCell(value: value == null ? '' : *//*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : *//*value )),
                                )))
                            );
                            controller.gridStateMgr.removeAllRows();
                            controller.gridStateMgr.appendRows(controller.rowDatas.value);
                            controller.gridStateMgr.scroll.vertical?.animateTo(25, curve: Curves.bounceIn, duration: Duration(milliseconds: 100));
                            controller.zoneText.value = controller.rackIpgoList[0]['LAST_ZONE_NM']?? '';
                            controller.locText.value = controller.rackIpgoList[0]['LAST_LOC']?? '';
                            controller.zoneCd.value = controller.rackIpgoList[0]['ZONE_CD']?? '';
                            controller.locCd.value = controller.rackIpgoList[0]['LOC_CD'] ?? '';
                            controller.textQrMultiController.text = '';
                            // 랙 입고 controller.textQrMultoController.text = '';
                            // controller.zoneCd.value = controller.tackIpgoList[0] controller.value.
                          }
                          controller.textQrMultiController.text = '';
                  *//*        controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, controller.gridStateMgr.rows.length - 1);
                          controller.currentFirstIndex.value = controller.gridStateMgr.currentRowIdx!;*//*
                        }

                      controller.isQrFocus.value = false;*/

                    },
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      /*suffixIcon: InkWell(
                          onTap: () {
                            Get.log('조회 돋보기 클릭!');

                            focusNode2.requestFocus();
                            Future.delayed(const Duration(), (){
                              focusNode2.requestFocus();
                              //  FocusScope.of(context).requestFocus(focusNode);
                              Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                            });
                          },
                          child: Image.asset('assets/app/search.png', color: AppTheme.a6c6c6c, width: 25, height: 25,)
                      ),
                  */
                      contentPadding: const EdgeInsets.all(0),
                      fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                      filled: true,
                      hintText: '',
                      hintStyle: AppTheme.a20400.copyWith(color: AppTheme.aBCBCBC),
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


  Widget _alertDialog(BuildContext context) {

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

        content: _alertList(context), /// 내부 메인body

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
                        Get.log('선택 클릭!');
                        controller.rackIpgoList.clear();
                        controller.rackIpgoDupList[controller.alertIndex.value].addAll({'no': controller.registRackIpgoList.length + 1});
                        controller.rackIpgoList.add(controller.rackIpgoDupList[controller.alertIndex.value]);
                        controller.rackIpgoList[0].addAll({'LOC_CD_TO': ''});
                        controller.registRackIpgoList.add(controller.rackIpgoList[0]);

                        controller.zoneText.value = controller.rackIpgoList[0]['LAST_ZONE_NM']?? '';
                        controller.locText.value = controller.rackIpgoList[0]['LAST_LOC']?? '';
                        controller.zoneCd.value = controller.rackIpgoList[0]['ZONE_CD']?? '';
                        controller.locCd.value = controller.rackIpgoList[0]['LOC_CD'] ?? '';
                        controller.textQrMultiController.text = '';

                        controller.rowDatas3.value = List<PlutoRow>.generate(controller.registRackIpgoList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.registRackIpgoList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value ?? '' )),
                            )))
                        );
                        controller.gridStateMgr.removeAllRows();
                        controller.gridStateMgr.appendRows(controller.rowDatas3.value);
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

  Widget _alertList(BuildContext context) {
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
        }, childCount: controller.rackIpgoDupList.length)));
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
          if(controller.isSelect[index] == true) {
            controller.isSelect[index] = false;

          }else {
            for(var i = 0; i < controller.isSelect.length; i++) {
              controller.isSelect[i] = false;
            }
            controller.isSelect[index] = true;

          }
          controller.alertIndex.value = index;
          //  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
        },
        child: Obx(() => Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18, right: 18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: controller.isSelect[index] ? Border.all(color: AppTheme.black, width: 3) : Border.all(color: AppTheme.ae2e2e2),
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
                      Text('QR코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.rackIpgoDupList[index]['QR_NO']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('품목코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.rackIpgoDupList[index]['ITEM_CD']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('품명: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.rackIpgoDupList[index]['ITEM_NM'].toString().trim()}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                    ],
                  ),
                  SizedBox(width: 12,),
                  Row(
                    children: [
                      Text('마지막 위치: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.rackIpgoDupList[index]['LAST_ZONE_NM']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),)
                    ],
                  )
                ],
              )

            ],
          ),
        ),)
    );
  }

  /// /////////////////////////////////////////////////////// 입고 권고 위치 //////////////////////////////////

  Widget _subBody2(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            padding: EdgeInsets.only(bottom: 4,),
            /*decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: AppTheme.black
                    )
                )
            ),*/

          ),
         /* const SizedBox(height: 4,),
          _SearchCondition3(context),
          const SizedBox(height: 4,),

          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: AppTheme.black)
                )
            ),
          ),
          _SearchCondition4(context),

          // _SearchCondition4(context),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: AppTheme.black)
                )
            ),
          ),
          _SearchCondition5(context),
          SizedBox(height: 12,),*/
         // _ipgoCancelList(context),



        ],
      ),
    );
  }




  Widget _invnrTextForm3(String title) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 50),
          width: 40,
          child: Text(title,
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black), textAlign: TextAlign.end,),
        ),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 4),
          width: 250,
          height: 40,
          child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.ae2e2e2),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                ),
                child: KeyboardListener(
                  focusNode: focusNode4Key,
                  onKeyEvent: (event) {
                    if (event is KeyDownEvent) {
                      //  final inputChar = event.character ?? '';
                      //  controller.textLocController.text += inputChar;
                      // 키보드 입력값 수신 처리
                      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                        // 엔터 키 감지
                        for(var i = 0; i < controller.registRackIpgoList.length; i++) {
                          controller.registRackIpgoList[i].addAll({'LOC_CD_TO': controller.textLocMultiController.text});
                        }

                        // controller.registRackIpgoList[controller.currentFirstIndex.value].addAll({'LOC_CD_TO':controller.textLocController.text}); // 건 마다 다르게 위치 등록

                        controller.rowDatas.value = List<PlutoRow>.generate(controller.registRackIpgoList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.registRackIpgoList[index]).map((key, value) =>
                                MapEntry(key, PlutoCell(value: value == null ? '' : /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
                            )))
                        ).reversed.toList();
                        controller.gridStateMgr.removeAllRows();
                        controller.gridStateMgr.appendRows(controller.rowDatas.value);

                        // controller.locTextS.value = controller.textLocController.text;

                        controller.textLocMultiController.text = '';
                      }
                    }
                  },
                  child: TextFormField(
                    expands :true,
                    minLines: null,
                    maxLines: null,
                    focusNode: focusNode4,
                    style:  AppTheme.a18700.copyWith(color: AppTheme.a6c6c6c),
                    // maxLines: 5,
                    controller: controller.textLocMultiController,
                    textAlignVertical: TextAlignVertical.center,
                    onTap: () {
                     /* controller.isQrFocus.value = true;
                      if(controller.focusCnt2.value++ > 1) controller.focusCnt2.value = 0;
                      else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                    },
                    onTapOutside:(event) => { controller.focusCnt.value = 0 },
                    onFieldSubmitted: (value) async{
                     /* for(var i = 0; i < controller.registRackIpgoList.length; i++) {
                        controller.registRackIpgoList[i].addAll({'LOC_CD_TO':controller.textLocMultiController.text});
                      }

                      // controller.registRackIpgoList[controller.currentFirstIndex.value].addAll({'LOC_CD_TO':controller.textLocController.text}); // 건 마다 다르게 위치 등록

                      controller.rowDatas.value = List<PlutoRow>.generate(controller.registRackIpgoList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.registRackIpgoList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value == null ? '' : *//*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : *//*value )),
                          )))
                      );
                      controller.gridStateMgr.removeAllRows();
                      controller.gridStateMgr.appendRows(controller.rowDatas.value);

                     // controller.locTextS.value = controller.textLocController.text;

                      controller.textLocMultiController.text = '';*/


                    },
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                      filled: true,
                      hintStyle: AppTheme.a18700.copyWith(color: AppTheme.aBCBCBC),
                      border: InputBorder.none,
                    ),
                    showCursor: true,


                  ),
                ),
              )
          ),

        ),
      ],
    );
  }

}
