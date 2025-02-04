import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

class MainKitNewPage extends StatelessWidget {
  MainKitNewPage({super.key});

  MainKitController controller = Get.find();
  final focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    controller.isFocus.value == false ? controller.requestFocus() : null;
    final double height = 60 * (double.parse((controller.rows.isEmpty ? 1 : controller.rows.length).toString()));

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
                slivers: [CommonAppbarWidget(title: '메인 박스 KIT 작업', isLogo: false, isFirstPage: true), _main(context), Obx(() => _grid(context))],
              ),
              //  Obx(() => CommonLoading(bLoading: controller.isLoading.value))
            ],
          ),
        ),
        //  bottomNavigationBar: _bottomButton(context), // 점검의뢰 등록
      ),
    );
  }

  Widget _grid(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 300, //controller.gridHeight.value,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: PlutoGrid(
              columns: gridCols(context),
              rows: controller.rows.value,
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                controller.stateManager = event.stateManager;
                controller.stateManager.rowColorCallback;
              },
              rowColorCallback: (c) {
                //  row.cells['no']

                // 특정 조건에 해당하는 row의 색을 바꾸기
                Get.log('no::::: ${controller.no.value}');
                if (controller.isSaveColor.value) {
                  for (var i = 0; i < controller.noList2.length; i++) {
                    // controller.changedRows.value.add(controller.noList[i]);
                    controller.changedRows2.value.add(controller.noList2[i]);
                  }
                  if (controller.changedRows2.contains('${c.row.cells['no']?.value.toString()}${c.row.cells['itemCd']?.value.toString()}')) {
                    return Colors.white; // 이미 변경된 색상 유지
                  } else {
                    return AppTheme.red_red_200;
                  }
                } else {
                  /*for(var i = 0; i < controller.smallBoxList.length; i++) {
                    if(controller.smallBoxList[i]['no'].toString() == (controller.no.value + 1).toString() && controller.isColor.value) {
                      controller.changedRows.value.add(c.rowIdx); // 색상이 변경된 행을 RxSet에 추가
                      return Colors.white; // 조건에 맞는 경우에만 색 변경
                    }
                  }*/
                  if (controller.isColor.value) {
                    for (var i = 0; i < controller.noList3.length; i++) {
                      // controller.changedRows.value.add(controller.noList[i]);
                      controller.changedRows.value.add(controller.noList3[i]);
                      /*   if (controller.changedRows.contains(controller.uniqueSmallBoxList[0]['itemCd'])) {
                        return Colors.white; // 이미 변경된 색상 유지
                      }*/
                    }
                    if (controller.changedRows.contains('${c.row.cells['no']?.value.toString()}${c.row.cells['itemCd']?.value.toString()}')) {
                      return Colors.white; // 이미 변경된 색상 유지
                    } else {
                      return AppTheme.red_red_200;
                    }
                  }
                }

                Get.log('색깔: ${controller.changedRows}');
                Get.log('색깔 여부: ${controller.isColor.value}');
                return AppTheme.red_red_200; // 기본 색상으로 유지
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print('event::: $event');
                if (event.column.field == 'itemNmNonKit') {
                  print('선택한 값: ${event.value}');
                }
              },
              configuration: PlutoGridConfiguration(
                style: PlutoGridStyleConfig(
                  defaultCellPadding: EdgeInsets.all(0),
                  columnTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                  columnHeight: 60,
                  rowHeight: 50,
                  cellTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                  //  rowColor: AppTheme.red_red_300 //조회해서 같은 값이 들어가있으면 회색 아니면 빨강
                ),
              ),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 300, //controller.gridHeight.value,
            width: MediaQuery.of(context).size.width / 2 - 20,
            child: PlutoGrid(
              //  mode: PlutoGridMode.select, // 탭 한번으로 반응하게?
              columns: gridCols2(context),
              rows: controller.rows2.value,
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                controller.stateManager2 = event.stateManager;
                // stateManager.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
                print('$event aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                // Get.log('그리드 변겸됐다');
                List<dynamic> sortedRows = List.from(controller.smallBoxSaveList);
                controller.no.value = 990;
                // 원하는 기준으로 정렬 (예: 'no' 컬럼 기준 오름차순)
                sortedRows.sort((a, b) {
                  int noA = int.parse(a['no'].toString() ?? '0');
                  int noB = int.parse(b['no'].toString() ?? '0');
                  return noA.compareTo(noB); // 오름차순 정렬
                });
                controller.smallBoxSaveList.value = sortedRows;
                if (event.column.field == 'ncbxRmkName') {
                  print('선택한 값: ${event.value}');
                  // NAME 값이 event.value와 같은 항목의 CODE를 가져옴
                  final code = controller.reasonDropdownList.firstWhere((item) => item['NAME'] == event.value, orElse: () => {'CODE': ''})['CODE'];
                  controller.smallBoxSaveList[event.rowIdx].addAll({'ncbxRmk': code.toString()});
                  for(var i = 0; i < controller.smallBoxSaveList.length; i++){
                    if(controller.smallBoxSaveList[event.rowIdx]['sboxNo'] == controller.smallBoxSaveList[i]['sboxNo']) {
                      controller.smallBoxSaveList[i].addAll({'ncbxRmk': code.toString()});
                      Get.log('바꼈는지 확인!!!! ${controller.smallBoxSaveList[i]['ncbxRmk']}');
                      Get.log('바꼈는지 확인!!!! ${controller.smallBoxSaveList[i]['itemCd']}');
                    }
                  }
                //  controller.smallBoxSaveList[event.rowIdx]['ncbxRmk'] = code.toString();

                }
              },
              rowColorCallback: (c) {
                for (var i = 0; i < controller.rightNoList.length; i++) {
                  // controller.changedRows.value.add(controller.noList[i]);
                  controller.rightChangedRows.value.add(controller.rightNoList[i]);
                  /*   if (controller.changedRows.contains(controller.uniqueSmallBoxList[0]['itemCd'])) {
                        return Colors.white; // 이미 변경된 색상 유지
                      }*/
                }
                if (controller.rightChangedRows.contains('${c.row.cells['no']?.value.toString()}${c.row.cells['itemCd']?.value.toString()}')) {
                  return AppTheme.red_red_200; // 이미 변경된 색상 유지
                } else {
                  return AppTheme.white;
                }
              },
              configuration: PlutoGridConfiguration(
                style: PlutoGridStyleConfig(
                  columnTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                  columnHeight: 60,
                  rowHeight: 50,
                  cellTextStyle: AppTheme.a14700.copyWith(color: AppTheme.black),
                ),
              ),
              // configuration: const PlutoGridConfiguration(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _main(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    double containerWidth = orientation == Orientation.portrait ? 350.0 : 730.0;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: AppTheme.black))),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Text(
                                'QR 코드',
                                style: AppTheme.a24700.copyWith(color: AppTheme.black),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              width: 130,
                              height: 50,
                              child: Container(
                                padding: const EdgeInsets.only(left: 16, right: 6),
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

                                        // 엔터 키 감지
                                        controller.isFocus.value = false;
                                        await controller.checkBoxData();
                                        if(controller.smallBoxDataList.isNotEmpty) {
                                          if(controller.tagType.value == '20') {
                                            await controller.checkBoxItemData();
                                            for (var i = 0; i < controller.smallBoxDataList.length; i++) {
                                              controller.smallBoxDataList[i].addAll({'no': '${i + 1}'});
                                            }
                                          }else {
                                            ///확정했으면 여기서 qr 스캔 못하게 걸러준다?

                                            if(controller.smallBoxItemDataList.isNotEmpty) {
                                              if(controller.smallBoxDataList.length > 1) {
                                                await controller.reqCommon3();
                                                for(var i = 0; i < controller.popUpDataList.length; i++) {
                                                  if(controller.popUpDataList[i]['wrkYn'] == 'Y') {
                                                    controller.isCancelOk.value = true;
                                                  }
                                                }
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: context, //context
                                                  builder: (BuildContext context) {
                                                    return _dupAlertDialog(context);
                                                  },
                                                );
                                              }else {
                                                /// 구성자재 스캔 시작
                                                await controller.registMainKitQr();
                                              }

                                            }else {
                                              Get.dialog(CommonDialogWidget(contentText: '메인박스를 먼저 스캔해주세요', pageFlag: 0));
                                            }
                                          }
                                        }

                                       // controller.plutoRowNew();
                                        controller.textQrController.text = '';

                                        await controller.test();
                                        controller.focusNode.requestFocus();

                                      }
                                    }
                                  },
                                  child: TextFormField(
                                    minLines: null,
                                    expands: true,
                                    maxLines: null,
                                    focusNode: controller.focusNode,
                                    style: AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                                    controller: controller.textQrController,
                                    textAlignVertical: TextAlignVertical.center,
                                    textInputAction: TextInputAction.done,
                                    onTap: () {
                                      /*if (controller.focusCnt.value++ > 1)
                                        controller.focusCnt.value = 0;
                                      else
                                        Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                                    },
                                    onTapOutside: (event) => {controller.focusCnt.value = 0},
                                    onFieldSubmitted: (value) async {
                                     /* controller.isFocus.value = false;
                                      await controller.checkBoxData();
                                      if(controller.tagType.value == '20') {
                                          await controller.checkBoxItemData();
                                          for (var i = 0; i < controller.smallBoxDataList.length; i++) {
                                            controller.smallBoxDataList[i].addAll({'no': '${i + 1}'});
                                          }
                                      }else {
                                        if(controller.smallBoxItemDataList.isNotEmpty) {
                                          /// 구성자재 스캔 시작
                                           await controller.registMainKitQr();
                                        }else {
                                          Get.dialog(CommonDialogWidget(contentText: '메인박스를 먼저 스캔해주세요', pageFlag: 0));
                                        }
                                      }
                                      controller.textQrController.text = '';

                                      await controller.test();
                                      controller.focusNode.requestFocus();
                                      Future.delayed(const Duration(), () {
                                        controller.focusNode.requestFocus();
                                        Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                      });*/
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
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        Obx(
                              () => _subData('상태'),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: containerWidth,
                          //  width: MediaQuery.of(context).size.width/2 - 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // _button('리스트 출력'),
                                _button('행 추가', context),
                                _button('저장', context),
                                _button('동기화', context),
                                _button('동기화 취소', context),
                                _button('확정', context),
                                _button('확정 취소', context),
                                //  _button('확정리스트 출력'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  color: AppTheme.dark_text_secondary,
                  height: 1,
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(
                      () => Container(
                    width: MediaQuery.of(context).size.width - 10,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _subData2('제조번호', controller.wrkNo.value == null ? controller.wrkNo.value : controller.wrkNo.value, true),
                          SizedBox(
                            width: 32,
                          ),
                          _subData2('프로젝트명', controller.projectNm.value == null ? controller.projectNm.value : controller.projectNm.value, true),
                          SizedBox( 
                            width: 32,
                          ),
                          _subData2('자재코드/자재명', controller.itemCdNm.value.trim(), true),
                          SizedBox(
                            width: 32,
                          ),
                          _subData2('박스번호', controller.boxNo.value, false),
                          SizedBox(
                            width: 32,
                          ),
                          _subData2('확정일', controller.wrkCfmDt.value == 'null' ? '' : controller.wrkCfmDt.value, false),
                          SizedBox(
                            width: 32,
                          ),
                          _subData2('BOM 점검', controller.bcSts.value == 'null' ? '' : controller.bcSts.value, false)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  color: AppTheme.dark_text_secondary,
                  height: 1,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _subDataMemo('메모'),
                        SizedBox(width: 12,),
                        _subDataWeight(),
                        SizedBox(width: 12,),
                        _subDataWeight2(),

                      ],
                    ),
                    Row(
                      children: [
                       /* Container(
                          margin: EdgeInsets.only(right: 12),
                          width: 120,
                          height: 56,
                          child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)))),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                            onPressed: () async {
                              Get.log('조회 클릭!');

                            },
                            child: Container(
                              decoration: BoxDecoration(color: AppTheme.navy_navy_800, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppTheme.ae2e2e2)),
                              width: 120,
                              height: 56,
                              padding: const EdgeInsets.only(),
                              child: Center(
                                child: Text('BOM변경적용', //입고취소 조회
                                    style: AppTheme.a15700.copyWith(
                                      color: AppTheme.white,
                                    )),
                              ),
                            ),
                          ),
                        ),*/
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          width: 120,
                          height: 56,
                          child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)))),
                                padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                            onPressed: () async {
                              Get.log('BOM변경확인 클릭!');
                              if(controller.smallBoxItemDataList.isNotEmpty) {
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
                              }

                            },
                            child: Container(
                              decoration: BoxDecoration(color: AppTheme.navy_navy_800, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppTheme.ae2e2e2)),
                              width: 120,
                              height: 56,
                              padding: const EdgeInsets.only(),
                              child: Center(
                                child: Text('BOM변경확인', //입고취소 조회
                                    style: AppTheme.a15700.copyWith(
                                      color: AppTheme.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                              () => Container(
                            margin: EdgeInsets.only(right: 14),
                            decoration:
                            BoxDecoration(color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6), borderRadius: BorderRadius.circular(8)),
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                /*SizedBox(height: 8,),
                Row(
                  children: [
                    _subDataWeight(),
                    SizedBox(width: 8,),
                    _subDataWeight2(),
                  ],
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> aa1() async {
    if (controller.duplicationQr.value == false) {
      if (controller.smallBoxSave.isNotEmpty) {
        for (var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
          if (controller.uniqueSmallBoxList[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
            controller.no.value = i;
          }
        }
        // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시
        if (controller.duplicationQr2.value &&
            int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString()) > int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())) {
          controller.isColor.value = false;
          controller.smallBoxSave[0].addAll({'scanYn': 'Y'});
          controller.smallBoxSave[0].addAll({'scanNo': controller.textQrController.text});
          controller.smallBoxSave[0].addAll({'syncYn': 'N'});
          controller.smallBoxSave[0].addAll({'ncbxRmk': ''});
          controller.smallBoxSave[0].addAll({'syncYn': 'N'});
          controller.smallBoxSave[0].addAll({'cbxMaNo': '${controller.uniqueSmallBoxList[controller.no.value]['cbxMaNo']}'});
          controller.smallBoxSave[0].addAll({'cbxMaSeq': '${controller.uniqueSmallBoxList[controller.no.value]['cbxMaSeq']}'});
          controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.uniqueSmallBoxList[controller.no.value]['cbxSuNo']}'});
          controller.smallBoxSave[0].addAll({'scanSeq': '${controller.uniqueSmallBoxList[controller.no.value]['scanSeq']}'});
          controller.smallBoxSave[0].addAll({'itemCd': '${controller.uniqueSmallBoxList[controller.no.value]['itemCd']}'});
          controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.uniqueSmallBoxList[controller.no.value]['setCbxQty']}'});
          controller.smallBoxSave[0].addAll({'cbxQty': '${controller.uniqueSmallBoxList[controller.no.value]['cbxQty']}'});
          controller.smallBoxSave[0].addAll({'setQty': '${controller.uniqueSmallBoxList[controller.no.value]['setQty']}'});
          controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.uniqueSmallBoxList[controller.no.value]['qtyUnit']}'});
          controller.smallBoxSave[0].addAll({'wrkQtySync': null});
          controller.smallBoxSave[0]['extrVal'] = 'D';
          controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
          if (int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString()) <=
              int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString()) + controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']) {
            controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
            controller.isSaveColor.value = true;
            controller.noList2.add(controller.uniqueSmallBoxList[controller.no.value]['itemCd'].toString());
            controller.test();
          } else {
            controller.isSaveColor.value = false;
            controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] =
                (controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] + controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt();
          }

          controller.rows2.value = List<PlutoRow>.generate(
              controller.smallBoxSaveList.length,
                  (index) => PlutoRow(
                  cells: Map.from((controller.smallBoxSaveList[index]).map(
                        (key, value) => MapEntry(key, PlutoCell(value: value == null ? '' : value)),
                  ))));
          controller.textQrController.text = '';
          controller.stateManager2.removeAllRows();
          controller.stateManager2.appendRows(controller.rows2);
          controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] == controller.rows[controller.no.value].cells['cbxQty']?.value ? controller.isColor.value = true : null;
        } else if (controller.duplicationQr2.value && controller.rows[controller.no.value].cells['cbxQty']?.value == controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty']) {
          Get.log('아무것도 하지마');
        } else {
          for (var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
            if (controller.uniqueSmallBoxList[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
              controller.no.value = i;
              controller.smallBoxSave[0].addAll({'no': '${controller.uniqueSmallBoxList[i]['no']}'});
              controller.smallBoxSave[0].addAll({'scanYn': 'Y'});
              controller.smallBoxSave[0].addAll({'scanNo': controller.textQrController.text});
              controller.smallBoxSave[0].addAll({'syncYn': 'N'});
              controller.smallBoxSave[0].addAll({'cbxMaNo': '${controller.uniqueSmallBoxList[i]['cbxMaNo']}'});
              controller.smallBoxSave[0].addAll({'cbxMaSeq': '${controller.uniqueSmallBoxList[i]['cbxMaSeq']}'});
              controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.uniqueSmallBoxList[i]['cbxSuNo']}'});
              controller.smallBoxSave[0].addAll({'scanSeq': '${controller.uniqueSmallBoxList[i]['scanSeq']}'});
              controller.smallBoxSave[0].addAll({'itemCd': '${controller.uniqueSmallBoxList[i]['itemCd']}'});
              controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.uniqueSmallBoxList[i]['setCbxQty']}'});
              controller.smallBoxSave[0].addAll({'cbxQty': '${controller.uniqueSmallBoxList[i]['cbxQty']}'});
              controller.smallBoxSave[0].addAll({'setQty': '${controller.uniqueSmallBoxList[i]['setQty']}'});
              controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.uniqueSmallBoxList[i]['qtyUnit']}'});
              controller.smallBoxSave[0].addAll({'wrkQtySync': null});
            }
          }
          // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
          // 그보다 작을 경우에는 qty 값만큼 입력
          if (controller.rows[controller.no.value].cells['cbxQty']?.value <= (controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt()) {
            controller.smallBoxSave[0]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
            controller.isColor.value = true;
            await controller.test();
          } else {
            controller.smallBoxSave[0]['qty'] = (controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt();
            controller.smallBoxSave[0]['extrVal'] = 'D';

            /// 저장 시에 DETAIL에 넘겨줘야할 오브젝트 구분
            controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
          }
          controller.smallBoxSave[0]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
          controller.smallBoxSave[0]['ncbxRmkName'] = '';
          controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
          controller.smallBoxSaveList[controller.smallBoxSaveList.length - 1]['prtNo'] = 'X';
          Get.log('ㅁㄴㅇㅁㄴㅇㄴ: ${controller.smallBoxSave.length}');

          controller.insertRow.value = List<PlutoRow>.generate(
              controller.smallBoxSave.length,
                  (index) => PlutoRow(
                  cells: Map.from((controller.smallBoxSave[index]).map((key, value) {
                    {
                      return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                    }
                  }))));
          for (var i = 0; i < controller.insertRow.length; i++) {
            controller.insertRow[i].cells['itemNm']?.value = controller.insertRow[i].cells['itemNm']?.value.toString().trim();
            controller.insertRow[i].cells['qty']?.value = controller.insertRow[i].cells['qty']?.value.toInt();
            Get.log('구구: ${controller.insertRow[i].cells['setQty']?.value}');
          }
          await controller.test();
          Get.log('이거이거 ${controller.smallBoxSaveList}');
          controller.textQrController.text = '';

          controller.stateManager2.insertRows(controller.no.value, controller.insertRow.value);
          List<PlutoRow> sortedRows = List.from(controller.stateManager2.rows);
          controller.no.value = 990;
          // 원하는 기준으로 정렬 (예: 'no' 컬럼 기준 오름차순)
          sortedRows.sort((a, b) {
            int noA = int.parse(a.cells['no']?.value.toString() ?? '0');
            int noB = int.parse(b.cells['no']?.value.toString() ?? '0');
            return noA.compareTo(noB); // 오름차순 정렬
          });
          controller.stateManager2.removeAllRows();

          // 3. 정렬된 리스트로 다시 로드
          controller.stateManager2.appendRows(sortedRows);
        }
      }
    }
  }

  /// 구성자재 데이터 스캔
  Future<void> itemDataInsert() async {
    /// 메인은 자재코드를 소박스로 찍으니까 다르게 만들어줘야할듯? 그래서 aa2를 만들었다
    if (controller.duplicationQr.value == false && controller.duplicationQr3.value == false) {
      controller.isSaveColor.value = false;
      if (controller.smallBoxSave.isNotEmpty) {
        for (var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
          for (var ii = 0; ii < controller.smallBoxSave.length; ii++) {
            if (controller.uniqueSmallBoxList[i]['itemCd'].toString().trim() == controller.smallBoxSave[ii]['itemCd'].toString().trim()) {
              final name = controller.reasonDropdownList.firstWhere((item) => item['CODE'] == controller.uniqueSmallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
              controller.no.value = i;
              if (controller.smallBoxSave[ii]['qtyRes'] == null) {
                controller.smallBoxSave[ii].addAll({'qtyRes': 0});
              }
              // controller.smallBoxSave[ii]['qtyRes'] ?? 0;
              /// ************************** 로직 시작 ************************************************************************************
              ///
              // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시 --디테일 부분
              if (controller.duplicationQr2.value &&
                  int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString()) > int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())) {
                controller.isNewItem.value = false;
                controller.isColor.value = false;
                controller.smallBoxSave[ii].addAll({'scanYn': 'Y'});
                controller.smallBoxSave[ii].addAll({'scanNo': controller.textQrController.text});
                controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                controller.smallBoxSave[ii].addAll({'ncbxRmk': ''});
                controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                controller.smallBoxSave[ii].addAll({'cbxMaNo': '${controller.uniqueSmallBoxList[controller.no.value]['cbxMaNo']}'});
                controller.smallBoxSave[ii].addAll({'cbxMaSeq': ''});
                controller.smallBoxSave[ii].addAll({'cbxSuNo': ''});
                controller.smallBoxSave[ii].addAll({'scanSeq': '${controller.uniqueSmallBoxList[controller.no.value]['scanSeq']}'});
                controller.smallBoxSave[ii].addAll({'itemCd': '${controller.uniqueSmallBoxList[controller.no.value]['itemCd']}'});
                controller.smallBoxSave[ii].addAll({'setCbxQty': '${controller.uniqueSmallBoxList[controller.no.value]['setCbxQty']}'});
                controller.smallBoxSave[ii].addAll({'cbxQty': '${controller.uniqueSmallBoxList[controller.no.value]['cbxQty']}'});
                controller.smallBoxSave[ii].addAll({'setQty': '${controller.uniqueSmallBoxList[controller.no.value]['setQty']}'});
                controller.smallBoxSave[ii].addAll({'qtyUnit': '${controller.uniqueSmallBoxList[controller.no.value]['qtyUnit']}'});
                controller.smallBoxSave[ii].addAll({'boxNo': '${controller.uniqueSmallBoxList[controller.no.value]['boxNo']}'});
                controller.smallBoxSave[ii].addAll({'prtNo': 'X'});
                controller.smallBoxSave[ii].addAll({'ncbxRmkName': name.toString()});
                controller.smallBoxSave[ii].addAll({'wrkQtySync': null});
                controller.smallBoxSave[ii].addAll({'extrVal': 'D'});
                /* for (var a = 0; a < controller.smallBoxList.length; a++) {
                    if (controller.smallBoxSave[ii]['qrNo'].toString() ==
                        controller.smallBoxList[a]['testQr'].toString()
                        && controller.smallBoxSave[ii]['itemCd'].toString() ==
                            controller.smallBoxList[a]['itemCd'].toString()) {

                    }
                  }*/

                controller.smallBoxDetailList.add(controller.smallBoxSave[ii]);
                if (int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString()) <=
                    int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString()) + controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes']) {
                  controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
                  controller.smallBoxSave[0].addAll({'newQty': controller.rows[controller.no.value].cells['cbxQty']?.value});
                  controller.isSaveColor.value = false;
                  controller.isColor.value = true;

                  controller.noList3.add('${controller.uniqueSmallBoxList[i]['no']}${controller.uniqueSmallBoxList[i]['itemCd']}');
                  controller.test();
                } else {
                  controller.isSaveColor.value = false;
                  controller.isColor.value = false;
                  controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] =
                      (int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString()) + controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes'])
                          .toInt();
                  controller.smallBoxSave[0].addAll({'newQty':  (int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString()) + controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes'])
                      .toInt()});
                }

                controller.rows2.value = List<PlutoRow>.generate(
                    controller.smallBoxSaveList.length,
                        (index) => PlutoRow(
                        cells: Map.from((controller.smallBoxSaveList[index]).map(
                              (key, value) => MapEntry(key, PlutoCell(value: value == null ? '' : value)),
                        ))));
                controller.textQrController.text = '';
                controller.stateManager2.removeAllRows();
                controller.stateManager2.appendRows(controller.rows2);
                controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] == controller.rows[controller.no.value].cells['cbxQty']?.value ? controller.isColor.value = true : null;
                /*    }
                }*/
              } else if (controller.duplicationQr2.value && controller.rows[controller.no.value].cells['cbxQty']?.value == controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty']) {
                Get.log('아무것도 하지마');
              }
              // 새로 스캔하는 자재
              else {
                controller.isNewItem.value = true;
                for (var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
                  if (controller.uniqueSmallBoxList[i]['itemCd'] == controller.smallBoxSave[ii]['itemCd']) {
                    controller.no.value = i;
                    controller.smallBoxSave[ii].addAll({'no': '${controller.uniqueSmallBoxList[i]['no']}'});
                    controller.smallBoxSave[ii].addAll({'scanYn': 'Y'});
                    controller.smallBoxSave[ii].addAll({'scanNo': controller.textQrController.text});
                    controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                    controller.smallBoxSave[ii].addAll({'cbxMaNo': '${controller.uniqueSmallBoxList[i]['cbxMaNo']}'});
                    controller.smallBoxSave[ii].addAll({'cbxMaSeq': '${controller.uniqueSmallBoxList[i]['cbxMaSeq']}'});
                    controller.smallBoxSave[ii].addAll({'cbxSuNo': '${controller.uniqueSmallBoxList[i]['cbxSuNo']}'});
                    controller.smallBoxSave[ii].addAll({'scanSeq': '${controller.uniqueSmallBoxList[i]['scanSeq']}'});
                    controller.smallBoxSave[ii].addAll({'itemCd': '${controller.uniqueSmallBoxList[i]['itemCd']}'});
                    controller.smallBoxSave[ii].addAll({'setCbxQty': '${controller.uniqueSmallBoxList[i]['setCbxQty']}'});
                    controller.smallBoxSave[ii].addAll({'cbxQty': '${controller.uniqueSmallBoxList[i]['cbxQty']}'});
                    controller.smallBoxSave[ii].addAll({'setQty': '${controller.uniqueSmallBoxList[i]['setQty']}'});
                    controller.smallBoxSave[ii].addAll({'qtyUnit': '${controller.uniqueSmallBoxList[i]['qtyUnit']}'});
                    controller.smallBoxSave[ii].addAll({'boxNo': '${controller.uniqueSmallBoxList[controller.no.value]['cbxSuNo']}'});
                    controller.smallBoxSave[ii].addAll({'ncbxRmkName': name.toString()});
                    controller.smallBoxSave[ii].addAll({'wrkQtySync': null});
                    controller.smallBoxSave[ii].addAll({'prtNo': 'X'});
                  }
                }
                // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
                // 그보다 작을 경우에는 qty 값만큼 입력
                if (controller.rows[controller.no.value].cells['cbxQty']?.value <= (controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes']).toInt()) {
                  controller.smallBoxSave[ii]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
                  controller.isSaveColor.value = false;
                  controller.isColor.value = true;
                  controller.noList3.add('${controller.uniqueSmallBoxList[i]['no']}${controller.uniqueSmallBoxList[i]['itemCd']}');
                  controller.test();
                } else {
                  controller.smallBoxSave[ii]['qty'] = (controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes']).toInt();
                  controller.smallBoxSave[ii].addAll({'extrVal': 'D'});

                  /// 저장 시에 DETAIL에 넘겨줘야할 오브젝트 구분
                  //controller.smallBoxSave[ii]['ncbxRmkName'] = '';
                  controller.smallBoxDetailList.add(controller.smallBoxSave[ii]);
                }
                //  controller.smallBoxSave[ii]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
                // controller.smallBoxSave[ii]['ncbxRmkName'] = '';
                controller.smallBoxSaveList.add(controller.smallBoxSave[ii]);
                controller.smallBoxSaveList[controller.smallBoxSaveList.length - 1]['prtNo'] = 'X';
                Get.log('ㅁㄴㅇㅁㄴㅇㄴ: ${controller.smallBoxSave.length}');
              }
            }
          }
        }
      }
      if (controller.isNewItem.value) {
        controller.insertRow.value = List<PlutoRow>.generate(
            controller.smallBoxSave.length,
                (index) => PlutoRow(
                cells: Map.from((controller.smallBoxSave[index]).map((key, value) {
                  {
                    return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                  }
                }))));
        for (var i = 0; i < controller.insertRow.length; i++) {
          controller.insertRow[i].cells['itemNm']?.value = controller.insertRow[i].cells['itemNm']?.value.toString().trim();
          controller.insertRow[i].cells['qty']?.value = controller.insertRow[i].cells['qty']?.value.toInt();
          Get.log('구구: ${controller.insertRow[i].cells['setQty']?.value}');
        }
        controller.stateManager2.insertRows(controller.no.value, controller.insertRow.value);
      }

      await controller.test();
      Get.log('이거이거 ${controller.smallBoxSaveList}');
      controller.textQrController.text = '';

      List<PlutoRow> sortedRows = List.from(controller.stateManager2.rows);
      controller.no.value = 990;
      // 원하는 기준으로 정렬 (예: 'no' 컬럼 기준 오름차순)
      sortedRows.sort((a, b) {
        int noA = int.parse(a.cells['no']?.value.toString() ?? '0');
        int noB = int.parse(b.cells['no']?.value.toString() ?? '0');
        return noA.compareTo(noB); // 오름차순 정렬
      });
      controller.stateManager2.removeAllRows();

      // 3. 정렬된 리스트로 다시 로드
      controller.stateManager2.appendRows(sortedRows);

      /// 여기 끝나면 저장 처리해야한다
      /// 디테일 저장
      if (controller.smallBoxSave[0]['extrVal'] == 'D') {
        await controller.registNewDetailSave();
      }

      /// 일반 저장
      else {
        await controller.registNewSave();
      }
    } else {
      controller.textQrController.text = '';
    }
  }

  Widget _subData(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            title,
            style: AppTheme.a24700.copyWith(color: AppTheme.black),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
            constraints: BoxConstraints(
              minWidth: 200.0, // 최소 너비 설정
            ),
            height: 50,
            width: title == '메모' ? 400 : null,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10)),
            child: Text(
              title == '메모' ? controller.textMemoController.text : controller.statusText.value,
              style: AppTheme.a20700.copyWith(color: AppTheme.dk_red),
            )),
      ],
    );
  }

  Widget _subDataMemo(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            title,
            style: AppTheme.a24700.copyWith(color: AppTheme.black),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          width: 400,
          height: 50,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            //  focusNode: controller.focusNode,
            expands: true,
            minLines: null,
            maxLines: null,
            style: AppTheme.a24400.copyWith(color: AppTheme.a6c6c6c),
            // maxLines: 5,
            controller: controller.textMemoController,
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
            },
            // onChanged: ((value) => controller.submitSearch(value)),
          ),
        ),
      ],
    );
  }

  Widget _subDataWeight() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '무게(Net)',
            style: AppTheme.a24700.copyWith(color: AppTheme.black),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          width: 90,
          height: 50,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            //  focusNode: controller.focusNode,
            expands: true,
            minLines: null,
            maxLines: null,
            style: AppTheme.a24400.copyWith(color: AppTheme.a6c6c6c),
            // maxLines: 5,
            controller: controller.textWeightController,
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
            },
            // onChanged: ((value) => controller.submitSearch(value)),
          ),
        ),
      ],
    );
  }

  Widget _subDataWeight2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '무게(Gross)',
            style: AppTheme.a24700.copyWith(color: AppTheme.black),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          width: 90,
          height: 50,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            //  focusNode: controller.focusNode,
            expands: true,
            minLines: null,
            maxLines: null,
            style: AppTheme.a24400.copyWith(color: AppTheme.a6c6c6c),
            // maxLines: 5,
            controller: controller.textWeightController2,
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
            },
            // onChanged: ((value) => controller.submitSearch(value)),
          ),
        ),
      ],
    );
  }

  Widget _subData2(String title, String content, bool isLong) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            title,
            style: AppTheme.a24700.copyWith(color: AppTheme.black),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
            padding: const EdgeInsets.all(4),
            child: Text(
              content,
              style: AppTheme.a24400.copyWith(color: AppTheme.light_ui_08),
            )),
      ],
    );
  }

  Widget _button(String text, BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.only(left: 12),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              // backgroundColor: MaterialStateProperty.all<Color>(AppTheme.a1f1f1f) ,
              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.dongkuk_blue),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
          onPressed: () async {
            if (text == '행 추가') {
              controller.isFocus.value = true;
              controller.smallBoxItemDataList.isNotEmpty
                  ?
              controller.wrkCfmDt.value == '' || controller.wrkCfmDt.value == 'null'?
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog(context);
                },
              ) : Get.dialog(CommonDialogWidget(contentText: '확정된 박스입니다.', pageFlag: 0))
                  : Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요', pageFlag: 0));
            } else if (text == '동기화') {
              if(controller.projectNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요.', pageFlag: 0));
                return;
              }
              controller.smallBoxDataList[0]['wrkCfmYn'] != 'Y' ? syncProcess() : Get.dialog(CommonDialogWidget(contentText: '확정 처리된 상태입니다.', pageFlag: 0));
            } else if (text == '저장') {
              if(controller.projectNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요.', pageFlag: 0));
                return;
              }
              if(controller.wrkCfmDt.value == '' || controller.wrkCfmDt.value == 'null') {
                if (controller.isSaveClick.value == false) {
                  controller.isSaveClick.value = true;
                  Get.log('저장할 리스트!: ${controller.smallBoxSaveList.length}');
                  await controller.registMainKitMemoSave();

                  controller.isSave.value
                      ? Get.dialog(CommonDialogWidget(contentText: '저장되었습니다.', pageFlag: 0))
                      : Get.dialog(CommonDialogWidget(contentText: '${controller.isSaveText.value}.', pageFlag: 0));
                } 
              }else {
                Get.dialog(CommonDialogWidget(contentText: '확정된 박스입니다.', pageFlag: 0));
              }
              controller.isSaveClick.value = true;
            } else if (text == '동기화 취소') {
              if(controller.projectNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요.', pageFlag: 0));
                return;
              }
              Get.log('동기화 취소');
              Get.log('동기화 취소1: ${controller.smallBoxSaveList.length}');

              if (controller.smallBoxDataList[0]['wrkCfmYn'] != 'Y') {
                controller.isColor.value = false;
                controller.isSaveColor.value = true;
                controller.changedRows2.clear();
                controller.isDonggi.value = false;

                controller.smallBoxSaveList.removeWhere((item) {
                  bool shouldRemove = false;

                  if (item['prtNo'].toString() == 'O') {
                    if(item['ncbxRmk'] == '') {
                    if (item['savedWrkQty'] == null) {
                      controller.noList2.remove('${item['no']}${item['itemCd']}');
                      controller.test();
                      controller.stateManager.rowColorCallback!;
                      shouldRemove = true;
                      controller.test();
                    } else {
                      int index = controller.smallBoxItemDataList.indexWhere((element) => element['no'] == item['no']);
                      controller.smallBoxSaveList[index].addAll({'qty': '${controller.smallBoxSaveList[index]['savedWrkQty']}'});
                      controller.smallBoxSaveList[index].addAll({'prtNo': 'X'});
                      controller.smallBoxSaveList[index].addAll({'syncYn': 'N'});
                      Get.log('qty::: ${controller.smallBoxSaveList[index]['qty']}');
                      controller.noList2.remove('${item['no']}${item['itemCd']}');
                      shouldRemove = false;
                      controller.test();
                    }
                  } else if(item['ncbxRmk'] != '') {
                      Get.log('동기화취소 안돼!');
                      item.addAll({'ncbxRmk':''});

                    }
                  }
                  return shouldRemove;
                });
                await controller.test();

                controller.rows2.value = List<PlutoRow>.generate(
                    controller.smallBoxSaveList.length,
                        (index) => PlutoRow(
                        cells: Map.from((controller.smallBoxSaveList[index]).map(
                              (key, value) => MapEntry(key, PlutoCell(value: value == null ? '' : value)),
                        ))));
                controller.stateManager2.removeAllRows();
                controller.stateManager2.appendRows(controller.rows2.value);
              } else {
                Get.dialog(CommonDialogWidget(contentText: '확정 처리된 상태입니다.', pageFlag: 0));
              }

            }else if (text == '동기화 저장') {
              if(controller.projectNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요.', pageFlag: 0));
                return;
              }
              var uniqueItems = controller.smallBoxSaveList.fold<Map<String, dynamic>>({}, (map, item) {
                map[item['sboxNo']] = item; // 'sboxNo'를 기준으로 가장 마지막 항목을 유지
                return map;
              });
              for(var i = 0; i < uniqueItems.length; i++) {
                if(uniqueItems[i]['prtNo'] == 'O') {
                  if(uniqueItems[i]['ncbxRmk'] != '' && uniqueItems[i]['ncbxRmk'] != null) {
                    controller.sboxNoDonggihwa.value = uniqueItems[i]['sboxNo'].toString();
                    controller.ncbxRmkDonggihwa.value = uniqueItems[i]['ncbxRmk'].toString();

                    // 동기화한 소박스 저장처리!!!!!!!
                    await controller.registMainKitDonggihwa();

                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '사유가 입력되지않은 소박스가 있습니다.', pageFlag: 0));
                    break;
                   // controller.isDonggihwaSaveOk.value = false;
                  }
                }
              }
            }

            else if (text == '확정') {
              if(controller.projectNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요.', pageFlag: 0));
                return;
              }
              if (controller.isConfirmClick.value == false) {
                controller.isConfirmClick.value = true;
                try {
                  for(var i = 0; i < controller.smallBoxSaveList.length; i++) {
                    if(controller.smallBoxSaveList[i]['prtNo'] == 'O' && controller.smallBoxSaveList[i]['test'] == 'test') {
                      if(controller.smallBoxSaveList[i]['ncbxRmk'] != '' && controller.smallBoxSaveList[i]['ncbxRmk'] != null) {
                        controller.sboxNoDonggihwa.value = controller.smallBoxSaveList[i]['sboxNo'].toString();
                        controller.ncbxRmkDonggihwa.value = controller.smallBoxSaveList[i]['ncbxRmk'].toString();

                        // 동기화한 소박스 저장처리!!!!!!!
                        await controller.registMainKitDonggihwa();
                        if(controller.isSuccsessDong.value == false) {
                          break;
                        }
                      }else {
                        Get.dialog(CommonDialogWidget(contentText: '사유가 입력되지않은 소박스가 있습니다.', pageFlag: 0));
                        break;
                        // controller.isDonggihwaSaveOk.value = false;
                      }
                    }
                  }
                  // 일단 잠시 주석처리
                //  await controller.registSmallKitConfirm('Y');
                  // 동기화 저장 성공했으면 확정 처리!!
                  if(controller.isSuccsessDong.value) {
                    await controller.registMainKitConfirmNew('Y');
                    if(controller.isConfirm.value) {
                      Get.dialog(CommonDialogWidget(contentText: '확정되었습니다.', pageFlag: 3));
                      await controller.checkBoxItemData();
                      for (var i = 0; i < controller.smallBoxDataList.length; i++) {
                        controller.smallBoxDataList[i].addAll({'no': '${i + 1}'});
                      }
                      controller.wrkCfmDt.value = DateFormat('yyyy-MM-dd').format(DateTime.now());

                    }else {
                      Get.dialog(CommonDialogWidget(contentText: controller.isConfirmText.value, pageFlag: 3));
                    }

                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '동기화 저장에 실패하였습니다.', pageFlag: 3,));
                  }
                } catch (e) {
                  Get.log('$e');
                } finally {
                  controller.focusNode.unfocus();
                }
              }
              controller.isConfirmClick.value = false;
            } else if (text == '확정 취소') {
              if(controller.projectNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요.', pageFlag: 0));
                return;
              }
              await controller.registMainKitConfirmNew('N');
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정 취소되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '${controller.isConfirmText.value}', pageFlag: 0));
              controller.focusNode.unfocus();
              controller.isConfirmClick.value = false;
              controller.wrkCfmDt.value = '';
            }
            /* text == '행 추가' ?
            {
              controller.isFocus.value = true,
              controller.smallBoxList.isNotEmpty ?
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog(context);
                },
              ) :  Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요', pageFlag: 0))
              */ /*controller.insertRow.value = List<PlutoRow>.generate(controller.ipgoQrList.length, (index) =>
            PlutoRow(cells:
            Map.from((controller.ipgoQrList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value ?? '' )),
            )))
            ),
            //  controller.rowDatas2.add(controller.insertRow[0]);
            controller.stateManager2.insertRows(controller.ipgoList.length, controller.insertRow)*/ /*
            }
                :
            text == '동기화' ?
            {
              syncProcess()
            }
                : text == '저장' ?
            {
              Get.log('저장할 리스트!: ${controller.smallBoxSaveList.length}'),
              await controller.registSmallKitSave(),
              await controller.registSmallKitDetailSave(),
              controller.isSave.value ?
              Get.dialog(CommonDialogWidget(contentText: '저장되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '${controller.isSaveText.value}.', pageFlag: 0)),
              //  await controller.registSmallKitDetailSave()
            }
                : text == '동기화 취소' ?
            {
              Get.log('동기화 취소'),
              Get.log('동기화 취소1: ${controller.smallBoxSaveList.length}'),
              */ /*controller.smallBoxSaveList.value = controller.smallBoxSaveList
                  .where((item) => !(item['remark'] == '' && item['prtNo'] == 'O'))
                  .toList(),*/ /*
              // smallBoxSaveList의 리스트에 changedRows에 {1,2} 가 있는데 smallBoxSaveList[1]이 존재하지않으면 ch


              controller.smallBoxSaveList.removeWhere((item) {
                bool shouldRemove = item['ncbxRmk'] == '' && item['prtNo'] == 'O';
                if (shouldRemove) {
                  int index = controller.smallBoxList.indexWhere((element) => element['no'] == item['no']);
                  controller.changedRows.remove(index);
                  controller.test();
                }else {
                  int index = controller.smallBoxList.indexWhere((element) => element['no'] == item['no']);
                  controller.smallBoxSaveList[index]['qty'] = controller.smallBoxSaveList[index]['wrkQtySync'];
                  Get.log('qty::: ${controller.smallBoxSaveList[index]['qty']}');
                }
                return shouldRemove;
              }),

              controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                  PlutoRow(cells:
                  Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                      MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                  )))
              ),
              controller.stateManager2.removeAllRows(),
              controller.stateManager2.appendRows(controller.rows2.value),

            }
                : text == '확정' ?
            {
              await controller.registSmallKitSave(),
              controller.isTotalSave.value == true ?
              await controller.registSmallKitDetailSave() : null,
              controller.isTotalDetailSave.value == true ?
              await controller.registSmallKitConfirm('Y') : null,
              controller.isConfirm.value ? await controller.registSmallKitSave() : null,
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '${controller.isConfirmText.value}.', pageFlag: 0)),
              controller.focusNode.unfocus()

            }
                : text == '확정 취소' ?
            {
              await controller.registSmallKitConfirm('N'),
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정 취소되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '취소되지않았습니다.', pageFlag: 0)),
              controller.focusNode.unfocus()
            }
                : null;*/
          },
          child: Container(
            height: 56,
            child: Center(
                child: Text(
                  text,
                  style: AppTheme.a15700.copyWith(
                    color: AppTheme.white,
                  ),
                )),
          )),
    );
  }

  void syncProcess() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
    );

    try {
      if (controller.isDonggi.value == false) {
        controller.isColor.value = false;
        controller.isSaveColor.value = true;
        for (var dong = 0; dong < controller.smallBoxItemDataList.length; dong++) {
         // Get.log('smallBoxSaveList: ${controller.smallBoxItemDataList}');
         // controller.noList2.add(controller.smallBoxItemDataList[dong]['itemCd']);
          controller.noList2.add('${controller.smallBoxItemDataList[dong]['no'].toString()}${controller.smallBoxItemDataList[dong]['itemCd'].toString()}');
          if (controller.smallBoxSaveList.isEmpty) {
            controller.noSync.value = true;
          }

          // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
          for (var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
            // 이미 오른쪽에 스캔된 자재가 있는데 수량이 작다면? -> 동기화 대상
            if (controller.smallBoxItemDataList[dong]['itemCd'] == controller.smallBoxSaveList[dong2]['itemCd']
                && controller.smallBoxItemDataList[dong]['no'] == controller.smallBoxSaveList[dong2]['no']) {
              controller.noSync.value = false;
              if (int.parse(controller.smallBoxItemDataList[dong]['cbxQty'].toString()) > int.parse(controller.smallBoxSaveList[dong2]['wrkQty'].toString())) {
                controller.smallBoxSaveList[dong2].addAll({'savedWrkQty': controller.smallBoxSaveList[dong2]['wrkQty']});
                controller.smallBoxSaveList[dong2].addAll({'ncbxRmk': ''});
                controller.smallBoxSaveList[dong2].addAll({'syncYn': 'Y'});
                controller.smallBoxSaveList[dong2].addAll({'prtNo': 'O'});
                controller.smallBoxSaveList[dong2].addAll({'ncbxRmkName': ''});
                controller.smallBoxSaveList[dong2].addAll({'wrkQty': controller.smallBoxItemDataList[dong]['cbxQty']});
                controller.smallBoxSaveList[dong2].addAll({'sboxNo': controller.smallBoxItemDataList[dong]['sboxNo']});
                for(var i = 0; i < controller.smallBoxSaveList.length; i++){
                  if(controller.smallBoxSaveList[dong2]['sboxNo'] == controller.smallBoxSaveList[i]['sboxNo']) {
                    controller.smallBoxSaveList[i].addAll({'prtNo': 'O'});
                    Get.log('바꼈는지 확인!!!! ${controller.smallBoxSaveList[i]['prtNo']}');
                    Get.log('바꼈는지 확인!!!! ${controller.smallBoxSaveList[i]['itemCd']}');
                  }
                }
                controller.noSync.value = false;
                break;
              } else {
                controller.noSync.value = false;
                break;
              }
            } else {
              controller.smallBoxSaveList[dong2].addAll({'savedWrkQty': null});
              controller.noSync.value = true;
            }
          }
          if (controller.noSync.value) {
            /// 수량은 부족해도 소박스 안에 자재가 여러개면 자재 단건으로 못찍기 때문에 상관없을듯 보인다
            /// 그냥 이대로 가도될듯? -> 소박스 단위로 prtNo 업데이트 안쳐도 될듯 보인다.
            controller.smallBoxItemDataList[dong].addAll({'wrkQtySync': 0});
            controller.smallBoxItemDataList[dong].addAll({'ncbxRmk': ''});
            controller.smallBoxItemDataList[dong].addAll({'syncYn': 'Y'});
            controller.smallBoxItemDataList[dong].addAll({'prtNo': 'O'});
            controller.smallBoxItemDataList[dong].addAll({'ncbxRmkName': ''});
            controller.smallBoxItemDataList[dong].addAll({'wrkQty': controller.smallBoxItemDataList[dong]['cbxQty']});
            controller.smallBoxItemDataList[dong].addAll({'sboxNo': controller.smallBoxItemDataList[dong]['sboxNo']});
            controller.smallBoxItemDataList[dong].addAll({'chkRst': ''});
            controller.smallBoxItemDataList[dong].addAll({'chkQty': ''});
            controller.smallBoxSaveList.add(controller.smallBoxItemDataList[dong]);

          }
        }
        for (var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
          if (controller.smallBoxSaveList[dong2]['prtNo'] == 'O') {
            //동기화가 O인 것만 드롭다운 버튼 활성화
            controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글
            controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
          }
        }
        // 'sboxNo' 기준으로 첫 번째 항목 중 prtNo가 'O'인 경우에만 처리
        var seenSboxNo = <String>{}; // 이미 처리한 sboxNo를 추적하기 위한 Set

        for (var i = 0; i < controller.smallBoxSaveList.length; i++) {
          var item = controller.smallBoxSaveList[i];

          // 'sboxNo'가 처음 등장하고, prtNo가 'O'인 경우
          if (!seenSboxNo.contains(item['sboxNo']) && item['prtNo'] == 'O') {
            controller.smallBoxSaveList[i].addAll({'test': 'test'}); // 'a' 추가
            controller.smallBoxSaveList[i].addAll({'ncbxRmkName': '선택하세요'});

            seenSboxNo.add(item['sboxNo']); // 해당 'sboxNo'를 처리된 목록에 추가
          }else {
            controller.smallBoxSaveList[i].addAll({'test': ''}); // 'a' 추가
          }
        }
        controller.no.value = 990;
        controller.rows2.value = List<PlutoRow>.generate(
            controller.smallBoxSaveList.length,
                (index) => PlutoRow(
                cells: Map.from((controller.smallBoxSaveList[index]).map((key, value) {
                  {
                    return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                  }
                }))));
        // 원하는 기준으로 정렬 (예: 'no' 컬럼 기준 오름차순)
        controller.rows2.value.sort((a, b) {
          int noA = int.parse(a.cells['no']?.value.toString() ?? '0');
          int noB = int.parse(b.cells['no']?.value.toString() ?? '0');
          return noA.compareTo(noB); // 오름차순 정렬
        });
        controller.stateManager2.removeAllRows();
        controller.stateManager2.appendRows(controller.rows2.value);
        await controller.test();
        Get.log('이거이거 ${controller.smallBoxSaveList}');

        Get.log('동기화 is: ${controller.isDropdownEnabled.value}');
        controller.isDonggi.value = true;
      }
    } catch (e) {
      Get.log('$e');
    } finally {
      // 로딩 다이얼로그 종료
      Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
    }
  }

  List<PlutoColumn> gridCols(BuildContext context) {
    final List<PlutoColumn> gridCols = <PlutoColumn>[
      PlutoColumn(
          enableSorting: true,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 90,
          title: '순번',
          field: 'no',
          type: PlutoColumnType.number(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 100,
          title: '자재코드',
          field: 'itemCd',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.left,
          width: 320,
          title: '자재명',
          field: 'itemNm',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 60,
          title: '수량',
          field: 'cbxQty',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 190,
          title: '소박스 번호',
          field: 'cbxSuNo',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 60,
          title: '세트',
          field: 'setQty',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 100,
          title: 'BOM수량',
          field: 'bomQty',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
    ];
    return gridCols;
  }

  List<PlutoColumn> gridCols2(BuildContext context) {
    final List<PlutoColumn> gridCols2 = <PlutoColumn>[
      PlutoColumn(
          enableSorting: true,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 90,
          title: '순번',
          field: 'no',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          width: 120,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          title: '자재코드',
          field: 'itemCd',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          width: 320,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.left,
          title: '자재명',
          field: 'itemNm',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                width: 60,
                // color: textColor,
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)));
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 60,
          title: '수량',
          field: 'wrkQty',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
        enableSorting: false,
        enableEditingMode: controller.isDropdownEnabled.value,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.center,
        width: 160,
        title: '사유',
        field: 'ncbxRmkName',
        type: PlutoColumnType.select(controller.reasonNames),
        checkReadOnly: (PlutoRow row, PlutoCell cell) {
          return !(row.cells['prtNo']!.value == 'O' && row.cells['test']!.value == 'test');
        },
        /*renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(2),
              width: 60,
              // color: textColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        rendererContext.cell.value.toString(),
                        style: AppTheme.a14500.copyWith(color: Colors.black)
                    ),
                    Icon(Icons.arrow_drop_down, size: 15,)
                  ],
              ),
            );
          }*/
      ),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 110,
          title: '동기화',
          field: 'prtNo',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 110,
          title: '소박스 번호',
          field: 'sboxNo',
          //tagNo?
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(rendererContext.cell.value.toString(), style: AppTheme.a14500.copyWith(color: Colors.black)),
              ),
            );
          }),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 110,
          title: '변경내용',
          field: 'chkRst',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
      PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 110,
          title: '변경수량',
          field: 'chkQty',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Center(
                child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black)
                ),
              ),
            );
          }
      ),
    ];

    return gridCols2;
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
                        await controller.registMainKitAddRow();
                        await controller.checkBoxItemData();
                        await controller.checkBoxItemSaveData();

                        /*controller.addRowList.clear();
                        controller.addRowList.add({
                          'itemCd': controller.textItemCdController.text,
                          'itemNm': controller.textItemNmController.text,
                          'wrkQty': int.parse(controller.textQtyController.text),
                          'setQty': int.parse(controller.textSetController.text),
                          'qtyUnit': controller.textUnitController.text,
                          'prtNo': 'X',
                          'syncYn': 'N',
                          'scanYn': 'N',
                          'ncbxRmk': '60',
                          'ncbxRmkName': 'KIT 외 구성품',
                          'cbxMaNo': '${controller.smallBoxItemDataList[0]['cbxMaNo']}-E',
                          'cbxMaSeq': controller.smallBoxSaveList.length + 1,
                          'setCbxQty': '0',
                          'cbxQty': controller.textQtyController.text,
                          'sboxNo': '',
                          'cbxSuNo': '${controller.smallBoxItemDataList[0]['cbxMaNo']}-E',
                        });
                        controller.smallBoxSaveList.add(controller.addRowList[0]);
                       // List<dynamic> withLeadingZero = controller.smallBoxSaveList.where((item) => item['no'].toString().startsWith('0')).toList();
                       // controller.addRowList[0].addAll({'no': '0${withLeadingZero.length + 1}'});
                        controller.addRowList[0].addAll({'no': '${controller.smallBoxItemDataList.length + 1}'});
                        controller.insertRow.value = List<PlutoRow>.generate(
                            controller.addRowList.length,
                                (index) => PlutoRow(
                                cells: Map.from((controller.addRowList[index]).map((key, value) {
                                  {
                                    return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                                  }
                                }))));
                        controller.stateManager2.insertRows(controller.smallBoxSaveList.length, controller.insertRow);*/
                        //  controller.addRowList[0].addAll({'cbxSuSeq': '${controller.smallBoxList[i]['cbxSuSeq']}'});
                        //  controller.addRowList[0].addAll({'scanSeq': '${controller.smallBoxList[i]['scanSeq']}'});
                        Get.dialog(CommonDialogWidget(
                          contentText: '추가되었습니다',
                          pageFlag: 10,
                        ));
                        controller.textItemCdController.text = '';
                        controller.textItemNmController.text = '';
                        controller.textQtyController.text = '';
                        controller.textSetController.text = '';
                        controller.textUnitController.text = '';
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
        height: 400,
        child: Column(
          children: [
            Container(
              color: AppTheme.dark_text_secondary,
              height: 1,
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 10,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _subData2('프로젝트명', controller.projectNm.value, true),
                    SizedBox(
                      width: 32,
                    ),
                    _subData2('자재코드/자재명', controller.itemCdNm.value.trim(), true),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                _subData2('박스번호', controller.boxNo.value, false),
                SizedBox(
                  width: 32,
                ),

               /* SizedBox(
                  width: 32,
                ),
                _subData2('BOM 점검', controller.bcSts.value ?? '', false),*/
              ],
            ),
            SizedBox(
              width: 32,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              color: AppTheme.dark_text_secondary,
              height: 1,
            ),
            SizedBox(
              height: 12,
            ),
            _alertInput('자재코드'),
            SizedBox(
              height: 4,
            ),
            _alertInput('자재명'),
            SizedBox(
              height: 4,
            ),
            _alertInput('수량'),
            SizedBox(
              height: 4,
            ),
            _alertInput('단위'),
          ],
        ),
      ),
    );
  }

  Widget _alertInput(String title) {
    return Row(
      children: [
        Container(
          width: 100,
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
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 6),
              decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10), color: AppTheme.white),
              child: TextFormField(

                minLines: null,
                maxLines: null,
                style: AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
                controller: title == '자재코드'
                    ? controller.textItemCdController
                    : title == '자재명'
                    ? controller.textItemNmController
                    : title == '수량'
                    ? controller.textQtyController
                    : title == '세트'
                    ? controller.textSetController
                    : title == '단위'
                    ? controller.textUnitController
                    : controller.textItemCdController,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 8),
                  fillColor: AppTheme.white,
                  filled: true,
                  // hintText: 'BC 번호를 입력해주세요',
                  hintStyle: AppTheme.a20400.copyWith(color: AppTheme.aBCBCBC),
                  border: InputBorder.none,
                ),
                showCursor: true,
              ),
            ),
          ),
        ),
      ],
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

  Widget _invnrTextForm2(String title, int plag) {
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
            readOnly: true,
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
              hintText: '',
              hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
              border: InputBorder.none,
            ),
            showCursor: true,
          ),

          // text('', style: AppTheme.a14400.copyWith())
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
                _invnrTextForm2('판매오더', 0),
                SizedBox(width: 12,),
                _invnrTextForm2('제품코드', 1),
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
                  if (event.column.field == 'chgCfFlagName') {
                    print('선택한 값: ${event.value}');
                    // NAME 값이 event.value와 같은 항목의 CODE를 가져옴
                    final code = controller.bomConfirm.firstWhere((item) => item['NAME'] == event.value, orElse: () => {'CODE': ''})['CODE'];
                    controller.bomDetailList[event.rowIdx].addAll({'chgCfFlag': code.toString()});

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
        field: 'chgCfFlagName',
        type: PlutoColumnType.select(controller.bomConfirmNames),
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



  Widget _dupAlertDialog(BuildContext context) {

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
                    '자재 선택',
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

        content: _dupAlertList(context), /// 내부 메인body

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
                        Get.log('선택 클릭!');
                        controller.isCancelOk.value = false;
                        await controller.registMainKitQrMulti();
                        await controller.checkBoxItemData();
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        /*await controller.checkQrBtn2();
                        controller.textQrController.text = '';
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        controller.isFocus.value = true;
                        await controller.checkDetailBtn(); // 디테일 조회
                        controller.focusNode.unfocus();
                        focusNode.requestFocus();*/
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

  Widget _dupAlertList(BuildContext context) {
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
        }, childCount: controller.popUpDataList.length)));
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
          for(var i = 0; i < controller.smallBoxDataList.length; i++) {
           if(controller.smallBoxDataList[i]['tagNo'] == controller.popUpDataList[index]['tagNo']) {
             controller.alertIndex.value = i;
           }
          }
          //  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
        },
        child: Obx(() => Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18, right: 18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: controller.isSelect[index] ? Border.all(color: AppTheme.black, width: 3) : Border.all(color: AppTheme.ae2e2e2),
              color: controller.isCancelOk.value ? controller.popUpDataList[index]['wrkYn'] == 'Y' ? AppTheme.gray_c_gray_200 : AppTheme.white : AppTheme.white,
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
                      Text('작업여부: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList[index]['wrkYn']}', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('QR코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList[index]['tagNo']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('자재코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList[index]['itemCd']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('수량: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList[index]['qty']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                    ],
                  ),

                ],
              )

            ],
          ),
        ),)
    );
  }





}
