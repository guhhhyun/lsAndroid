
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
import 'package:lsandroid/app/common/utils.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_controller.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/picking/picking_controller.dart';
import 'package:lsandroid/app/routes/app_route.dart';

import 'package:pluto_grid/pluto_grid.dart';
import 'package:freedom_table/freedom_table.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ChulgoSecondNewPage extends StatefulWidget {
  const ChulgoSecondNewPage({super.key});

  @override
  State<ChulgoSecondNewPage> createState() => _ChulgoSecondNewPageState();
}

class _ChulgoSecondNewPageState extends State<ChulgoSecondNewPage> {
  @override
  void initState() {

    super.initState();

  }


  ChulgoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.isQr.value == false ? controller.requestFocus() : null;
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
                  CommonAppbarWidget(title: '출고 등록', isLogo: false, isFirstPage: true ),
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
                width: 50,
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                child: Center(child: Text('번호', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('스캔', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('제품', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('제품명', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('자재 번호', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('자재명', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('수량', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('바코드', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('KIT 완료 여부', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('박스 번호', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('박스명', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('제조 번호', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),

            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('재고 위치', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),
            Container(
                decoration: BoxDecoration(
                    color: AppTheme.gray_c_gray_200
                ), height: 40,
                padding: EdgeInsets.all(8), child: Center(child: Text('지시 순서', style: AppTheme.a18400.copyWith(color: AppTheme.black),))),

          ],
        ),
      );
    }

    // 데이터에 따라 테이블 행 생성
    for (var i = 0; i < controller.chulSecondList.length; i++) {
      if(i == 0) {
        controller.numbering.value = 1;
        controller.isText.value = true;
      }else {
        if(controller.chulSecondList[i]['no'] != controller.numbering.value) { // 숫자가 변했을 때는 텍스트가 출력되게
          controller.numbering.value = controller.chulSecondList[i]['no'];
          controller.isText.value = true;
        }else {
          controller.isText.value = false;
        }
      }

      // 테이블 행 추가
      controller.tableRows.add(
        TableRow(
          decoration: BoxDecoration(
            color: controller.chulSecondList[i]['no'] == 1 ? Colors.white : controller.chulSecondList[i]['no'] == 2 ? AppTheme.gray_gray_200
                : controller.chulSecondList[i]['no'] == 3 ? Colors.white
                : controller.chulSecondList[i]['no'] == 4 ? AppTheme.gray_gray_100
                : controller.chulSecondList[i]['no'] == 5 ? Colors.white
                : controller.chulSecondList[i]['no'] == 6 ? AppTheme.gray_gray_100
                : controller.chulSecondList[i]['no'] == 7 ? Colors.white
                : controller.chulSecondList[i]['no'] == 8 ? AppTheme.gray_gray_100
                : controller.chulSecondList[i]['no'] == 9 ? Colors.white
                : controller.chulSecondList[i]['no'] == 10 ? AppTheme.gray_gray_100
                : controller.chulSecondList[i]['no'] == 11 ? Colors.white
                : controller.chulSecondList[i]['no'] == 12 ? AppTheme.gray_gray_100
                : controller.chulSecondList[i]['no'] == 13 ? Colors.white
                : controller.chulSecondList[i]['no'] == 14 ? AppTheme.gray_gray_100
                : controller.chulSecondList[i]['no'] == 15 ? Colors.white
                : controller.chulSecondList[i]['no'] == 16 ? AppTheme.gray_gray_100 : Colors.white,
            border: Border(
              top: BorderSide(color: Colors.transparent),
              bottom: BorderSide(color: Colors.transparent),
            ),
          ),
          children: [
            Container(
                width: 50,
                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['noRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['no'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('') ),
            Container(

                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['scanRowspan'] != 0 ? Center(child: Text(controller.scanOxList[i], style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['pitmCdRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['pitmCd'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')), //제품
            Container(
                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['pitmNmRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['pitmNm'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['itemCdRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['itemCd'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['itemNmRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['itemNm'].toString().replaceAll('\n', ' '), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child:  controller.chulSecondList[i]['cbxQtyRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['cbxQty'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child:  controller.chulSecondList[i]['tagNoRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['tagNo'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),
            Container(padding: EdgeInsets.all(8), child: controller.chulSecondList[i]['wrkCfmYnNmRowspan'] != 0  ? Center(child: Text(controller.chulSecondList[i]['wrkCfmYnNm'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),
            Container(padding: EdgeInsets.all(8), child: controller.chulSecondList[i]['boxNoRowspan'] != 0  ? Center(child: Text(controller.chulSecondList[i]['boxNo'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child:  controller.chulSecondList[i]['boxNmRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['boxNm'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child:  controller.chulSecondList[i]['wrkNoRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['wrkNo'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)) : Text('')),

            Container(
                padding: EdgeInsets.all(8),
                child: controller.chulSecondList[i]['locCdRowspan'] != 0 ? Center(child: Text(controller.chulSecondList[i]['locCd'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)) : Text('')),
            Container(
                padding: EdgeInsets.all(8),
                child: controller.isText.value ?  Center(child: Text(controller.chulSecondList[i]['no'].toString(), style: AppTheme.a18400.copyWith(color: AppTheme.black),)): Text('')),

          ],
        ),
      );

    }


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
              _rackIpgoList3(context),

              Container(
                height: 4,
              ),
              _SearchCondition(context),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _qrCodeTextForm(),
                  // _invnrTextForm('QR 코드', 3),
                  SizedBox(width: 16,),
                  _statusText(),
                ],
              ),
              SizedBox(width: 24,),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12),
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
                      onPressed: () async {
                        Get.log('BOM변경확인 클릭!');
                        controller.textSaleOrdController.text = controller.chulOneList[0]['soNo']; // bom변경확인 팝업 열었을 때 판매오더번호
                        await controller.reqBom();
                        if(controller.bomList.isNotEmpty) {
                          await controller.reqBomDetail();
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _alertDialog2(context);
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppTheme.navy_navy_800,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.ae2e2e2)
                        ),
                        width: 140,
                        height: 40,
                        padding: const EdgeInsets.only(

                        ),
                        child: Center(
                          child: Text('BOM변경확인', //입고취소 조회
                              style: AppTheme.a20700.copyWith(
                                color: AppTheme.white,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(right: 12),
                    width: 120,
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(

                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () async {
                        controller.isQr.value = true;
                        Get.log('출고등록 클릭!');
                        for(var i = 0; i < controller.chulSecondList.length; i++) {
                          if(controller.chulSecondList[i]['scanRowspan'] != 0) {
                            if(controller.chulSecondList[i]['scan']) {
                              Get.log('');
                              controller.isChulgo.value = true;
                            }else {
                              Get.log('');
                              controller.isChulgo.value = false;
                            }
                          }
                        }
                        if(controller.isChulgo.value) {
                          await controller.registChulgoBtn(0);
                          controller.isRegistChulgo.value ?
                          Get.dialog(CommonDialogWidget(contentText: '등록되었습니다.', pageFlag: 999)) :  Get.dialog(CommonDialogWidget(contentText: '등록 실패했습니다.', pageFlag: 0));
                          /// 재조회 필요하면?
                         // await controller.reqChulSecond();
                        }else {
                          Get.dialog(CommonDialogWidget(contentText: '스캔되지않은 제품이 있습니다.', pageFlag: 0));
                        }
                        controller.isQr.value = true;
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
                  ),
                  SizedBox(width: 4,),
                  Container(
                    // margin: EdgeInsets.only(right: 12),
                    width: 120,
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(

                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () async{
                        Get.log('출고취소 클릭!');
                        await controller.registChulgoBtn(1);
                        Get.dialog(CommonDialogWidget(contentText: '출고 취소되었습니다.', pageFlag: 0));
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
                          child: Text('출고취소',
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
          ),
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

  Widget _qrCodeTextForm() {
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
                padding: const EdgeInsets.only(left: 16, right: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.ae2e2e2),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                ),
                child: KeyboardListener(
                  focusNode: controller.focusNode2Key,
                  onKeyEvent: (event) async {
                    if (event is KeyDownEvent) {
                      //  final inputChar = event.character ?? '';
                      //  controller.textLocController.text += inputChar;
                      // 키보드 입력값 수신 처리
                      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                        // 엔터 키 감지
                        await controller.reqChulThird();
                        if(controller.isSuccessThird.value == true) {
                          for(var i = 0; i < controller.chulSecondList.length; i++) {
                            if(controller.chulSecondList[i]['tagNoRowspan'] != 0) {
                              if(controller.chulSecondList[i]['tagNo'] == controller.textQrController.text) {
                                controller.scanOxList[i] = 'O';
                                if(controller.chulSecondList[i]['boxNo'] != null) {
                                  controller.noList.add(controller.chulSecondList[i]['boxNo']);
                                }else {
                                  controller.noList.add(controller.chulSecondList[i]['tagNo']);
                                }
                                controller.chulSecondList[i].addAll({'scan': true});
                              }
                            }

                          }
                          await controller.test();
                          /*focusNode2.requestFocus();
                        Future.delayed(const Duration(), (){
                          focusNode2.requestFocus();
                          //  FocusScope.of(context).requestFocus(focusNode);
                          Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                        });*/
                        }

                        controller.textQrController.text = '';
                        controller.focusNode2.requestFocus();
                      }
                    }
                  },
                  child: TextFormField(
                    expands :true,
                    minLines: null,
                    maxLines: null,
                    focusNode: controller.focusNode2,
                    style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
                    // maxLines: 5,
                    controller: controller.textQrController,
                    textAlignVertical: TextAlignVertical.center,
                    onTap: () {
                     /* if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                      else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                      controller.tete.value = true;*/
                   /*   controller.gridStateMgr2.removeAllRows();
                      controller.gridStateMgr2.appendRows(controller.rowDatas2);*/
                    },
                    onTapOutside:(event) => { controller.focusCnt.value = 0 },
                    onFieldSubmitted: (value) async{
                      /*await controller.reqChulThird();
                      if(controller.isSuccessThird.value == true) {
                        for(var i = 0; i < controller.chulSecondList.length; i++) {
                          if(controller.chulSecondList[i]['tagNoRowspan'] != 0) {
                            if(controller.chulSecondList[i]['tagNo'] == controller.textQrController.text) {
                              controller.scanOxList[i] = 'O';
                              controller.chulSecondList[i]['scan'] = true;
                            }
                          }
                        }
                        await test22(); // 조회
                        controller.textQrController.text = '';
                        *//*focusNode2.requestFocus();
                        Future.delayed(const Duration(), (){
                          focusNode2.requestFocus();
                          //  FocusScope.of(context).requestFocus(focusNode);
                          Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                        });*//*
                      }*/
                    },
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      labelStyle: AppTheme.a16400.copyWith(color: AppTheme.black),
                      contentPadding: const EdgeInsets.all(0),
                      fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                      filled: true,
                      // hintText: 'BC 번호를 입력해주세요',
                      hintStyle: AppTheme.a16400.copyWith(color: AppTheme.black),
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
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  controller.gridStateMgr2 = event.stateManager;
                  controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
                  controller.gridStateMgr2.setCurrentCell(controller.gridStateMgr2.firstCell, 0);
                  Get.log('현재위치: ${controller.gridStateMgr2.currentRowIdx}');
                  controller.currentRowIndex.value = controller.gridStateMgr2.currentRowIdx!;
                 // controller.requestFocus();
                  // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                  //gridStateMgr.setShowColumnFilter(true);
                },
                onChanged: (PlutoGridOnChangedEvent event) {
                  print(event);
                },
                onSelected: (c) {
                  print(controller.gridStateMgr2.currentRowIdx);
                  controller.currentRowIndex.value = c.rowIdx!;
                  controller.currentRowIndex.value != controller.gridStateMgr2.currentRowIdx!
                      ? {/*controller.ipgoQrList.clear(), controller.ipgoList.clear(),*/ controller.gridStateMgr3.removeAllRows()} : null;
                  controller.currentRowIndex.value = controller.gridStateMgr2.currentRowIdx!;

                  ///
                  controller.itemTotalList.clear();
                  Map<dynamic, List<Map<String, dynamic>>> groupedMap = {};
                  // chulSecondList를 순회하면서 no 값을 키로 그룹화
                  for (var item in controller.chulSecondList) {
                    var key = item['no'];
                    if (groupedMap.containsKey(key)) {
                      groupedMap[key]!.add(item);
                    } else {
                      groupedMap[key] = [item];
                    }
                  }

                  // 그룹화된 맵의 각 값을 RxList로 변환하여 itemTotalList에 추가
                  groupedMap.values.forEach((group) {
                    controller.itemTotalList.add(group.obs);  // 각 그룹을 RxList로 변환 후 itemTotalList에 추가
                  });
                  Get.log('itemTotalList::: ${controller.itemTotalList}');
                  controller.rowDatas3.value = List<PlutoRow>.generate(
                    controller.itemTotalList[controller.currentRowIndex.value].length,
                        (index) => PlutoRow(
                      cells: Map.from(
                        (controller.itemTotalList[controller.currentRowIndex.value][index]).map((key, value) => MapEntry(
                          key,
                          PlutoCell(
                            value: value == null
                                ? ''
                                : value,
                          ),
                        )),
                      ),
                    ),
                  );

                  controller.gridStateMgr3.removeAllRows();
                  controller.gridStateMgr3.appendRows(controller.rowDatas3);
                  controller.isQr.value = false;
                   // controller.requestFocus();
                },

                rowColorCallback: (c) {
                  // 찾아
                  for (var i = 0; i < controller.noList.length; i++) {
                    // controller.changedRows.value.add(controller.noList[i]);
                    controller.changedRows.value.add(controller.noList[i]);
                  }
                  if (controller.changedRows.contains(c.row.cells['boxNo']?.value.toString())
                      || controller.changedRows.contains(c.row.cells['tagNo']?.value.toString())) {
                    return AppTheme.gray_c_gray_200; // 이미 변경된 색상 유지
                  } else {
                    return Colors.transparent;
                  }

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
        title: '순서',
        field: 'noV',
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
     /* PlutoColumn(
        title: '스캔',
        field: 'scanNm',
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
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    controller.scanOxList2[rendererContext.rowIdx],
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),*/
      PlutoColumn(
        title: 'BOM변경',
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
        title: 'KIT완료',
        field: 'wrkCfmYnNm',
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
        title: '바코드',
        field: 'tagNo',
        type: PlutoColumnType.text(),
        width: 240,
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
        title: '박스번호',
        field: 'boxNo',
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
        title: '박스명',
        field: 'boxNm',
        type: PlutoColumnType.text(),
        width: 500,
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
        title: '제품',
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
        title: '제품명',
        field: 'pitmNm',
        type: PlutoColumnType.text(),
        width: 500,
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
      PlutoColumn(
        title: '재고위치',
        field: 'locCd',
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
        title: '지시 순서',
        field: 'no',
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
      /*PlutoColumn(
        title: '번호',
        field: 'no',
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
      ),*/
      PlutoColumn(
        title: '자재번호',
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
        width: MediaQuery.of(context).size.width/2 - 370,
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
        field: 'cbxQty',
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

    ];
    return gridCols2;
  }
  Widget _rackIpgoList3(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
    final double height = 200;
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      height: 115,
      margin: EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width -24,
              height: 115,
              child: PlutoGrid(
                columns: gridCols3(context),
                rows: controller.rowDatas4.value,
                onLoaded: (PlutoGridOnLoadedEvent event) {
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

  List<PlutoColumn> gridCols3(BuildContext context) {
    final List<PlutoColumn> gridCols3 = <PlutoColumn>[
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
        width: 180,
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
        width: 500,
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
        title: '출고예정(납품)',
        field: 'delPreDt2',
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
    ];
    return gridCols3;
  }


  Future<void> plutoRow3() async {
    controller.itemTotalList.clear();
    Map<dynamic, List<Map<String, dynamic>>> groupedMap = {};
    // chulSecondList를 순회하면서 no 값을 키로 그룹화
    for (var item in controller.chulSecondList) {
      var key = item['no'];
      if (groupedMap.containsKey(key)) {
        groupedMap[key]!.add(item);
      } else {
        groupedMap[key] = [item];
      }
    }

    // 그룹화된 맵의 각 값을 RxList로 변환하여 itemTotalList에 추가
    groupedMap.values.forEach((group) {
      controller.itemTotalList.add(group.obs);  // 각 그룹을 RxList로 변환 후 itemTotalList에 추가
    });
    Get.log('itemTotalList::: ${controller.itemTotalList}');
    controller.rowDatas3.value = List<PlutoRow>.generate(
      controller.itemTotalList[controller.currentRowIndex.value].length,
          (index) => PlutoRow(
        cells: Map.from(
          (controller.itemTotalList[controller.currentRowIndex.value][index]).map((key, value) => MapEntry(
            key,
            PlutoCell(
              value: value == null
                  ? ''
                  : value,
            ),
          )),
        ),
      ),
    );


    controller.gridStateMgr3.removeAllRows();
    controller.gridStateMgr3.appendRows(controller.rowDatas3.value);
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
          height: 610,
          margin: EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rackIpgoList4(context),
                _rackIpgoList5(context)
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

  Widget _rackIpgoList4(BuildContext context) {
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
              columns: gridCols4(context),
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
            readOnly: true,
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
                  controller.textSaleOrdController.text = controller.chulOneList[0]['soNo'];
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
  List<PlutoColumn> gridCols4(BuildContext context) {
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
        title: '판매오더번호',
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

    ];
    return gridCols3;
  }


  Widget _rackIpgoList5(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12,),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width-110,
              height: 260,
              child: PlutoGrid(
                // mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
                columns: gridCols5(context),
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

  List<PlutoColumn> gridCols5(BuildContext context) {
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


