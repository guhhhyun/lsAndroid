import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/qaCheck/qa_check_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';

class QaCheckPage extends StatefulWidget {
  const QaCheckPage({super.key});

  @override
  State<QaCheckPage> createState() => _QaCheckPageState();
}

class _QaCheckPageState extends State<QaCheckPage> {

  QaCheckController controller = Get.find();
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
                slivers: [CommonAppbarWidget(title: 'QA 검사', isLogo: false, isFirstPage: true), _main(context), Obx(() => _grid(context))],
              ),
              //  Obx(() => CommonLoading(bLoading: controller.isLoading.value))
            ],
          ),
        ),
        //  bottomNavigationBar: _bottomButton(context), // 점검의뢰 등록
      ),
    );
  }

  /// 키보드 엔터 없이 그리드에서 업데이트된 항목 바로 적용 시켜주기 위한 로직 /////////////////////////////////////////////////////////////
  /// 사유 비고때문에 추가함
  void _listener() {
    if (controller.stateManager2.currentCell == controller.currentCell) {
      controller.isFocus.value = true;
      return;
    }
    if (controller.stateManager2.isEditing && controller.stateManager2.currentCell != null) {

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.initialValue = controller.stateManager2.textEditingController?.text;

        controller.stateManager2.textEditingController!.addListener(_textEditingListener);
        if (controller.stateManager2.textEditingController?.selection != null) {
          controller.stateManager2.textEditingController!.selection = TextSelection(
            baseOffset: 0,
            extentOffset: controller.stateManager2.textEditingController!.text.length,
          );
        }

      });
    } else {
      controller.initialValue = null;

      controller.stateManager2.textEditingController?.removeListener(_textEditingListener);
    }

    controller.currentCell = controller.stateManager2.currentCell;
  }

  void _textEditingListener() {
    controller.debounce.debounce(callback: _update);
  }

  void _update() {
    if (controller.initialValue == controller.stateManager2.textEditingController?.text) {
      return;
    }

    controller.initialValue = null;

    if (controller.currentCell!.column.field == 'REMARK') {
      controller.smallBoxItemSaveDataList[controller.currentCell!.row!.sortIdx].addAll({'REMARK': controller.stateManager2.textEditingController?.text});
    }
    print('이건가? ${controller.stateManager2.textEditingController?.text}');
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
                if(controller.isColor.value) {
                  for (var i = 0; i < controller.noList3.length; i++) {
                    // controller.changedRows.value.add(controller.noList[i]);
                    controller.changedRows.value.add(controller.noList3[i]);
                  }
                  Get.log('색깔1: ${controller.changedRows}');
                  if (controller.changedRows.contains('${c.row.cells['ITEM_CD']?.value.toString()}')) {
                 // if (controller.changedRows.contains('${c.row.cells['ROW_NO']?.value.toString()}${c.row.cells['ITEM_CD']?.value.toString()}')) {
                    Get.log('색깔2: ${controller.changedRows}');
                    return Colors.white; // 이미 변경된 색상 유지
                  } else {
                    Get.log('색깔3: ${controller.changedRows}');
                    return AppTheme.red_red_200;
                  }
                }

                Get.log('색깔: ${controller.changedRows}');
                Get.log('색깔 여부: ${controller.isColor.value}');
                return AppTheme.red_red_200; // 기본 색상으로 유지
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print('event::: $event');
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
              columns: gridCols2(context),
              rows: controller.rows2.value,
              onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event)  {
                Get.log('${event.cell?.column.field}');
                Get.log('${event.cell?.value}');
                controller.currentIndex.value = event.rowIdx + 1;
                setState(() {
                  /// 바로 프로시저도 타게끔 추가 하자
                  if(event.cell?.column.field == 'MANUAL_YN' && controller.smallBoxItemSaveDataList[event.cell!.row.sortIdx]['MANUAL_YN'] == 'N') {
                    event.cell?.value = 'O';
                    controller.smallBoxItemSaveDataList[event.cell!.row.sortIdx].addAll({'MANUAL_YN' : 'Y'});
                    Get.log('aaaaaaa: ${controller.currentIndex.value}');

                     controller.registMain();

                  }else if(event.cell?.column.field == 'MANUAL_YN' && controller.smallBoxItemSaveDataList[event.cell!.row.sortIdx]['MANUAL_YN'] == 'Y') {
                    event.cell?.value = '';
                    controller.smallBoxItemSaveDataList[event.cell!.row.sortIdx].addAll({'MANUAL_YN' : 'N'});
                    Get.log('aaaaaaa: ${controller.currentIndex.value}');
                    controller.registMain();
                  }
                });
              },
              onLoaded: (PlutoGridOnLoadedEvent event) {
                controller.stateManager2 = event.stateManager;
                controller.stateManager2.addListener(_listener); // 리스너 추가
                // stateManager.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                controller.isFocus.value = true;
                print(event);
                print('$event aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
               if(event.column.field == 'REMARK') {
                  controller.smallBoxItemSaveDataList[event.rowIdx].addAll({'REMARK': event.value});
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        /// MAIN 읽기
                                        if(controller.tagType.value == '20') {
                                          await controller.qrHeader();

                                          /// 검사결과 없으면 창 띄우기
                                         if(controller.qrHeaderList[0]['QA_DT'] == null) {
                                           await controller.registNewSave();
                                           await showDialog(
                                             barrierDismissible: false,
                                             context: context, //context
                                             builder: (BuildContext context) {
                                               return _qaRegistDialog(context, 1);
                                             },
                                           );
                                         }else {
                                            /// 검사결과 있으면 그대로 조회
                                            //검사결과 있다
                                           await controller.qaSeq();
                                           await controller.checkBoxItemData();
                                         }
                                          await controller.test();
                                        }else {
                                          /// 자재 읽기
                                          if(controller.smallBoxItemDataList.isNotEmpty) {
                                            await controller.registMainKitQr('R42101');

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
                                    if (controller.focusCnt.value++ > 1)
                                      controller.focusCnt.value = 0;
                                    else
                                      Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));

                                  },
                                  onTapOutside: (event) => {controller.focusCnt.value = 0},
                                  onFieldSubmitted: (value) async {
                                    controller.isFocus.value = false;
                                    await controller.checkBoxData();
                                    if(controller.tagType.value == '20') {
                                      await controller.checkBoxItemData();
                                    }else {
                                      if(controller.smallBoxItemDataList.isNotEmpty) {
                                        /// 구성자재 스캔 시작
                                        await controller.registMainKitQr('N');
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
                                    });

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
                          SizedBox(
                            width: 32,
                          ),
                          Obx(
                            () => _subData('상태'),
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Obx(() =>  _dropDownItem3()),
                            _button('저장', context),
                            _button('신규 검사결과 등록', context),
                            _button('검사결과 등록', context),
                           // _button('선택취소', context),
                          ],
                        ),
                      )
                    ],
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
                    Obx(() =>  Row(
                      children: [
                        _subData2('검사일지', controller.qaDt.value == null ? controller.qaDt.value : controller.qaDt.value, true),
                        SizedBox(width: 32,),
                        _subData2('검사자', controller.qaUser.value == null ? controller.qaUser.value : controller.qaUser.value, true),
                        SizedBox(width: 32,),
                        _subData2('검사결과', controller.judge.value.trim(), true),
                        SizedBox(width: 32,),
                        _subData2('비고', controller.remark.value.trim(), true),
                      ],
                    ),),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropDownItem3() {
    return Row(
      children: [
        Text('검사순번', style: AppTheme.a24700.copyWith(color: AppTheme.black),),
        SizedBox(width: 8,),
        Container(
          height: 55,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          padding: const EdgeInsets.only(right: 12, top: 4),
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
              value: controller.invCntDt.value,
              items: controller.invCntDtList.map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: AppTheme.a20400
                        .copyWith(color: value.toString() == '선택해주세요' ? AppTheme.aBCBCBC : AppTheme.a6c6c6c),
                  ),
                );
              }).toList(),
              onChanged: (value) async{
                controller.invCntDt.value = value!;
                await controller.qrHeader();
                await controller.checkBoxItemData();

              }),
        ),
      ],
    );
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
            width: title == '메모' ? 300 : null,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(border: Border.all(color: AppTheme.ae2e2e2), borderRadius: BorderRadius.circular(10)),
            child: Text(
              title == '메모' ? controller.textMemoController.text : controller.statusText.value,
              style: AppTheme.a20700.copyWith(color: AppTheme.dk_red),
            )),
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
      width: 150,
      padding: EdgeInsets.only(left: 12),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              // backgroundColor: MaterialStateProperty.all<Color>(AppTheme.a1f1f1f) ,
              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.dongkuk_blue),
              padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
          onPressed: () async {
              if(controller.cbxMaNo.value != '') {
                if(text == '검사결과 등록') {
                  controller.isFocus.value = true;
                  await controller.registNewSave();
                  await showDialog(
                    barrierDismissible: false,
                    context: context, //context
                    builder: (BuildContext context) {
                      return _qaRegistDialog(context, 2);
                    },
                  );
                }else if(text == '저장') {
                  await controller.registMainKitDonggihwaNewSave();
                }else if(text == '신규 검사결과 등록') {
                  controller.isFocus.value = true;
                  await controller.registNewSave();
                  await showDialog(
                    barrierDismissible: false,
                    context: context, //context
                    builder: (BuildContext context) {
                      return _qaRegistDialog(context, 1);
                    },
                  );
                }
              }

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
          field: 'ROW_NO',
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
          field: 'ITEM_CD',
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
          field: 'ITEM_NM',
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
          field: 'WRK_QTY',
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
          title: '박스번호',
          field: 'SBOX_NO',
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
          field: 'SET_QTY',
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
          field: 'BOM_QTY',
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
          title: 'KIT수량',
          field: 'KIT_QTY',
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
          field: 'WRK_SEQ',
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
          field: 'ITEM_CD',
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
          field: 'ITEM_NM',
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
          field: 'WRK_QTY',
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
          title: '검사(스캔)',
          field: 'SCAN_YN',
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
          title: '검사(수동)',
          field: 'MANUAL_YN',
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
        enableEditingMode: true,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        width: 160,
        title: '사유비고',
        field: 'REMARK',
        type: PlutoColumnType.text(),
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
          title: '동기화 사유',
          field: 'ncbxRmkName',
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
          width: 350,
          title: '스캔번호',
          field: 'SCAN_NO',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              width: 200,
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

                        controller.addRowList.clear();
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
                        controller.stateManager2.insertRows(controller.smallBoxSaveList.length, controller.insertRow);

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

                SizedBox(
                  width: 32,
                ),
                _subData2('BOM 점검', controller.bcSts.value ?? '', false),

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


  /// 검사등록 팝업
  Widget _qaRegistDialog(BuildContext context, int plag) {

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
                    'QA 검사등록',
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
        content: Container(
            width: 800,
            height: 220,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                            child: Text('검사일',  style: AppTheme.a24700.copyWith(color: AppTheme.black),)),
                        SizedBox(width: 12,),
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
                              height: 40,
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
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Obx(() => Container(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 120,
                            child: Text('검사자',  style: AppTheme.a24700.copyWith(color: AppTheme.black),)),
                        SizedBox(width: 12,),
                        Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all( color: AppTheme.ae2e2e2)),
                            padding: const EdgeInsets.only(right: 12),
                            child: _weighingTwo()
                        ),
                      ],
                    ),
                  ),),
                  SizedBox(height: 12,),
                  Obx(() => Container(
                    padding: EdgeInsets.only(left: 12, right: 26),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 120,
                                child: Text('판정', style: AppTheme.a24700.copyWith(color: AppTheme.black))),
                            SizedBox(width: 12,),
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
                                        style: AppTheme.a18400
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
                        ),
                      ],
                    ),
                  ),),
                  SizedBox(height: 12,),
                 /* Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          child: Text(
                            '불합격 내용',
                            style: AppTheme.a24700.copyWith(color: AppTheme.black),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4, left: 8),
                          height: 40,
                          width:  630,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.ae2e2e2)),
                          child: Center(
                            child: TextFormField(
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              style: AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
                              controller: controller.textReKitController,
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
                              onTap: () {
                                controller.isFocus.value = true;
                              },
                              onChanged: (value) {

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),*/
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          child: Text(
                            '조치 내용',
                            style: AppTheme.a24700.copyWith(color: AppTheme.black),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 4, left: 8),
                          height: 40,
                          width:  630,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.ae2e2e2)),
                          child: Center(
                            child: TextFormField(
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              style: AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
                              controller: controller.textReKitController,
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
                              onTap: () {
                                controller.isFocus.value = true;
                              },
                              onChanged: (value) {

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),

                ],
              ),
            )
        ), /// 내부 메인body

        buttonPadding: const EdgeInsets.all(0),
        // insetPadding 이게 전체크기 조정
        insetPadding: const EdgeInsets.only(left: 45, right: 45),
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        //
        actions: [
          Container(
            width: 800,
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                    ))),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0))),
                        onPressed: () async {
                          Get.log('닫기 클릭!');
                          controller.dayStartValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                          controller.textReKitController.text = '';

                          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: const Color(0x5c3c3c43),)
                              ),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                              color: AppTheme.white
                          ),
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
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15)))),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(0))),
                        onPressed: () async {
                          Get.log('저장 클릭!');
                          plag == 1 ?
                          await controller.registMainKitQrMulti()
                              :
                          await controller.registMainKitQrMulti2();
                          controller.dayStartValue.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                          controller.textReKitController.text = '';
                          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: const Color(0x5c3c3c43),)
                              ),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
                              color: AppTheme.navy_navy_900
                          ),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            top: AppTheme.spacing_s_12,
                            bottom: AppTheme.spacing_s_12,
                          ),
                          child: Center(
                            child: Text('저장',
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
            ),
          )
        ]);
  }


  Widget _weighingTwo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Expanded(
          child: Container(
              height: 40,
              width: 150,
              margin: const EdgeInsets.only(top: 6),
              padding: EdgeInsets.only(left: 12),
              child: DropdownButton2(

                underline: Container(
                  height: 1,
                  color: Colors.white,
                ),
                dropdownStyleData: DropdownStyleData(
                //  maxHeight: 300,
                  width: 150,
                //  offset: Offset(25, 25),
                  decoration: BoxDecoration(
                      color: AppTheme.light_ui_01,
                      border: Border(
                        bottom: BorderSide(color: AppTheme.gray_gray_200),
                      )
                  ),
                ),
                isExpanded: true,
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset(
                    'assets/app/arrowBottom.svg',
                    color: AppTheme.light_placeholder,
                  ),
                ),
                //   dropdownColor: AppTheme.light_ui_01,
                value: controller.selectedUser['usrNm'].toString(),
                //  flag == 3 ? controller.selectedNoReason.value :
                items: controller.userList.map((value) => DropdownMenuItem(
                    value: value['usrNm'].toString(),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 4 ),
                      child: Text(
                        value['usrNm'].toString(),
                        style: AppTheme.a18400
                            .copyWith(color: value['NAME'].toString() == '선택해주세요' ? AppTheme.aBCBCBC : AppTheme.a6c6c6c),
                      ),
                    )
                )
                ).toList(),
                onChanged: (value) {
                  controller.userList.map((e) {
                    if(e['usrNm'] == value) {
                      controller.selectedUser['usrId'] = e['usrId'];
                      controller.selectedUser['usrNm'] = e['usrNm'];
                    }
                  }).toList();
                  Get.log('${ controller.selectedUser} 선택!!!!');
                },
                dropdownSearchData: DropdownSearchData(
                  searchController: controller.searchDropTextController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      style: AppTheme.a14500.copyWith(color: AppTheme.black),
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.visiblePassword,
                      expands: true,
                      maxLines: null,
                      controller: controller.searchDropTextController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: '검색해주세요',
                        hintStyle: const TextStyle(fontSize: 12, color: AppTheme.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value.toString().contains(searchValue);
                  },
                ),
              )

          ),
        ),


      ],
    );
  }
}

