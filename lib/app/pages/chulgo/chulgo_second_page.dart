
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

import 'package:pluto_grid/pluto_grid.dart';
import 'package:freedom_table/freedom_table.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ChulgoSecondPage extends StatefulWidget {
  const ChulgoSecondPage({super.key});

  @override
  State<ChulgoSecondPage> createState() => _ChulgoSecondPageState();
}

class _ChulgoSecondPageState extends State<ChulgoSecondPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  ChulgoController controller = Get.find();
  final focusNode2 = FocusNode();
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
            ),
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
                          // margin: EdgeInsets.only(right: 12),
                          width: 120,
                          height: 35,
                          child: TextButton(
                            style: ButtonStyle(

                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0))),
                            onPressed: () async {
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
                                Get.dialog(CommonDialogWidget(contentText: '등록되었습니다.', pageFlag: 0));
                              }else {
                                Get.dialog(CommonDialogWidget(contentText: '스캔되지않은 제품이 있습니다.', pageFlag: 0));
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
                                child: Text('출고등록',
                                    style: AppTheme.a12700.copyWith(
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
                          height: 35,
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
                              height: 35,
                              padding: const EdgeInsets.only(

                              ),
                              child: Center(
                                child: Text('출고취소',
                                    style: AppTheme.a12700.copyWith(
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
            style: AppTheme.a12700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(

          padding: EdgeInsets.only(top: 6, left: 8, right: 8),
          height: 35,
          width: controller.statusText.value == '' ? 250 : null,
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

  Widget _qrCodeTextForm() {
    return Row(
      children: [
        Text('QR 코드',
            style: AppTheme.a12700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 4),
          width: 250,
          height: 35,
          // padding: const EdgeInsets.only(left: 20, right: 12, top: 4),
          child: Center(
              child: Container(
                padding: const EdgeInsets.only(left: 8, right: 6),
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.ae2e2e2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  expands :true,
                  minLines: null,
                  maxLines: null,
                  focusNode: focusNode2,
                  style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
                  // maxLines: 5,
                  controller: controller.textQrController,
                  textAlignVertical: TextAlignVertical.center,
                  onTap: () {
                    if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                  },
                  onTapOutside:(event) => { controller.focusCnt.value = 0 },
                  onFieldSubmitted: (value) async{
                    await controller.reqChulThird();
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
                      focusNode2.requestFocus();
                      Future.delayed(const Duration(), (){
                        focusNode2.requestFocus();
                        //  FocusScope.of(context).requestFocus(focusNode);
                        Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                      });
                    }
                  },
                  keyboardType: TextInputType.text,
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
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '',
                    hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
                    border: InputBorder.none,
                  ),
                  showCursor: true,


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
      padding: EdgeInsets.only(bottom: 20),
      width: 550,
      height: 400,
      margin: EdgeInsets.only(left: 12, right: 12),
      child: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width-32,
              height: controller.height.value,
              child: PlutoGrid(
                mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
                columns: gridCols(context),
                rows: controller.rowDatas2.value,
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  controller.gridStateMgr2 = event.stateManager;
                  controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
                  // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
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
                      columnHeight: 40,
                      rowHeight: 55,
                      //gridBorderColor: Colors.transparent,
                      //   activatedColor: Colors.transparent,
                      //  cellColorInReadOnlyState: Colors.white,
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


