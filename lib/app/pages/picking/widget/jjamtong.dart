/*

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
    test22();
  }
  PickingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.gridRow();
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

  Future<void> test22() async {
    if(controller.tableRows.isEmpty) {
      controller.tableRows.add(
        TableRow(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.transparent) , bottom: BorderSide(color: Colors.transparent))
          ),
          children: [
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('피킹지시번호'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('프로젝트명'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('판매오더'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('품번'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('품명'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('자재번호'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('자재명'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('제조번호'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('피킹지시수량'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('피킹수량'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('중요 자재 여부'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('재고위치'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('피킹 순서'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('랙출고'))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                width: 200, padding: EdgeInsets.all(8), child: Center(child: Text('다른 위치 출고'))),
          ],
        ),
      );
    }
    // 데이터에 따라 테이블 행 생성
    for (var i = 0; i < controller.pickingSecondList.length; i++) {
      var row = controller.pickingSecondList[i];

      controller.isSamePickNo.value = controller.previousPickNo.value == row['pickNo'];
      controller.isSamePjtNm.value = controller.previousPjtNm.value == row['pjtNmRowspan'];
      controller.isSameSoNo.value = controller.previousSoNo.value == row['soNoRowspan'];
      controller.isSamePitmCd.value = controller.previousPitmCd.value == row['pitmCdRowspan'];
      controller.isSamePitmNm.value = controller.previousPitmNm.value == row['pitmCdRowspan'];
      controller.isSameWrkNo.value = controller.previousWrkNo.value == row['wrkNoRowspan'];
      controller.isSamePickOrdQty.value = controller.previousPickOrdQty.value == row['pickOrdQtyRowspan'];
      controller.isSamePickQty.value = controller.previousPickQty.value == row['pickQtyRowspan'];
      controller.isSameLocCd.value = controller.previousLocCd.value == row['locCdRowspan'];
      controller.isSamePickRank.value = controller.previousPickRank.value == row['pickRankRowspan'];
      controller.isSameRackOutBtn.value = controller.previousRackOutBtn.value == row['rackOutBtnRowspan'];
      controller.isSameOthRackOutBtn.value = controller.previousOthRackOutBtn.value == row['othRackOutBtnRowspan'];

      // 첫 번째 행인지 확인
      controller.isFirstInGroup['pickNo'] = !controller.isSamePickNo.value && controller.previousPickNo.value != '';
      controller.isFirstInGroup['pjtNm'] = !controller.isSamePjtNm.value && controller.previousPjtNm.value != '';
      controller.isFirstInGroup['soNo'] = !controller.isSameSoNo.value && controller.previousSoNo.value != '';
      controller.isFirstInGroup['pitmCd'] = !controller.isSamePitmCd.value && controller.previousPitmCd.value != '';
      controller.isFirstInGroup['pitmNm'] = !controller.isSamePitmNm.value && controller.previousPitmNm.value != '';
      controller.isFirstInGroup['wrkNo'] = !controller.isSameWrkNo.value && controller.previousWrkNo.value != '';
      controller.isFirstInGroup['pickOrdQty'] = !controller.isSamePickOrdQty.value && controller.previousPickOrdQty.value != '';
      controller.isFirstInGroup['pickQty'] = !controller.isSamePickQty.value && controller.previousPickQty.value != '';
      controller.isFirstInGroup['locCd'] = !controller.isSameLocCd.value && controller.previousLocCd.value != '';
      controller.isFirstInGroup['pickRank'] = !controller.isSamePickRank.value && controller.previousPickRank.value != '';
      controller.isFirstInGroup['rackOutBtn'] = !controller.isSameRackOutBtn.value && controller.previousRackOutBtn.value != '';
      controller.isFirstInGroup['othRackOutBtn'] = !controller.isSameOthRackOutBtn.value && controller.previousOthRackOutBtn.value != '';

      // 테이블 행 추가
      controller.tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.transparent),
              bottom: BorderSide(color: Colors.transparent),
            ),
          ),
          children: [
            Container(
                padding: EdgeInsets.all(8),
                child: row['pickNoRowspan'] != 0 ? Text(row['pickNo']) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['pjtNmRowspan'] != 0 ? Text(row['pjtNm']) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['soNoRowspan'] != 0 ? Text(row['soNo']) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['pitmNmRowspan'] != 0 ? Text(row['pitmCd']) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['pitmNmRowspan'] != 0 ? Text(row['pitmNm']) : Text('')),
            Container(padding: EdgeInsets.all(8), child: Text(row['itemCd'])),
            Container(padding: EdgeInsets.all(8), child: Text(row['itemNm'])),
            Container(
                padding: EdgeInsets.all(8),
                child: row['wrkNoRowspan'] != 0 ? Text(row['wrkNo']) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['pickOrdQtyRowspan'] != 0 ? Text(row['pickOrdQty'].toString()) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['pickQtyRowspan'] != 0 ? Text(row['pickQty'].toString()) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: Text(row['othRackOutBtnVisible'] ? '예' : '아니오')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['locCdRowspan'] != 0 ? Text(row['locCd']) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: row['pickRankRowspan'] != 0 ? Text(row['pickRank'].toString()) : Text('')),
            Container(padding: EdgeInsets.all(8), child: Text(row['rackOutBtn'])),
            Container(padding: EdgeInsets.all(8), child: Text(row['othRackOutBtn'])),
          ],
        ),
      );

      // 현재 값을 이전 값으로 저장
      controller.previousPickNo.value = row['pickNo'];
      controller.previousPjtNm.value = row['pjtNmRowspan'];
      controller.previousSoNo.value = row['soNoRowspan'];
      controller.previousPitmCd.value = row['pitmCdRowspan'];
      controller.previousPitmNm.value = row['pitmCdRowspan'];
      controller.previousWrkNo.value = row['wrkNoRowspan'];
      controller.previousPickOrdQty.value = row['pickOrdQtyRowspan'];
      controller.previousPickQty.value = row['pickQtyRowspan'];
      controller.previousLocCd.value = row['locCdRowspan'];
      controller.previousPickRank.value = row['pickRankRowspan'];
      controller.previousRackOutBtn.value = row['rackOutBtnRowspan'];
      controller.previousOthRackOutBtn.value = row['othRackOutBtnRowspan'];
    }

    controller.update();

  }
  Widget _mainBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        // width: MediaQuery.of(context).size.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            color: AppTheme.dark_text_secondary,
            height: 1,
          ),
        ]),
      ),
    );
  }

  Widget _subBody(BuildContext context) {
    test22();
    return Obx(() {
      return SliverToBoxAdapter(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 3000,

            child: Table(
              border: TableBorder.all(),
              children: controller.tableRows.value,
            ),
          ),
        ),
      );

    });
  }

  Widget Header() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.black)
      ),
      child: Text('1'),
    );
  }

  Widget _subBody22(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return Container(
      height: MediaQuery.of(context).size.height -100,
      child: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true,// default false
        isAlwaysShown: true, // default false
        scrollbarFadeDuration: Duration(milliseconds: 500), // default : Duration(milliseconds: 300)
        scrollbarTimeToFade: Duration(milliseconds: 800),// default : Duration(milliseconds: 600)
        style: VsScrollbarStyle(
          hoverThickness: 10.0, // default 12.0
          radius: Radius.circular(10), // default Radius.circular(8.0)
          thickness: 10.0, // [ default 8.0 ]
          color: Colors.purple.shade900, // default ColorScheme Theme
        ),
        child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _subBody(context);

          },
        ),

      ),
    );
  }


  List<TrackSize> gridCols2(BuildContext context) {
    final List<TrackSize> gridCols = <TrackSize>[
      1.fr
    ];
    return gridCols;
  }

*/
/*
  List<TrackSize> gridCols(BuildContext context) {
    final List<TrackSize> gridCols = <TrackSize>[
      TrackSize(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('피킹지시번호'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('프로젝트명'),
      ),FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('판매오더'),
      ),FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('품번'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('품명'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('자재번호'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('자재명'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('제조번호'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('피킹지시수량'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('피킹수량'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('중요 자재 여부'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('재고위치'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('피킹순서'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('랙출고'),
      ),
      FreedomTableHeaderCell(
        isFixedColumn: true,
        fixedWidth: 200,
        child: Text('다른 위치 출고'),
      ),
    ];
    return gridCols;
  }*//*


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
                Text('일자', style: AppTheme.a12700.copyWith(color: AppTheme.black),),
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
                        */
/*    if(controller.choiceButtonVal.value != 0) {

                           }*//*

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
                        */
/* if(controller.choiceButtonVal.value != 0) {

                           }*//*

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
                  Get.log('엑셀 클릭!');

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
                  Get.log('PDF 클릭!');

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
            ),
          ],
        ),
      ],
    );
  }

  Widget _invnrTextForm2(String title, int plag) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a12700
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


*/
