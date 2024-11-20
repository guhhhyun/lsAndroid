
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/picking/picking_controller.dart';

import 'package:pluto_grid/pluto_grid.dart';
import 'package:freedom_table/freedom_table.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class PickingSecondPage extends StatefulWidget {
  const PickingSecondPage({super.key});

  @override
  State<PickingSecondPage> createState() => _PickingSecondPageState();
}

class _PickingSecondPageState extends State<PickingSecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  PickingController controller = Get.find();
  @override
  Widget build(BuildContext context) {

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
                  CommonAppbarWidget(title: '랙출고', isLogo: false, isFirstPage: true ),
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
  Future<void> _loadData() async{
    controller.tableRows.clear();
    await test22();
  }

  Future<void> test22() async {
    controller.tableRows.clear();
    if(controller.tableRows.isEmpty) {
      controller.tableRows.add(
        TableRow(
          decoration: BoxDecoration(
              border: Border.all(color: AppTheme.white)
          ),
          children: [
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('랙출고', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('다른 위치 출고', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('피킹지시번호', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),

            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('프로젝트명', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),

            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('판매오더', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('품번', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('품명', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('자재번호', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('자재명', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('제조번호', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('피킹지시수량', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                 padding: EdgeInsets.all(8), child: Center(child: Text('피킹수량', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('중요 자재 여부', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('재고위치', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('피킹 순서', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),

          ],
        ),
      );
    }

    // 데이터에 따라 테이블 행 생성
    for (var i = 0; i < controller.pickingSecondList.length; i++) {
     // Rx<Color> cellColor = _getColorByPickRank(controller.pickingSecondList[i]['pickRank']).obs;



      // 테이블 행 추가
      controller.tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            color: controller.pickingSecondList[i]['pickRank'] == 1 ? Colors.white : controller.pickingSecondList[i]['pickRank'] == 2 ? AppTheme.gray_gray_200
                : controller.pickingSecondList[i]['pickRank'] == 3 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 4 ? AppTheme.gray_gray_100
                : controller.pickingSecondList[i]['pickRank'] == 5 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 6 ? AppTheme.gray_gray_100
                : controller.pickingSecondList[i]['pickRank'] == 7 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 8 ? AppTheme.gray_gray_100
                : controller.pickingSecondList[i]['pickRank'] == 9 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 10 ? AppTheme.gray_gray_100
                : controller.pickingSecondList[i]['pickRank'] == 11 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 12 ? AppTheme.gray_gray_100
                : controller.pickingSecondList[i]['pickRank'] == 13 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 14 ? AppTheme.gray_gray_100
                : controller.pickingSecondList[i]['pickRank'] == 15 ? Colors.white
                : controller.pickingSecondList[i]['pickRank'] == 16 ? AppTheme.gray_gray_100 : Colors.white,
            border: Border(
              top: BorderSide(color: Colors.transparent),
              bottom: BorderSide(color: Colors.transparent),
            ),
          ),
          children: [
            Container(

                child: controller.pickingSecondList[i]['rackOutBtnRowspan'] != 0 ?
                InkWell(
                    onTap: () async{
                      await controller.registRackBtn(i);
                      controller.isRegistRackBtn.value ?
                      Get.dialog(CommonDialogWidget(contentText: '출고되었습니다', pageFlag: 3,)) : null;
                      await controller.reqPickingSecond();
                      await test22();
                      controller.update();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Center(
                          child: const Icon(Icons.play_circle, color: AppTheme.black,)),
                    )
                )
                    : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(

              child: controller.pickingSecondList[i]['othRackOutBtnRowspan'] != 0 ?InkWell(
                onTap: () async {
                  Get.log("Clicked index: $i");
                  await controller.reqPickingThird(i);
                  controller.height.value = 50*(double.parse((controller.pickingThirdList.length + 1).toString()));
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _alertDialog();
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child: const Icon(Icons.play_circle)//Text(controller.pickingSecondList[i]['othRackOutBtn'])
                  ),
                ),
              ) : Text(''),
            ),
            Container(
                padding: EdgeInsets.all(8),
                child: i == 0 ? Center(child: Text(controller.pickingSecondList[i]['pickNo'], style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(

                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['pjtNmRowspan'] != 0 ? Text(controller.pickingSecondList[i]['pjtNm'].toString().trim().replaceAll('\n', ''), style: AppTheme.a18400.copyWith(color: AppTheme.black), textAlign: TextAlign.left,) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['soNoRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['soNo'], style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['pitmNmRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['pitmCd'], style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['pitmNmRowspan'] != 0 ? Text(controller.pickingSecondList[i]['pitmNm'], style: AppTheme.a18400.copyWith(color: AppTheme.black)) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(padding: EdgeInsets.all(8), child: Center(child: Text(controller.pickingSecondList[i]['itemCd'], style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(padding: EdgeInsets.all(8), child: Text(controller.pickingSecondList[i]['itemNm'].replaceAll('\n', ''), style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['wrkNoRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['wrkNo'].toString().trim().replaceAll('\n', ''), style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['pickOrdQtyRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['pickOrdQty'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['pickQtyRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['pickQty'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),
            Container(
                padding: EdgeInsets.all(8),
                child: Center(child: Text(controller.pickingSecondList[i]['othRackOutBtnVisible'] ? '예' : '아니오', style: AppTheme.a18400.copyWith(color: AppTheme.black)))),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['locCdRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['locCd'], style: AppTheme.a18400.copyWith(color: AppTheme.black))) : Text('')),
            Container(
                padding: const EdgeInsets.all(8),
                child: controller.pickingSecondList[i]['pickRankRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['pickRank'].toString())) : Text('', style: AppTheme.a18400.copyWith(color: AppTheme.black))),

           // Container(padding: EdgeInsets.all(8), child: controller.pickingSecondList[i]['othRackOutBtnRowspan'] != 0 ? Center(child: Text(controller.pickingSecondList[i]['othRackOutBtn'])): Text('')),
          ],
        ),
      );

      // 현재 값을 이전 값으로 저장
      controller.previousPickNo.value = controller.pickingSecondList[i]['pickNo'];
      controller.previousPjtNm.value = controller.pickingSecondList[i]['pjtNmRowspan'];
      controller.previousSoNo.value = controller.pickingSecondList[i]['soNoRowspan'];
      controller.previousPitmCd.value = controller.pickingSecondList[i]['pitmCdRowspan'];
      controller.previousPitmNm.value = controller.pickingSecondList[i]['pitmCdRowspan'];
      controller.previousWrkNo.value = controller.pickingSecondList[i]['wrkNoRowspan'];
      controller.previousPickOrdQty.value = controller.pickingSecondList[i]['pickOrdQtyRowspan'];
      controller.previousPickQty.value = controller.pickingSecondList[i]['pickQtyRowspan'];
      controller.previousLocCd.value = controller.pickingSecondList[i]['locCdRowspan'];
      controller.previousPickRank.value = controller.pickingSecondList[i]['pickRankRowspan'];
      controller.previousRackOutBtn.value = controller.pickingSecondList[i]['rackOutBtnRowspan'];
      controller.previousOthRackOutBtn.value = controller.pickingSecondList[i]['othRackOutBtnRowspan'];
    }


  }


  Widget _subBody(BuildContext context) {
    return SliverToBoxAdapter(
        child: Obx(() => Column(
          children: [
            Container(
              color: AppTheme.black,
              height: 1,
            ),
            Container(
              height: 4,
            ),
            _SearchCondition(context),
            Container(
              height: 4,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                margin: EdgeInsets.only(left: 12, right: 12),
                width: 2900,

                child: Table(
                  columnWidths: {
                    0: FixedColumnWidth(90.0),
                    1: FixedColumnWidth(90.0),
                    2: FixedColumnWidth(200.0),
                    3: FixedColumnWidth(500.0),
                    4: FixedColumnWidth(200.0),
                    5: FixedColumnWidth(120.0),
                    6: FixedColumnWidth(400.0),
                    7: FixedColumnWidth(100.0),
                    8: FixedColumnWidth(400.0),
                    9: FixedColumnWidth(120.0),
                    10: FixedColumnWidth(130.0),
                    11: FixedColumnWidth(90.0),
                    12: FixedColumnWidth(100.0),
                    13: FixedColumnWidth(130.0),
                  },
                  border: TableBorder(
                    horizontalInside: BorderSide(color: Colors.transparent),
                    //  bottom: BorderSide(color: Colors.transparent)
                  ),
                  children: controller.tableRows.value,
                ),
              ),
            ),
          ],
        ),)
      );


  }


  Widget _SearchCondition(BuildContext context) {
    return Row(
      children: [
        Container(
          width:  MediaQuery.of(context).size.width - 50 ,
          padding: EdgeInsets.only(left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 16,),
                _invnrTextForm2('프로젝트명', controller.pickingFirstList[controller.currentFirstIndex.value]['pjtNm']),
                SizedBox(width: 16,),
                _invnrTextForm2('자재코드/자재명', controller.pickingFirstList[controller.currentFirstIndex.value]['itemCd'] ?? ''),
                SizedBox(width: 1,),
                _invnrTextForm2('', controller.pickingFirstList[controller.currentFirstIndex.value]['itemNm'].toString().replaceAll('\n', ' ') ?? '',),
                SizedBox(width: 16,),
                _invnrTextForm2('제조번호', controller.pickingFirstList[controller.currentFirstIndex.value]['wrkNo'] ?? ''),
                SizedBox(width: 16,),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _invnrTextForm2(String title, String value) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a16700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 4, left: 12, right: 12),
          height: 35,
         // width: title == '' ? 300 : null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Center(
            child: Text(value, style: AppTheme.a14400.copyWith(color: AppTheme.black),softWrap: false)
          ),

        ),
      ],
    );
  }
  Widget _alertDialog() {

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
                    '변경출고',
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

        content: _rackIpgoList(context), /// 내부 메인body

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
                      onPressed: () async {
                        Get.log('변경출고 클릭!');
                        Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                        await controller.registOtherRackBtn(controller.gridStateMgr2.currentRowIdx!);
                        controller.isRegistOtherRackBtn.value ?
                        Get.dialog(CommonDialogWidget(contentText: '변경출고되었습니다.', pageFlag: 3,)) : null;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: const Color(0x5c3c3c43),)
                            ),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                          color: AppTheme.navy_navy_900
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          top: AppTheme.spacing_s_12,
                          bottom: AppTheme.spacing_s_12,
                        ),
                        child: Center(
                          child: Text('변경출고',
                              style: AppTheme.titleHeadline.copyWith(
                                  color: AppTheme.white,
                                  fontSize: 17)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
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
                      },
                      child: Container(
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
                  )
                ],
              ),
            ],
          )
        ]);
  }

  Widget _rackIpgoList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      width: 550,
      height: 400,
      margin: EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width-32,
              height: MediaQuery.of(context).size.height-420,
              child: PlutoGrid(
                mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
                columns: gridCols(context),
                rows: controller.rowDatas2.value,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  controller.gridStateMgr2 = event.stateManager;
                  controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  print(event);
                },
                onSelected: (c) {
                  print(controller.gridStateMgr2.currentRowIdx);
                },
                configuration: PlutoGridConfiguration(
                  style: PlutoGridStyleConfig(
                      columnHeight: 40,
                      rowHeight: 55,
                      columnTextStyle: AppTheme.a14500.copyWith(color: AppTheme.black)
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
        title: '프로젝트명',
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
        textAlign: PlutoColumnTextAlign.center,
        backgroundColor: AppTheme.gray_c_gray_200,
      ),
      PlutoColumn(
        title: '품번',
        field: 'pitmCd',
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
        field: 'pitmNm',
        type: PlutoColumnType.text(),
        width: 300,
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
        title: '자재번호',
        field: 'itemCd',
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
        title: '자재명',
        field: 'itemNm',
        type: PlutoColumnType.text(),
        width: MediaQuery.of(context).size.width - 1000,
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
      PlutoColumn(
        title: '재고위치',
        field: 'locCd',
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
    return gridCols;
  }


}


