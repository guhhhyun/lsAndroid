import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/common_dialog_box.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class SmallKitNewPage extends StatelessWidget {
  SmallKitNewPage({super.key});
  SmallKitController controller = Get.find();
  final focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
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
                  CommonAppbarWidget(title: '소박스 KIT 작업', isLogo: false, isFirstPage: true ),
                  _main(context),
                  Obx(() => _grid(context))

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

  /// 키보드 엔터 없이 그리드에서 업데이트된 항목 바로 적용 시켜주기 위한 로직 /////////////////////////////////////////////////////////////
  /// 사유 비고때문에 추가함
  void _listener() {
    if (controller.stateManager2.currentCell == controller.currentCell) {
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

    /*  if (controller.currentCell!.column.field == 'cntLocCd') {
       print('선택한 값: ${controller.gridStateMgr.textEditingController?.text}');
       controller.inventoryCntDetailList[controller.inventoryCntDetailList.length - 1 - controller.currentCell!.row!.sortIdx].addAll({'cntLocCd': controller.gridStateMgr.textEditingController?.text});
     }
     if (controller.currentCell!.column.field == 'cntQty') {

       print('선택한 값: ${controller.gridStateMgr.textEditingController?.text}');
       controller.inventoryCntDetailList[controller.inventoryCntDetailList.length - 1 - controller.currentCell!.row!.sortIdx].addAll({'cntQty': controller.gridStateMgr.textEditingController?.text});
       print('바뀐 값: ${controller.inventoryCntDetailList[controller.inventoryCntDetailList.length - 1 - controller.currentCell!.row!.sortIdx]['cntQty']}');

     }*/
    if (controller.currentCell!.column.field == 'remark') {
     controller.smallBoxSaveList[controller.currentCell!.row!.sortIdx].addAll({'remark': controller.stateManager2.textEditingController?.text});
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
            width: MediaQuery.of(context).size.width/2 - 20,
            child: PlutoGrid(
              columns: gridCols(context),
              rows: controller.rows.value,
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                controller.stateManager = event.stateManager;
                controller.stateManager.rowColorCallback;
              },
              rowColorCallback: (c) {
                // 특정 조건에 해당하는 row의 색을 바꾸기
                Get.log('no::::: ${controller.no.value}');
                /// 이게 동기화 경우
                if(controller.isSaveColor.value) {
                  for(var i = 0; i < controller.noList.length; i++) {
                    // controller.changedRows.value.add(controller.noList[i]);
                    controller.changedRows.value.add(controller.noList[i]);
                  }
                  if (controller.changedRows.contains(c.row.cells['itemCd']?.value.toString())) {
                    return Colors.white; // 이미 변경된 색상 유지
                  }else {
                    return AppTheme.red_red_200;
                  }
                  /// 일반 자재 스캔이나 저장된 값
                }else {
                  if (controller.isColor.value) {
                    for(var i = 0; i < controller.noList2.length; i++) {
                      // controller.changedRows.value.add(controller.noList[i]);
                      controller.changedRows2.value.add(controller.noList2[i]);
                      /*   if (controller.changedRows2.contains(controller.smallBoxList[0]['itemCd'])) {
                        return Colors.white; // 이미 변경된 색상 유지
                      }*/
                    }
                    if (controller.changedRows2.contains(c.row.cells['itemCd']?.value.toString())) {
                      return Colors.white; // 이미 변경된 색상 유지
                    }else {
                      return AppTheme.red_red_200;
                    }
                    //  controller.changedRows.value.add(c.rowIdx); // 색상이 변경된 행을 RxSet에 추가
                    //  return Colors.white; // 조건에 맞는 경우에만 색 변경
                  }
                }

                Get.log('색깔: ${controller.changedRows}');
                Get.log('색깔개수: ${controller.noList2}');
                Get.log('색깔 여부: ${controller.isColor.value}');
                return AppTheme.red_red_200; // 기본 색상으로 유지
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print('event::: $event');
                if (event.column.field == 'remark') {
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
          SizedBox(width: 24,),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 300, //controller.gridHeight.value,
            width: MediaQuery.of(context).size.width/2 - 20,
            child: PlutoGrid(
              //  mode: PlutoGridMode.select, // 탭 한번으로 반응하게?
              columns: gridCols2(context),
              rows: controller.rows2.value,
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                controller.stateManager2 = event.stateManager;
                controller.stateManager2.addListener(_listener);
                // stateManager.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) async{
                print(event);
                // Get.log('그리드 변겸됐다');
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

                  //  controller.smallBoxSaveList[event.rowIdx]['ncbxRmk'] = code.toString();
                  if(event.value == 'TAG 미부착') {

                    controller.noTagIdx.value = event.rowIdx;
                   // controller.qrDonggihwa.value = controller.smallBoxSaveList[event.rowIdx]['qrNo'];
                    await controller.reqCommon3(controller.smallBoxSaveList[event.rowIdx]['itemCd']);
                    await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _alertDialog2(context, event.rowIdx);
                        },
                      );

                    /// 선택 후 선택된 리스트 클리어
                    controller.selectedPopList.clear();
                  }
                }else if(event.column.field == 'remark') {
                  controller.smallBoxSaveList[event.rowIdx].addAll({'remark': event.value});
                }

              },

              onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) async{
                Get.log('더블클릭!!');
                /// 행추가라면 삭제 로직 ㄱ
                if(controller.smallBoxSaveList[event.rowIdx]['exItemNm'] != null) {
                  await showDialog(
                    barrierDismissible: false,
                    context: context, //context
                    builder: (BuildContext context) {
                      return _deleteAddRowAlertDialog(context, event.rowIdx);
                    },
                  );
                  if(controller.deleteYes.value) {
                    controller.textQrController.text = controller.smallBoxItemDataList[0]['cbxSuNo'].toString();
                    await controller.checkBoxItemData();
                    await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                    controller.textQrController.text = '';
                  }
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
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.black))
            ),
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
                              child: Text('QR 코드', style: AppTheme.a24700.copyWith(color: AppTheme.black), ),
                            ),
                            SizedBox(width: 12,),
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
                                        controller.isQrFocus.value = false;
                                        if(controller.smallBoxItemDataList.isNotEmpty) {
                                            /// 자재 읽기
                                            await controller.checkItemQr();
                                            if(controller.isSmallBoxDataList.value) {
                                              if(controller.smallBoxItemDataList[0]['wrkCfmYn'] != 'Y') { /// 확정일 경우 소박스 새로 읽는거만 조회되게 한다
                                                // 자재 저장 프로시저 돌리기
                                                if (controller.isCheckBool.value) {
                                                    // 투입 취소
                                                    await controller.registSmallKitCancel();
                                                    controller.isSaveColor.value = false;
                                                    await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                                                    await controller.reRendering();
                                                } else {
                                                  // 투입
                                                  if (controller.smallBoxDataList[0]['indScanYn'] == 'Y') { // 개별 자재
                                                    /// 개별 자재일 경우에는 그냥 프로시저 돌리기
                                                    await controller.registSmallKitItemSave();
                                                  }else {
                                                    /// 개별 자재가 아닌 경우에는 팝업 창 열고 수량 입력
                                                    await controller.reqCommon4();
                                                    showDialog(
                                                      barrierDismissible: false,
                                                      context: context, //context
                                                      builder: (BuildContext context) {
                                                        return _dupAlertDialog(context);
                                                      },
                                                    ); // context가 왜?
                                                  }
                                                }



                                             /*   if(controller.smallBoxDataList.length > 1) {
                                                  await controller.reqCommon4();
                                                  showDialog(
                                                    barrierDismissible: false,
                                                    context: context, //context
                                                    builder: (BuildContext context) {
                                                      return _dupAlertDialog(context);
                                                    },
                                                  ); // context가 왜?

                                                }else {
                                                  // 중복 X
                                                  if(controller.smallBoxDataList[0]['cancleFlag'] > 0) {
                                                    // 이미 스캔된 자재일 경우 취소 여부 물어볼 메세지처리
                                                    await Get.dialog(CommonDialogBoxWidget(contentText: '이미 스캔된 자재입니다. 스캔 취소하시겠습니까?', pageFlag: 0));
                                                    if(controller.isCancelIpgo.value) {
                                                      await controller.registSmallKitCancel();
                                                      controller.isSaveColor.value = false;
                                                      await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                                                      await controller.test();
                                                    }
                                                  }else {
                                                    await controller.registSmallKitItemSave();
                                                  }
                                                }*/
                                              }else {
                                                Get.dialog(CommonDialogWidget(contentText: '확정된 상태입니다.', pageFlag: 3,));
                                              }

                                            }

                                        }else {
                                          /// 소박스 읽기
                                          await controller.checkBoxItemData();
                                          for (var i = 0; i < controller.smallBoxItemDataList.length; i++) {
                                            controller.smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
                                          }

                                        }

                                        controller.textQrController.text = '';

                                        await controller.reRendering();
                                        controller.focusNode.requestFocus();
                                        Future.delayed(const Duration(), () {
                                          controller.focusNode.requestFocus();
                                          Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                        });

                                      }
                                    }
                                  },
                                  child: TextFormField(
                                    minLines: null,
                                    expands: true,
                                    maxLines: null,
                                    focusNode: controller.focusNode,
                                    style:  AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                                    controller: controller.textQrController,
                                    textAlignVertical: TextAlignVertical.center,
                                    textInputAction: TextInputAction.done,
                                    onTap: () {
                                    /*  if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                                      else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));*/
                                      //controller.isQrFocus.value = false;
                                    },
                                    onTapOutside:(event) => { controller.focusCnt.value = 0 },

                                    onFieldSubmitted: (value) async {
                                     /* controller.isQrFocus.value = false;
                                      if(controller.smallBoxItemDataList.isNotEmpty) {
                                        if(controller.smallBoxItemDataList[0]['wrkCfmYn'] != 'Y') {
                                          /// 자재 읽기
                                          await controller.checkItemQr();
                                          if(controller.isSmallBoxDataList.value) {
                                            // 자재 저장 프로시저 돌리기
                                            if(controller.smallBoxDataList.length > 1) {
                                              // 중복 qr이니 alert 띄우기
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context, //context
                                                builder: (BuildContext context) {
                                                  return _dupAlertDialog(context);
                                                },
                                              ); // context가 왜?
                                            }else {
                                              // 중복 X
                                              if(controller.smallBoxDataList[0]['cancleFlag'] > 0) {
                                                // 이미 스캔된 자재일 경우 취소 여부 물어볼 메세지처리
                                                await Get.dialog(CommonDialogBoxWidget(contentText: '이미 스캔된 자재입니다. 스캔 취소하시겠습니까?', pageFlag: 0));
                                                if(controller.isCancelIpgo.value) {
                                                  await controller.registSmallKitCancel();
                                                  await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                                                  await controller.test();
                                                }
                                              }else {
                                                await controller.registSmallKitItemSave();
                                              }
                                            }
                                          }
                                        }else {
                                          Get.dialog(CommonDialogWidget(contentText: '확정된 소박스입니다.', pageFlag: 3,));
                                        }
                                      }else {
                                        /// 소박스 읽기
                                        await controller.checkBoxItemData();
                                        for (var i = 0; i < controller.smallBoxItemDataList.length; i++) {
                                          controller.smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
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
                                      contentPadding: const EdgeInsets.all(0),
                                      fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
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
                          ],
                        ),
                        SizedBox(width: 32,),
                        Obx(() => _subData('상태')),
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
                SizedBox(height: 4,),
                Container(
                  color: AppTheme.dark_text_secondary,
                  height: 1,
                ),
                SizedBox(height: 8,),
                Obx(() => Container(
                  width: MediaQuery.of(context).size.width - 10,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _subData2('소박스번호', controller.sboxNo.value, false),
                        SizedBox(width: 32,),
                        _subData2('프로젝트명', controller.projectNm.value, true),
                        SizedBox(width: 32,),
                        _subData2('자재코드/자재명', controller.itemCdNm.value.trim(), true),
                       // SizedBox(width: 32,),
                        // _subData2('BOM점검', controller.wrkNo.value, false),
                       // _subData2('제조번호', controller.wrkNo.value, false),
                        SizedBox(width: 32,),
                        _subData2('박스번호', controller.boxNo.value, false),
                        SizedBox(width: 32,),
                        _subData2('BOM 점검', controller.bcSts.value == 'null' ? '' : controller.bcSts.value, false)
                      ],
                    ),
                  ),
                ),),
                SizedBox(height: 4,),
                Container(
                  color: AppTheme.dark_text_secondary,
                  height: 1,
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _subDataMemo('메모'),
                        SizedBox(width: 12,),
                        _subDataWeight(),
                        SizedBox(width: 12,),
                        Row(
                          children: [
                            Obx(() => Checkbox(value: controller.isCheckBool.value, onChanged: (value) {
                              controller.isCheckBool.value = value!;

                            }),),
                            Text('삭제', style: AppTheme.a18400.copyWith(color: AppTheme.black),)
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 490,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Row(
                            children: [
                             Obx(()=>  _subData2('확정일', controller.wrkCfmDt.value ?? '', false),),
                              SizedBox(width: 32,),
                              Obx(() => _subData2('무게', controller.boxWht.value ?? '', false),),
                              SizedBox(width: 32,),

                              /*Container(
                                margin: EdgeInsets.only(right: 12),
                                width: 120,
                                height: 56,
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
                                    // 소박스 지시 선택한게 없는 경우 리턴
                                    if(controller.smallBoxItemDataList.isEmpty){
                                      return;
                                    }
                                    if (controller.smallBoxItemDataList[0]['wrkCfmYn'] != 'Y') {
                                      Get.dialog(CommonDialogWidget(contentText: '확정 취소 후 진행해주세요', pageFlag: 3,));
                                      return;
                                    }
                                    await controller.registSmallKitBomChg(); // bom 변경적용 프로시저

                                    /// 재조회
                                    controller.textQrController.text = controller.smallBoxItemDataList[0]['cbxSuNo'].toString();
                                    Get.dialog(CommonDialogWidget(contentText: '변경되었습니다.', pageFlag: 0));
                                    /// 전체 재조회 해야할듯?
                                    await controller.checkBoxItemData();
                                    for (var i = 0; i < controller.smallBoxItemDataList.length; i++) {
                                      controller.smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
                                    }
                                    controller.textQrController.text = '';
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.navy_navy_800,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppTheme.ae2e2e2)
                                    ),
                                    width: 120,
                                    height: 56,
                                    padding: const EdgeInsets.only(

                                    ),
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
                                    if(controller.smallBoxItemDataList.isNotEmpty) {
                                      await controller.reqBom();
                                      if(controller.bomList.isNotEmpty) {
                                        await controller.reqBomDetail();
                                      }
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return _alertDialog(context);
                                        },
                                      );
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.navy_navy_800,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: AppTheme.ae2e2e2)
                                    ),
                                    width: 120,
                                    height: 56,
                                    padding: const EdgeInsets.only(

                                    ),
                                    child: Center(
                                      child: Text('BOM변경확인', //입고취소 조회
                                          style: AppTheme.a15700.copyWith(
                                            color: AppTheme.white,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(() => Container(
                                margin: EdgeInsets.only(right: 14),
                                decoration: BoxDecoration(
                                    color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.8) : Colors.redAccent.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                width: 55,
                                height: 55,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


  Widget _subData(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700.copyWith(color: AppTheme.black),),
        ),
        SizedBox(width: 12,),
        Container(
            constraints: BoxConstraints(
              minWidth: 150.0, // 최소 넓이 150
            ),
            width: null,
            height: 50,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.ae2e2e2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(controller.statusText.value, style: AppTheme.a20700.copyWith(color: AppTheme.dk_red),)
        ),
      ],
    );
  }

  Widget _subDataMemo(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700.copyWith(color: AppTheme.black),),
        ),
        SizedBox(width: 12,),
        Container(
          width: 400,
          height: 50,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: AppTheme.ae2e2e2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            //  focusNode: controller.focusNode,
            expands :true,
            minLines: null,
            maxLines: null,
            style:  AppTheme.a24400.copyWith(color: AppTheme.a6c6c6c),
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
              controller.isQrFocus.value = true;
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
            '무게',
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
              controller.isQrFocus.value = true;
            },
            // onChanged: ((value) => controller.submitSearch(value)),
          ),
        ),
      ],
    );
  }

  /*Widget _subDataWeight2() {
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
              controller.isQrFocus.value = true;
            },
            // onChanged: ((value) => controller.submitSearch(value)),
          ),
        ),
      ],
    );
  }*/
  Widget _subData2(String title, String content, bool isLong) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700.copyWith(color: AppTheme.black),),
        ),
        SizedBox(width: 12,),
        Container(
            padding: const EdgeInsets.all(4),
            child: Text(content, style: AppTheme.a24400.copyWith(color: AppTheme.light_ui_08),)
        ),
      ],
    );
  }



  Widget _button(String text, BuildContext context) {
    return Container(
      width: 120,
      padding: EdgeInsets.only(left: 12),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              // backgroundColor: MaterialStateProperty.all<Color>(AppTheme.a1f1f1f) ,
              backgroundColor: MaterialStateProperty.all<Color>(AppTheme.dongkuk_blue) ,
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(0))),
          onPressed: () async {
            if(text == '동기화')
            {
              if(controller.itemCdNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 먼저 스캔해주세요.', pageFlag: 0));
                return;
              }
              if(controller.smallBoxItemDataList[0]['wrkCfmYn'].toString() != 'Y') {
                controller.isQrFocus.value = true;
                syncProcess();
              }else {
                Get.dialog(CommonDialogWidget(contentText: '확정 처리된 상태입니다.', pageFlag: 0));
              }
            }
            else if(text == '행 추가')
            {
              controller.isQrFocus.value = true;
              controller.smallBoxItemDataList.isNotEmpty ?
              controller.wrkCfmDt.value.trim() == '' || controller.wrkCfmDt.value.trim() == 'null' ?
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog3(context);
                },
              )   :  Get.dialog(CommonDialogWidget(contentText: '확정된 박스입니다.', pageFlag: 0))
                  :  Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요', pageFlag: 0));
              /*controller.insertRow.value = List<PlutoRow>.generate(controller.ipgoQrList.length, (index) =>
            PlutoRow(cells:
            Map.from((controller.ipgoQrList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value ?? '' )),
            )))
            ),
            //  controller.rowDatas2.add(controller.insertRow[0]);
            controller.stateManager2.insertRows(controller.ipgoList.length, controller.insertRow)*/
            }
            else if(text == '저장')
            {
              if(controller.itemCdNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 먼저 스캔해주세요.', pageFlag: 0));
                return;
              }

              if(controller.wrkCfmDt.value.trim() == '' || controller.wrkCfmDt.value.trim() == 'null' || controller.wrkCfmDt.value == null) {
                if(controller.isSaveClick.value == false) {
                  controller.isSaveClick.value = true;
                  Get.log('저장할 리스트!: ${controller.smallBoxSaveList.length}');

                  await controller.registMemoSmallKitSave(); // 메모 저장
                  controller.isSave.value ?
                  Get.dialog(CommonDialogWidget(contentText: '저장되었습니다.', pageFlag: 0)) :
                  Get.dialog(CommonDialogWidget(contentText: '${controller.isSaveText.value}.', pageFlag: 0));
                }
                controller.isSaveClick.value = false;
              }else {
                Get.dialog(CommonDialogWidget(contentText: '확정된 박스입니다.', pageFlag: 0));
              }

            }
            else if(text == '동기화 취소')
            {
              if(controller.itemCdNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 먼저 스캔해주세요.', pageFlag: 0));
                return;
              }
              Get.log('동기화 취소');
              Get.log('동기화 취소1: ${controller.smallBoxSaveList.length}');
              // smallBoxSaveList의 리스트에 changedRows에 {1,2} 가 있는데 smallBoxSaveList[1]이 존재하지않으면 ch
              if (controller.smallBoxItemDataList[0]['wrkCfmYn'] != 'Y') {
                controller.isColor.value = false;
                controller.isSaveColor.value = true;
                controller.changedRows.clear();
                controller.isDonggi.value = false;

                controller.smallBoxSaveList.removeWhere((item) {
                  bool shouldRemove = false;

                  if (item['prtNo'].toString() == 'O') {
                    if(item['ncbxRmk'] == '') {
                      if (item['savedWrkQty'] == null) {
                        controller.noList.remove(item['itemCd']);
                        controller.reRendering();
                        controller.stateManager.rowColorCallback!;
                        shouldRemove = true;
                        controller.reRendering();
                      } else {
                        int index = controller.smallBoxItemDataList.indexWhere((element) => element['no'] == item['no']);
                        controller.smallBoxSaveList[index].addAll({'qty': '${controller.smallBoxSaveList[index]['savedWrkQty']}'});
                        controller.smallBoxSaveList[index].addAll({'prtNo': 'X'});
                        controller.smallBoxSaveList[index].addAll({'syncYn': 'N'});
                        Get.log('qty::: ${controller.smallBoxSaveList[index]['qty']}');
                        controller.noList.remove(item['itemCd']);
                        shouldRemove = false;
                        controller.reRendering();
                      }
                    } else if(item['ncbxRmk'] != '') {
                      Get.log('동기화취소 안돼!');
                      item.addAll({'ncbxRmk':''});

                    }
                  }
                  return shouldRemove;
                });
                await controller.reRendering();

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


            }
            else if(text == '확정')
            {
              if(controller.itemCdNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 먼저 스캔해주세요.', pageFlag: 0));
                return;
              }

              if(controller.smallBoxSaveList.length < controller.smallBoxItemDataList.length) {
                Get.dialog(CommonDialogWidget(contentText: '스캔하지않은 자재가 있습니다.', pageFlag: 0));
                return;
              }
              for (var dong = 0; dong < controller.smallBoxItemDataList.length; dong++) {
                for (var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
                  // 이미 오른쪽에 스캔된 자재가 있는데 수량이 작다면? -> 동기화 대상
                  if (controller.smallBoxItemDataList[dong]['itemCd'] == controller.smallBoxSaveList[dong2]['itemCd']) {
                    controller.noSync.value = false;
                    if (double.parse(controller.smallBoxItemDataList[dong]['remainQty'].toString()) > 0.0) {
                      Get.dialog(CommonDialogWidget(contentText: '수량이 맞지않는 자재가 있습니다.', pageFlag: 0));
                      return;
                    }
                  }
                }
              }

              for(var idx = 0; idx < controller.smallBoxSaveList.length; idx++) {
                if(controller.smallBoxSaveList[idx]['prtNo'] == 'O' && controller.smallBoxSaveList[idx]['ncbxRmk'] == '') {
                  Get.dialog(CommonDialogWidget(contentText: '동기화 사유를 입력하지않은 자재가 있습니다.', pageFlag: 0));
                  return;
                }
              }


              if(controller.isConfirmClick.value == false) {
                controller.isConfirmClick.value = true;
               /* Get.dialog(
                  Center(child: CircularProgressIndicator()),
                  barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
                );*/
                try{
                  for(var i = 0; i < controller.smallBoxSaveList.length; i++) {
                    if(controller.smallBoxSaveList[i]['prtNo'] == 'O') {
                      if(controller.smallBoxSaveList[i]['ncbxRmk'] != '' && controller.smallBoxSaveList[i]['ncbxRmk'] != null) {
                         controller.cbxSuNoDonggihwa.value = controller.smallBoxSaveList[i]['cbxSuNo'].toString();
                         controller.cbxSuSeqDonggihwa.value = controller.smallBoxSaveList[i]['cbxSuSeq'].toString();
                         controller.wrkQtyDonggihwa.value = controller.smallBoxSaveList[i]['wrkQty'].toString();
                         controller.ncbxRmkDonggihwa.value = controller.smallBoxSaveList[i]['ncbxRmk'].toString();
                         controller.remarkDonggihwa.value = controller.smallBoxSaveList[i]['remark'] == null ? '' : controller.smallBoxSaveList[i]['remark'].toString();
                        // 동기화한 자재 저장처리!!!!!!!
                        await controller.registSmallKitDonggiSave();
                        if(controller.isSuccsessDong.value == false) {
                          break;
                        }
                      }else {
                        Get.log('왜??');
                        Get.log('왜?? :::: ${controller.smallBoxSaveList[i]['ncbxRmk']}');
                      }
                    }
                  }
                  // 동기화 저장 성공했으면 확정 처리!!
                  if(controller.isSuccsessDong.value) {
                    await controller.registSmallKitConfirmNew('Y');
                    for(var idx = 0; idx < controller.smallBoxSaveList.length; idx++) {
                      if(controller.smallBoxSaveList[idx]['prtNo'] == 'O' && controller.smallBoxSaveList[idx]['ncbxRmk'] == '20') {
                        await controller.registSmallKitItemSaveDong(idx);
                      }
                    }
                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '동기화 저장에 실패하였습니다.', pageFlag: 3,));
                  }

                }catch(e) {
                  Get.log('$e');
                }finally {
                  if(controller.isConfirm.value) {
                    controller.textQrController.text = controller.smallBoxItemDataList[0]['cbxSuNo'].toString();
                    Get.dialog(CommonDialogWidget(contentText: '확정되었습니다.', pageFlag: 0));
                    /// 전체 재조회 해야할듯?
                    await controller.checkBoxItemData();
                    for (var i = 0; i < controller.smallBoxItemDataList.length; i++) {
                      controller.smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
                    }
                    controller.textQrController.text = '';
                    controller.wrkCfmDt.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                  }else {
                    Get.dialog(CommonDialogWidget(contentText: '${controller.isConfirmText.value}.', pageFlag: 0));
                  }
                  controller.focusNode.unfocus();
                  controller.isConfirmClick.value = false;
                }
              }
              controller.isConfirmClick.value = false;

            }
            else if(text == '확정 취소')
            {
              if(controller.itemCdNm.value == '') {
                Get.dialog(CommonDialogWidget(contentText: '박스를 먼저 스캔해주세요.', pageFlag: 0));
                return;
              }
              await controller.registSmallKitConfirmNew('N');
              if(controller.isConfirm.value) {
                controller.textQrController.text = controller.smallBoxItemDataList[0]['cbxSuNo'].toString();
                Get.dialog(CommonDialogWidget(contentText: '확정 취소되었습니다.', pageFlag: 0));

                await controller.checkBoxItemData();
                for (var i = 0; i < controller.smallBoxItemDataList.length; i++) {
                  controller.smallBoxItemDataList[i].addAll({'no': '${i + 1}'});
                }
                controller.textQrController.text = '';
                controller.wrkCfmDt.value = '';

              }else {
                Get.dialog(CommonDialogWidget(contentText: '취소 실패하였습니다.', pageFlag: 0));
              }
              controller.focusNode.unfocus();
              controller.isConfirmClick.value = false;
            }else {

            }
          } ,
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
    try {
      if (controller.isDonggi.value == false) {
        controller.isDonggi.value = true;
        controller.isColor.value = false;
        controller.isSaveColor.value = true;
        for (var dong = 0; dong < controller.smallBoxItemDataList.length; dong++) {
          // Get.log('smallBoxSaveList: ${controller.smallBoxItemDataList}');
          controller.noList.add(controller.smallBoxItemDataList[dong]['itemCd']);
          if (controller.smallBoxSaveList.isEmpty) {
            controller.noSync.value = true;
          }

          // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
          for (var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
            // 이미 오른쪽에 스캔된 자재가 있는데 수량이 작다면? -> 동기화 대상
            if (controller.smallBoxItemDataList[dong]['itemCd'] == controller.smallBoxSaveList[dong2]['itemCd']) {
              controller.noSync.value = false;
              if (double.parse(controller.smallBoxItemDataList[dong]['cbxQty'].toString()) > double.parse(controller.smallBoxSaveList[dong2]['wrkQty'].toString())) {
                controller.smallBoxSaveList[dong2].addAll({'savedWrkQty': controller.smallBoxSaveList[dong2]['wrkQty']});
                controller.smallBoxSaveList[dong2].addAll({'ncbxRmk': ''});
                controller.smallBoxSaveList[dong2].addAll({'syncYn': 'Y'});
                controller.smallBoxSaveList[dong2].addAll({'prtNo': 'O'});
                controller.smallBoxSaveList[dong2].addAll({'ncbxRmkName': ''});
                controller.smallBoxSaveList[dong2].addAll({'wrkQty': controller.smallBoxItemDataList[dong]['cbxQty']});
                controller.smallBoxSaveList[dong2].addAll({'sboxNo': controller.smallBoxItemDataList[dong]['cbxSuNo']});
                controller.smallBoxSaveList[dong2].addAll({'remark': ''});
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
            controller.smallBoxItemDataList[dong].addAll({'sboxNo': controller.smallBoxItemDataList[dong]['cbxSuNo']});
            controller.smallBoxItemDataList[dong].addAll({'chkRst': ''});
            controller.smallBoxItemDataList[dong].addAll({'chkQty': ''});
            controller.smallBoxItemDataList[dong].addAll({'remark': ''});
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
        await controller.reRendering();
        Get.log('이거이거 ${controller.smallBoxSaveList}');

        Get.log('동기화 is: ${controller.isDropdownEnabled.value}');
        controller.isDonggi.value = false;
      }
    } catch (e) {
      Get.log('$e');
    } finally {
      // 로딩 다이얼로그 종료
    //  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
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
          width: 60,
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
          textAlign: PlutoColumnTextAlign.left,
          width: 320,
          title: '자재명',
          field: 'itemNm',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(4),
              width: 60,
              // color: textColor,
              child: Text(
                  rendererContext.cell.value.toString(),
                  style: AppTheme.a14500.copyWith(color: Colors.black)
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
          width: 150,
          title: '단위',
          field: 'qtyUnit',
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
          width: 60,
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
          width: 320,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.left,
          title: '자재명',
          field: 'itemNm',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(4),
              width: 60,
              // color: textColor,
              child: Text(
                  rendererContext.cell.value.toString(),
                  style: AppTheme.a14500.copyWith(color: Colors.black)
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
        enableEditingMode: controller.isDropdownEnabled.value,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        width: 160,
        title: '사유',
        field: 'ncbxRmkName',
        type: PlutoColumnType.select(controller.reasonNames
        ),

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
        enableEditingMode: true,
        enableContextMenu: false,
        enableRowDrag: false,
        enableDropToResize: false,
        enableColumnDrag: false,
        titleTextAlign: PlutoColumnTextAlign.center,
        textAlign: PlutoColumnTextAlign.left,
        width: 160,
        title: '사유비고',
        field: 'remark',
        type: PlutoColumnType.text(),
        checkReadOnly: (PlutoRow row, PlutoCell cell) {
          return !(row.cells['prtNo']!.value == 'O');
        },

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
          title: '단위',
          field: 'qtyUnit',
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
          title: '변경사유',
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



 /* //동기화 테스트
  void testt() async {
    String text = '';
    if(text == '동기화')
    {
      controller.isSaveColor.value = true;
      for(var dong = 0; dong < controller.smallBoxList.length; dong++) {
        controller.noList.add(controller.smallBoxList[dong]['itemCd']);
        // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
        outerLoop:
        for(var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
          // 이미 오른쪽에 스캔된 자재가 있고
          if(controller.smallBoxList[dong]['itemCd'] == controller.smallBoxSaveList[dong2]['itemCd']) {
            // 수량이 부족할 시 -> 동기화 대상
            if(controller.smallBoxList[dong]['cbxQty'] > controller.smallBoxSaveList[dong2]['qty']) {
              controller.smallBoxSaveList[dong2].addAll({'wrkQtySync': controller.smallBoxSaveList[dong2]['qty']});
              controller.smallBoxSaveList[dong2].addAll({'ncbxRmk': ''});
              controller.smallBoxSaveList[dong2].addAll({'syncYn': 'Y'});
              controller.smallBoxSaveList[dong2].addAll({'prtNo': 'O'});
              controller.smallBoxSaveList[dong2]['ncbxRmkName'] = '';
              controller.smallBoxSaveList[dong2].addAll({'qty': controller.smallBoxList[dong]['cbxQty']});
              controller.noSync.value = false;
              break outerLoop;
            }
          }else {
            controller.noSync.value = true;
          }
        }
        if(controller.noSync.value) {
          controller.smallBoxList[dong].addAll({'ncbxRmk': ''});
          controller.smallBoxList[dong].addAll({'syncYn': 'Y'});
          controller.smallBoxList[dong].addAll({'scanYn': 'N'});
          controller.smallBoxList[dong].addAll({'prtNo': 'O'});
          controller.smallBoxList[dong].addAll({'ncbxRmkName': ''});
          controller.smallBoxSaveList.add(controller.smallBoxList[dong]);
        }

        if(controller.smallBoxSaveList[dong]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
          controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글

          // controller.stateManager2.rows[dong].cells['remark']?.
          controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
        }
      }
    }

    controller.no.value = 990;
    controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
        PlutoRow(cells:
        Map.from((controller.smallBoxSaveList[index]).map((key, value) {
          {
            return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
          }

        }
        )))
    );
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

  }
*/
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
              controller.isQrFocus.value = true;
            },
            readOnly: true,
            expands : true,
            minLines: null,
            maxLines: null,
            style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
            // maxLines: 5,
            controller: plag == 0 ? controller.textSaleOrdController : plag == 1 ? controller.textItemCdController
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
                  Get.log('BOM변경확인 조회');
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
                onChanged: (PlutoGridOnChangedEvent event) async {
                  print(event);
                  if (event.column.field == 'chgCfRmk') {
                    print('선택한 값: ${event.value}');
                    controller.bomDetailList[event.rowIdx].addAll({'chgCfRmk': event.value});
                    // bom리스트에서 사유 입력한 값
                    // 바로 insert 해준다 output 결과값 얻고
                    // controller.bomConfirm, Add Location('현재 위치: ') controller.bomConfirm.add(controller.boxNo); 현재 위치에서 out 떄리고
                    // bom 사유에서 변경됐을 경우 rowInx == 0 ? Get.log('')
                  }
                  if (event.column.field == 'chgCfFlagName') {
                    print('선택한 값: ${event.value}');
                    final code = controller.bomConfirm.firstWhere((item) => item['NAME'] == event.value, orElse: () => {'CODE': ''})['CODE'];
                    print('선택한 값의 코드: ${code}');
                    print('선택한 값의 idx: ${event.rowIdx}');
                    controller.bomDetailList[event.rowIdx].addAll({'chgCfFlag': code.toString()});
                    print('최종x: ${controller.bomDetailList[event.rowIdx]['chgCfFlag']}');

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
                                      /*bottomRight: Radius.circular(15)*/))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () async {
                        Get.log('닫기 클릭!');
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: const Color(0x5c3c3c43),)
                            ),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)/*, bottomRight: Radius.circular(15)*/),
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
                                      /*bottomLeft: Radius.circular(15),*/
                                      bottomRight: Radius.circular(15)))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0))),
                      onPressed: () async {
                        Get.log('선택 클릭!');
                        if(controller.popUpDataList2[controller.alertIndex.value]['wrkQty'] <= 0)
                        {
                          Get.dialog(CommonDialogWidget(contentText: '수량이 없이 투입할 수 없습니다.', pageFlag: 0));
                          return;
                        }
                        if(controller.popUpDataList2[controller.alertIndex.value]['remainQty'] < controller.popUpDataList2[controller.alertIndex.value]['wrkQty']){
                          Get.dialog(CommonDialogWidget(contentText: '잔량을 초과하여 투입할 수 없습니다.', pageFlag: 0));
                          return;
                        }
                        Navigator.of(Get.overlayContext!, rootNavigator: true).pop();

                        await controller.registSmallKitItemSaveDup();

                        // 작업구분에서 Y인걸 선택 할 시에는 자재 취소처리
                        /*if(controller.popUpDataList2[controller.alertIndex.value]['wrkYn'] == 'Y' ) {
                          await controller.registSmallKitCancelDup();
                          controller.isSaveColor.value = false;
                          await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                          await controller.test();
                        }else{
                          await controller.registSmallKitItemSaveDup();
                        }*/
                     /*   if(controller.isCancelIpgo.value) {
                          await controller.registSmallKitCancelDup();
                          await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                          await controller.test();
                        }else {
                          await controller.registSmallKitItemSaveDup();
                        }*/
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(color: const Color(0x5c3c3c43),)
                            ),
                            borderRadius: BorderRadius.only(/*bottomLeft: Radius.circular(15),*/ bottomRight: Radius.circular(15)),
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
        }, childCount: controller.popUpDataList2.length)));
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
          if(controller.isSelect2[index] == true) {
            controller.isSelect2[index] = false;

          }else {
            for(var i = 0; i < controller.isSelect2.length; i++) {
              controller.isSelect2[i] = false;
            }
            controller.isSelect2[index] = true;

          }
          /*for(var i = 0; i < controller.smallBoxDataList.length; i++) {
            if(controller.smallBoxDataList[i]['tagNo'] == controller.popUpDataList[index]['tagNo']) {
              controller.alertIndex.value = i;
            }
          }*/
          controller.alertIndex.value = index;
          //  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
        },
        child: Obx(() => Container(
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18, right: 18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: controller.isSelect2[index] ? Border.all(color: AppTheme.black, width: 3) : Border.all(color: AppTheme.ae2e2e2),
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
                   /*   Text('작업여부: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['wrkYn']}', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),*/
                      Text('QR코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['tagNo']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('자재코드: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['itemCd']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('수량: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['qty']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('잔량: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Text('${controller.popUpDataList2[index]['remainQty']}', style: AppTheme.a16400.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      SizedBox(width: 12,),
                      Text('입력수량: ', style: AppTheme.a16700.copyWith(
                        color: AppTheme.a1f1f1f,
                      ),),
                      Container(
                        padding: EdgeInsets.only(top: 4, left: 8),
                        height: 35,
                        width:  100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.ae2e2e2)),
                        child: Center(
                          child: TextFormField(
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            style: AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
                            controller: controller.textWrkQtyControllers[index],
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              fillColor: Colors.white,
                              hintText: '',
                              hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
                              border: InputBorder.none,
                            ),
                            showCursor: true,
                            onTap: () {
                              controller.isQrFocus.value = true;
                            },
                            onChanged: (value) {
                              controller.popUpDataList2[index].addAll({'wrkQty': int.parse(value == '' ? '0' : value)});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              )

            ],
          ),
        ),)
    );
  }
  /// bom popUp에서 점검구분
  Widget _dropDownItem() {
    return Row(
      children: [
        Text('점검구분', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
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
              value: controller.selectedGubun['NAME'],
              items: controller.bomGubun.map((value) {
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
                controller.bomGubun.map((e) {
                  if(e['NAME'] == value) {
                    controller.selectedGubun['CODE'] = e['CODE'];
                    controller.selectedGubun['NAME'] = e['NAME'];
                  }
                }).toList();
              }),
        ),
      ],
    );
  }



  Widget _alertDialog2(BuildContext context, int idx) {
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
                    '자재 재고 선택',
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
        content: _alertBody2(context, idx),

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
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)))),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                        onPressed: () async {
                          controller.smallBoxSaveList[controller.noTagIdx.value].addAll({'tagNo': controller.selectedQrNo.value});
                          Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
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

  Widget _alertBody2(BuildContext context, int idx) {
    return _alertBody(idx);
  }

  Widget _alertBody(int idx) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0))
      ),
      // padding: EdgeInsets.only(top: 40, bottom: 24, left: 16, right: 16),
      height: 600,
      width: 150,
      child: CustomScrollView(
        slivers: [
          // _title(),
          Obx(() =>   controller.popUpDataList.isNotEmpty ?
          _listArea2(idx) : SliverToBoxAdapter(child: Container())),
          SliverToBoxAdapter(child: SizedBox(height: 12,))
          // _bottom(context)
        ],
      ),
    );
  }


  Widget _listArea2(int idx) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          controller.selectedPopList.add(false);
          return _listItem2(index: index, context: context, idx: idx);
        }, childCount: controller.popUpDataList.length));
  }

  Widget _listItem2({required BuildContext context, required int index , required int idx}) {


    //  var regDttmFirstIndex =
    //  controller.noticeList[index].regDttm.toString().lastIndexOf(' ');

    return Obx(() => TextButton(
      style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5)))),
          /*backgroundColor: MaterialStateProperty.all<Color>(
                AppTheme.light_primary,
              ),*/
          padding:
          MaterialStateProperty.all(const EdgeInsets.all(0))),
      onPressed: () {
        if(controller.selectedPopList.isNotEmpty) {
          if(controller.selectedPopList[index] == true) {
            controller.selectedPopList[index] = false;
            //  controller.isChoiceSheet.value = false;
            if(controller.selectedQrNo.value.contains(',')) {
              if(controller.selectedQrNo.value.contains('${controller.popUpDataList[index]['tagNo']}')) {
                controller.selectedQrNo.value = controller.selectedQrNo.value.replaceAll('${controller.popUpDataList[index]['tagNo']}', '');
                if(controller.selectedQrNo.value.contains(',,')){
                  controller.selectedQrNo.value = controller.selectedQrNo.value.replaceAll(',,',',');
                }
                if(controller.selectedQrNo.value.startsWith(',')) {
                  controller.selectedQrNo.value = controller.selectedQrNo.value.replaceFirst(',', '');
                }
              }

            }else {
              controller.selectedQrNo.value = '';
            }

          }else {

            controller.selectedPopList[index] = true;
            if(controller.selectedPopList[index] == true) { // 선택했다
              //    controller.isChoiceSheet.value = true;

              controller.selectedItemPopContainer.add(controller.popUpDataList[index]);
              if(controller.selectedQrNo.value != '') {
                controller.selectedQrNo.value = '${controller.selectedQrNo.value},${controller.popUpDataList[index]['tagNo']}';
              }else {
                controller.selectedQrNo.value = controller.popUpDataList[index]['tagNo'];
              }
            }
          }
        }

        Get.log('controller.selectedQrNo.value:: ${controller.selectedQrNo.value}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 12),
                padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  border: controller.selectedPopList.isNotEmpty ?controller.selectedPopList[index] == true ? Border.all(color: AppTheme.black, width: 2) : Border.all(color: AppTheme.gray_c_gray_200) : Border.all(color: AppTheme.gray_c_gray_200),
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('QR 코드', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['tagNo']}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('자재코드', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['itemCd']}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('자재명', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['itemNm'].toString().trim()}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('수량', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['qty']}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    ),

    );
  }
  /// 행 추가 팝업
  Widget _alertDialog3(BuildContext context) {

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
                    '행 추가',
                    style: AppTheme.a22700
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

          ],
        ),

        content: _alertBody3(context), /// 내부 메인body

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
                        controller.textQrController.text = controller.smallBoxItemDataList[0]['cbxSuNo'].toString();
                        await controller.registMainKitAddRow();
                        await controller.checkBoxItemData();
                        await controller.checkBoxItemSaveData(controller.smallBoxItemDataList[0]['cbxSuNo'].toString());
                        controller.textQrController.text = '';

                        /*controller.addRowList.clear();
                        controller.addRowList.add({
                          'itemCd': controller.textItemCdController.text,
                          'itemNm': controller.textItemNmController.text,
                          'wrkQty': int.parse(controller.textQtyController.text),
                          'setQty': int.parse(controller.textSetController.text),
                          'qtyUnit': controller.textUnitController.text,
                          'prtNo': 'X',
                          'itemNmNonKit': controller.textItemNmController.text,
                          'syncYn': 'N',
                          'scanYn': 'N',
                          'ncbxRmk': '60',
                          'ncbxRmkName': 'KIT 외 구성품',
                          'cbxExNo': '${controller.smallBoxItemDataList[0]['cbxExNo']}-E',
                          'cbxExSeq': controller.smallBoxSaveList.length+1,
                          'setCbxQty': '0',
                          'cbxQty': controller.textQtyController.text
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
                        controller.textAddRowItemCdController.text = '';
                        controller.textAddRowItemNmController.text = '';
                        controller.textAddRowQtyController.text = '';
                        controller.textAddRowSetController.text = '';
                        controller.textAddRowUnitController.text = '';

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
                          child: Text('저장',
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
                        Get.log('닫기 클릭!');
                        controller.isQrFocus.value = false;
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

  Widget _alertBody3(BuildContext context) {
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
            SizedBox(height: 8,),
            Container(
              width: MediaQuery.of(context).size.width - 10,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _subData2('프로젝트명', controller.projectNm.value, true),
                    SizedBox(width: 32,),
                    _subData2('자재코드/자재명', controller.itemCdNm.value.trim(), true),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                _subData2('박스번호', controller.boxNo.value, false),
                /*    SizedBox(width: 32,),
                _subData2('확정일', controller.wrkCfmDt.value ?? '', false),*/
              ],
            ),
            SizedBox(width: 32,),

            SizedBox(height: 4,),
            Container(
              color: AppTheme.dark_text_secondary,
              height: 1,
            ),
            SizedBox(height: 12,),
            _alertInput3('자재코드'),
            SizedBox(height: 4,),
            _alertInput3('자재명'),
            SizedBox(height: 4,),
            _alertInput3('수량'),
            SizedBox(height: 4,),
            /*  _alertInput('세트'),
            SizedBox(height: 4,),*/
            _alertInput3('단위'),
          ],
        ),
      ),
    );
  }

  Widget _alertInput3(String title) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Text(title, style: AppTheme.a24700.copyWith(color: AppTheme.black), textAlign: TextAlign.right, ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Container(
            width: 200,
            padding: const EdgeInsets.only(left: 16, right: 6),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.white
            ),
            child: Center(
              child: TextFormField(
                minLines: null,
                maxLines: null,
                style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
                controller: title == '자재코드' ? controller.textAddRowItemCdController : title == '자재명' ? controller.textAddRowItemNmController : title == '수량' ? controller.textAddRowQtyController
                    : title == '세트' ? controller.textAddRowSetController : title == '단위' ? controller.textAddRowUnitController : controller.textAddRowItemCdController,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(

                  contentPadding: const EdgeInsets.only(bottom: 8),
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
      ],
    );
  }


  Widget _deleteAddRowAlertDialog(BuildContext context, int rowIdx) {

    return AlertDialog(
        backgroundColor: AppTheme.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        title: Container(
          height: 0,
        ),

        content: Container(
          width: 400,
          height: 100,
          child: Center(
            child: Text('행추가 건을 삭제하시겠습니까?', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
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
          Container(
            width: 400,
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
                          controller.deleteYes.value = false;
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
                          Get.log('삭제 클릭!');
                          await controller.deleteMainKitAddRow(rowIdx);
                          // 전체 재조회
                          controller.deleteYes.value = true;
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
                            child: Text('삭제',
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
}


