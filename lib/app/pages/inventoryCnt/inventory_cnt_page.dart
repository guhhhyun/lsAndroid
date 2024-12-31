
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/bottom_sheet.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_second_new_page.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/inventoryCnt/inventory_cnt_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class InventoryCntPage extends StatelessWidget {
  InventoryCntPage({super.key});

  InventoryCntController controller = Get.find();
  final focusNode = FocusNode();
  final focusNodeForm = FocusNode();
  final focusNode2 = FocusNode();
  final focusNode2Form = FocusNode();


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
                  CommonAppbarWidget(title: '재고실사', isLogo: false, isFirstPage: true ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _locationQr(),
                  _itemQr(),
                  SizedBox(width: 18,),
                  _statusText()
                ],
              ),
              Row(
                children: [
                  Obx(() => Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    width: 40,
                    height: 40,
                  ),),
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
                        Get.log('추가 클릭!');
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return _alertDialog(context);
                          },
                        );
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
                          child: Text('추가', //입고취소 조회
                              style: AppTheme.a20700.copyWith(
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
                      Get.log('삭제 클릭!');
                      for(var e = controller.checkList.length - 1; e >= 0; e--) {
                        if(controller.checkList[e] == true) {
                          controller.inventoryCntList.removeAt(e); // 좌측리스트 삭제
                          controller.checkList.removeAt(e);
                        }
                      }
                      /// 리스트 삭제
                      controller.gridStateMgr.removeAllRows();
                      controller.rowDatas.value = List<PlutoRow>.generate(controller.inventoryCntList.length, (index) =>
                          PlutoRow(cells:
                          Map.from((controller.inventoryCntList[index]).map((key, value) =>
                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                          )))
                      );
                      controller.gridStateMgr.appendRows(controller.rowDatas.value);

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
                  SizedBox(width: 14,)
                ],
              ),

            ],
          ),
          /*Container(
            //margin: EdgeInsets.only(right: 12),
            width: MediaQuery.of(context).size.width-26,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                      Get.log('추가 클릭!');

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
                        child: Text('추가', //입고취소 조회
                            style: AppTheme.a20700.copyWith(
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
              ],
            ),
          ),*/
          SizedBox(height: 12,),
          _rackIpgoList(context),
          SizedBox(height: 12,),
        ],
      ),
    );
  }

  Widget _locationQr() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 14),
          width: 80,
          child: Text('실사 위치',
            style: AppTheme.a18700
                .copyWith(color: AppTheme.black), textAlign: TextAlign.end,),
        ),
        SizedBox(width: 8,),


        Container(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 8),
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.ae2e2e2),
            color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
          ),

          child: Center(
              child: KeyboardListener(
                focusNode: focusNode2,
                onKeyEvent: (event) {
                  if (event is KeyDownEvent) {
                    //  final inputChar = event.character ?? '';
                    //  controller.textLocController.text += inputChar;
                    // 키보드 입력값 수신 처리
                    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                      // 엔터 키 감지
                      final inputChar = event.character ?? '';
                      if(controller.textLocController.text.length == 10) {
                        final scannedData = controller.textLocController.text;
                        // 데이터 처리
                        controller.locTextS.value = scannedData;
                        controller.textLocController.clear(); // 텍스트 필드 초기화

                        Get.log('Scanned Data: $scannedData');
                      }else {
                        controller.textLocController.clear(); // 텍스트 필드 초기화
                        Get.dialog(CommonDialogWidget(contentText: '바코드를 다시 입력해주세요', pageFlag: 3,));
                      }
                    }
                  }
                },
                child:  TextFormField(
                  textInputAction:TextInputAction.done,
                  expands :true,
                  minLines: null,
                  maxLines: null,
                  focusNode: focusNode2Form, // 주석 풀어야할수있음
                  style:  AppTheme.a18700.copyWith(color: AppTheme.a6c6c6c),
                  // maxLines: 5,
                  controller: controller.textLocController, // 주석 풀어야할수있음
                  textAlignVertical: TextAlignVertical.center,
                  onTap: () {
                    controller.isFocus.value = true;
                    /*   if(controller.focusCnt2.value++ > 1) controller.focusCnt2.value = 0;
                    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                  },
                  onTapOutside:(event) => { controller.focusCnt2.value = 0 },
                  onFieldSubmitted: (value) async{
                    //  controller.focusNodeForm.requestFocus();
                    //  controller.textLocController.clear(); // 텍스트 필드 초기화
                    /*    controller.locTextS.value = controller.textLocController.text;
                    controller.textLocController.text = '';
                    controller.focusNode.requestFocus();
                    Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
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
              )
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


  Widget _itemQr() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 4),
          width: 80,
          child: Text('QR 코드',
            style: AppTheme.a18700
                .copyWith(color: AppTheme.black), textAlign: TextAlign.end,),
        ),
        SizedBox(width: 8,),


        Container(
          padding: EdgeInsets.only(top: 4, bottom: 4, left: 8),
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.ae2e2e2),
            color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
          ),

          child: Center(
              child: KeyboardListener(
                focusNode: focusNode,
                onKeyEvent: (event) {
                  if (event is KeyDownEvent) {
                    //  final inputChar = event.character ?? '';
                    //  controller.textLocController.text += inputChar;
                    // 키보드 입력값 수신 처리
                    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                      // 엔터 키 감지


                    }
                  }
                },
                child:  TextFormField(
                  textInputAction:TextInputAction.done,
                  expands :true,
                  minLines: null,
                  maxLines: null,
                  focusNode: focusNodeForm, // 주석 풀어야할수있음
                  style:  AppTheme.a18700.copyWith(color: AppTheme.a6c6c6c),
                  // maxLines: 5,
                  controller: controller.textQrController, // 주석 풀어야할수있음
                  textAlignVertical: TextAlignVertical.center,
                  onTap: () {
                    controller.isFocus.value = true;
                    /*   if(controller.focusCnt2.value++ > 1) controller.focusCnt2.value = 0;
                    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                  },
                  onTapOutside:(event) => { controller.focusCnt2.value = 0 },
                  onFieldSubmitted: (value) async{
                    //  controller.focusNodeForm.requestFocus();
                    //  controller.textLocController.clear(); // 텍스트 필드 초기화
                    /*    controller.locTextS.value = controller.textLocController.text;
                    controller.textLocController.text = '';
                    controller.focusNode.requestFocus();
                    Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
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
              )
          ),

        ),
      ],
    );
  }

  Widget _dropDownItem() {
    return Row(
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
      ],
    );
  }

  Widget _dropDownItem2() {
    return Row(
      children: [
        Text('자재 분류', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
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
              value: controller.selectedItemGubunContainer['NAME'],
              items: controller.itemGubunContainerList.map((value) {
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
                controller.itemGubunContainerList.map((e) {
                  if(e['NAME'] == value) {
                    controller.selectedItemGubunContainer['CODE'] = e['CODE'];
                    controller.selectedItemGubunContainer['NAME'] = e['NAME'];
                  }
                }).toList();
              }),
        ),
      ],
    );
  }

  Widget _dropDownItem3() {
    return Row(
      children: [
        Text('실사일', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
        SizedBox(width: 8,),
        Container(
          height: 40,
          width: 300,
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
              value: controller.selectedDateContainer['NAME'],
              items: controller.dateContainerList.map((value) {
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
                controller.dateContainerList.map((e) {
                  if(e['NAME'] == value) {
                    controller.selectedDateContainer['CODE'] = e['CODE'];
                    controller.selectedDateContainer['NAME'] = e['NAME'];
                  }
                }).toList();
              }),
        ),
      ],
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
              /// 그리드에서 변경된 값 그대로 업데이트
              if (event.column.field == 'chgCfRmk') {
                print('선택한 값: ${event.value}');
                controller.inventoryCntList[event.rowIdx].addAll({'chgCfRmk': event.value});
              }
              if (event.column.field == 'chgCfFlag') {
                print('선택한 값: ${event.value}');
                controller.inventoryCntList[event.rowIdx].addAll({'chgCfFlag': event.value});
              }
            },
            onRowChecked: (event) {
              if (event.isChecked != null) {
                if(event.isAll == true) {
                  if (event.isChecked == true) {
                    for(var i = 0; i < controller.checkList.length; i++) {
                      controller.checkList[i] = true;
                    }
                    Get.log('이거 봐야함1 true ${controller.checkList.value}');
                  }else{
                    for(var i = 0; i < controller.checkList.length; i++) {
                      controller.checkList[i] = false;
                    }
                    Get.log('이거 봐야함1 false ${controller.checkList.value}');
                  }


                }else {
                  if (event.isChecked == true) {
                    controller.checkList[event.rowIdx!] = true;
                    // controller.selectedCancelList.add(event.row!.cells.entries);
                    Get.log('이거 봐야함2 ${controller.checkList.value}');
                  } else {
                    controller.checkList[event.rowIdx!] = false;
                    //  controller.selectedCancelList.remove(event.rowIdx);
                    Get.log('이거 봐야함3 ${controller.checkList.value}');
                  }
                }
              }

            },
            onSelected: (c) {
              Get.log('클릭!!!!!!!!!!!!');

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
        title: '',
        field: 'checkBox',
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
        title: '번호',
        field: 'no',
        type: PlutoColumnType.text(),
        width: 100,
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
        title: '자재분류',
        field: 'itemType',
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
        title: '자재코드',
        field: 'itemCd',
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
        title: '자재명',
        field: 'itemNm',
        type: PlutoColumnType.text(),
        width: 280,
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
        title: 'LOT번호',
        field: 'lotNo',
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
        title: '위치',
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
        title: '수량',
        field: 'qty',
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
        title: '개당단위수량',
        field: 'delOrdUsrNm',
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
        title: '총수량',
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
        title: '실사위치',
        field: 'delPreDt',
        type: PlutoColumnType.text(),
        width: 120,
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
        title: '실사수량',
        field: 'bcStatusNm',
        type: PlutoColumnType.text(),
        width: 120,
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
        title: '실사 개당단위수량',
        field: 'kcStatusNm',
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
        title: '총수량',
        field: 'totalQty',
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
        title: '단위',
        field: 'qtyUnit',
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
        title: '바코드',
        field: 'barCode',
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
          width:  MediaQuery.of(context).size.width - 300 ,
          padding: EdgeInsets.only(left: 24, ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _dropDownItem(),
                SizedBox(width: 12,),
                _dropDownItem2(),
                SizedBox(width: 12,),
                _dropDownItem3(),

              ],
            ),
          ),
        ),
        Row(
          children: [
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
                  controller.isFocus.value = true;
                  controller.focusNode.unfocus();
                  // await controller.checkQR();

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
                  Get.log('저장 클릭!');

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
            SizedBox(width: 6,)
          ],
        )

      ],
    );
  }

  Widget _alertDialog(BuildContext context) {
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
                    '행 추가',
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
          ],
        ),
        content: _alertBody(context),

        /// 내부 메인body

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
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)))),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                      onPressed: () async {
                        controller.addRowList.add({
                          'itemCd': '',
                          'itemNm': '',
                        });
                        controller.inventoryCntList.add(controller.addRowList[0]);
                        // List<dynamic> withLeadingZero = controller.smallBoxSaveList.where((item) => item['no'].toString().startsWith('0')).toList();
                        // controller.addRowList[0].addAll({'no': '0${withLeadingZero.length + 1}'});
                        controller.addRowList[0].addAll({'no': '${controller.inventoryCntList.length + 1}'});
                        controller.insertRow.value = List<PlutoRow>.generate(
                            controller.addRowList.length,
                                (index) => PlutoRow(
                                cells: Map.from((controller.addRowList[index]).map((key, value) {
                                  {
                                    return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                                  }
                                }))));
                        controller.gridStateMgr.insertRows(controller.inventoryCntList.length, controller.insertRow);
                        Get.dialog(CommonDialogWidget(
                          contentText: '추가되었습니다',
                          pageFlag: 10,
                        ));
                        controller.itemCdController.text = '';
                        controller.lotNoController.text = '';
                        controller.countLocController.text = '';
                        controller.countQtyController.text = '';
                        controller.countSetQtyController.text = '';
                        controller.qtyUnitController.text = '';
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
                          child: Text('저장', style: AppTheme.titleHeadline.copyWith(color: AppTheme.white, fontSize: 17)),
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
                        controller.isFocus.value = false;
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
          )
        ]);
  }

  Widget _alertBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
        width: 350,
        height: 360,
        child: Column(
          children: [
            SizedBox(height: 12,),
            _alertInput('자재코드', context),
            _alertInput('LOT번호', context),
            _alertInput('실사 위치', context),
            _alertInput('실사 수량', context),
            _alertInput('실사 개당단위수량', context),
            _alertInput('단위', context),
          ],
        ),
      ),
    );
  }

  Widget _alertInput(String title, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 180,
            child: Text(
              title,
              style: AppTheme.a24700.copyWith(color: AppTheme.black),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Container(
              width: 200,
              height: 50,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 6),
                decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10), color: AppTheme.white),
                child: TextFormField(
                  expands :true,
                  minLines: null,
                  maxLines: null,
                    autofocus: true,
                  style: AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                  controller: title == '자재코드'
                      ? controller.itemCdController
                      : title == 'LOT번호'
                      ? controller.lotNoController
                      : title == '실사 위치'
                      ? controller.countLocController
                      : title == '실사 수량'
                      ? controller.countQtyController
                      : title == '실사 개당단위수량'
                      ? controller.countSetQtyController
                      : controller.qtyUnitController,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    fillColor: AppTheme.white,
                    filled: true,
                    // hintText: 'BC 번호를 입력해주세요',
                    hintStyle: AppTheme.a16400.copyWith(color: AppTheme.aBCBCBC),
                    border: InputBorder.none,
                  ),
                  showCursor: true,
                ),
              ),
            ),
          ),
          title == '자재코드' ?
          Container(
            padding: EdgeInsets.only(left: 12),
            child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _alertDialog2(context);
                        },
                      );
                    },
                    child: const Icon(Icons.list_alt_outlined,size: 50, color: AppTheme.black,)

            ),
          ) : Container()
        ],
      ),
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
                    '자재 선택',
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
          ],
        ),
        content: _alertBody2(context),

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
            width: 600,
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

  Widget _alertBody2(BuildContext context) {
    return BottomSheetModal();
  }




}
