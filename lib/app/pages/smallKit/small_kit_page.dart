import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class SmallKitPage extends StatelessWidget {
   SmallKitPage({super.key});
  SmallKitController controller = Get.find();
   final focusNode = FocusNode();
   final focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    final double height = 60*(double.parse((controller.rows.isEmpty ? 1 : controller.rows.length).toString()));

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

  Widget _grid(BuildContext context) {

    return SliverToBoxAdapter(
      child: Row(
        children: [
          Container(
            color: Colors.white,
            height: 400, //controller.gridHeight.value,
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
                if (controller.changedRows.contains(c.rowIdx)) {
                  return Colors.white; // 이미 변경된 색상 유지
                }
                // 특정 조건에 해당하는 row의 색을 바꾸기
                Get.log('no::::: ${controller.no.value}');
                if(controller.isSaveColor.value) {
                  for(var i = 0; i < controller.noList.length; i++) {
                    controller.changedRows.value.add(controller.noList[i]);
                  }
                }else {
                  if (c.row.cells['no']?.value.toString() == (controller.no.value + 1).toString() && controller.isColor.value) {
                    controller.changedRows.value.add(c.rowIdx); // 색상이 변경된 행을 RxSet에 추가
                    return Colors.white; // 조건에 맞는 경우에만 색 변경
                  }
                }

                Get.log('색깔: ${controller.changedRows}');
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
            height: 400, //controller.gridHeight.value,
            width: MediaQuery.of(context).size.width/2 - 20,
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
               // Get.log('그리드 변겸됐다');
                if (event.column.field == 'remark') {
                  print('선택한 값: ${event.value}');
                  // NAME 값이 event.value와 같은 항목의 CODE를 가져옴
                  final code = controller.reasonDropdownList
                      .firstWhere((item) => item['NAME'] == event.value, orElse: () => {'CODE': ''})['CODE'];

                  Get.log('controller.smallBoxSaveList[event.rowIdx]: ${controller.smallBoxSaveList[event.rowIdx]}');
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

    double containerWidth = orientation == Orientation.portrait ? 300.0 : 680.0;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.black), bottom: BorderSide(color: AppTheme.black))
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
                              width: 200,
                              child: Container(
                                padding: const EdgeInsets.only(left: 16, right: 6),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppTheme.ae2e2e2),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.white
                                ),
                                child: TextFormField(
                                  focusNode: focusNode,
                                  style:  AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                                  controller: controller.textQrController,
                                  textAlignVertical: TextAlignVertical.center,
                                  textInputAction: TextInputAction.done,
                                  onTap: () {
                                    if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                                    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                  },
                                  onTapOutside:(event) => { controller.focusCnt.value = 0 },

                                  onFieldSubmitted: (value) async {
                                    if(controller.smallBoxList.isEmpty)
                                    {
                                      await controller.checkQR();
                                      if(controller.smallBoxList.isNotEmpty) {
                                        for(var i = 0; i < controller.smallBoxList.length; i++) {
                                          controller.smallBoxList[i].addAll({'no': '${i+1}'});
                                          Get.log('controller.smallBoxList[i][wrkQty]: ${controller.smallBoxList[i]['wrkQty']}');
                                          Get.log('controller.smallBoxList[i][cbxQty]: ${controller.smallBoxList[i]['cbxQty']}');
                                          Get.log('controller.isColor.value: ${controller.isColor.value}');

                                        };
                                        controller.rows.value = List<PlutoRow>.generate(controller.smallBoxList.length, (index) =>
                                            PlutoRow(cells:
                                            Map.from((controller.smallBoxList[index]).map((key, value) =>
                                                MapEntry(key, PlutoCell(value: value ?? '' )),
                                            )))
                                        );
                                        for(var i = 0; i < controller.rows.length; i++) {
                                          controller.rows[i].cells['itemNm']?.value = controller.rows[i].cells['itemNm']?.value.toString().trim();
                                          controller.rows[i].cells['setQty']?.value = (controller.rows[i].cells['setQty']?.value * controller.rows[i].cells['setCbxQty']?.value).toInt();
                                         // controller.rows[i].cells['setQty']?.value = controller.rows[i].cells['setQty']?.value.toInt(),
                                          Get.log('구구: ${ controller.rows[i].cells['setQty']?.value}');
                                        };
                                        //  controller.rowDatas2.add(controller.insertRow[0]);
                                        controller.stateManager.removeAllRows();
                                        controller.stateManager.appendRows(controller.rows.value);
                                        controller.textQrController.text = '';



                                        for(var i = 0; i < controller.smallBoxList.length; i++) {
                                          /// 저장된 값이 있다면
                                          if(controller.smallBoxList[i]['wrkQty'] != null) {
                                            if(controller.smallBoxList[i]['wrkQty'] > 0) {
                                              Get.log('controller.smallBoxList[i][wrkQty] ${controller.smallBoxList[i]['wrkQty']}');
                                              controller.smallBoxSave.clear();
                                              controller.smallBoxSave.add(controller.smallBoxList[i]);

                                              controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                              controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                              controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                              controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                              controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                              controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.smallBoxList[i]['cbxSuNo']}'});
                                              controller.smallBoxSave[0].addAll({'cbxSuSeq': '${controller.smallBoxList[i]['cbxSuSeq']}'});
                                              controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxList[i]['scanSeq']}'});
                                              controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxList[i]['itemCd']}'});
                                              controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxList[i]['setCbxQty']}'});
                                              controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxList[i]['cbxQty']}'});
                                              controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxList[i]['setQty']}'});
                                              controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxList[i]['qtyUnit']}'});
                                              controller.smallBoxSave[0].addAll({'wrkQtySync': '${controller.smallBoxList[i]['wrkQtySync']}'});
                                              controller.smallBoxSave[0].addAll({'remark': '${controller.smallBoxList[i]['wrkRemark']}'});
                                              controller.smallBoxSave[0].addAll({'qty': '${controller.smallBoxList[i]['wrkQty']}'});
                                              controller.smallBoxSave[0].addAll({'prtNo': controller.smallBoxList[i]['syncYn'] == 'Y' ? 'O' : 'X'});
                                              Get.log('');
                                              Get.log('controller.smallBoxSave: ${controller.smallBoxSave}');
                                              controller.smallBoxSaveList.add(controller.smallBoxSave[0]);

                                              Get.log('controller.smallBoxSaveList: ${controller.smallBoxSaveList}');
                                              controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                                                  PlutoRow(cells:
                                                  Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                                                      MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                                                  )))
                                              );
                                              controller.stateManager2.removeAllRows();
                                              controller.stateManager2.appendRows(controller.rows2);
                                            }
                                          }
                                        }

                                      }
                                      for(var i = 0; i < controller.smallBoxList.length; i++) {
                                        await controller.test();
                                        if(controller.smallBoxList[i]['wrkQty'].toString() == controller.smallBoxList[i]['cbxQty'].toString()) {
                                          controller.isSaveColor.value = true;
                                          controller.noList.add(i);
                                          //controller.no.value = i;
                                          controller.isColor.value = true;
                                        }
                                      }
                                      await controller.test();
                                    }
                                    else
                                    {
                                      /// 자재 스캔 시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                      await controller.checkItemQr('');
                                      await controller.test();
                                      await aa1();


                                    }


                                    focusNode.requestFocus();
                                    Future.delayed(const Duration(), (){
                                      focusNode.requestFocus();
                                      Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                    });
                                  },
                                  keyboardType: TextInputType.number,
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
                          ],
                        ),
                        SizedBox(width: 32,),
                        _subData('상태'),
                        Container(
                          alignment: Alignment.centerRight,
                          width: containerWidth,
                          //  width: MediaQuery.of(context).size.width/2 - 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                               // _button('리스트 출력'),
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
                        SizedBox(width: 32,),
                        _subData2('제조번호', controller.wrkNo.value, false),
                        SizedBox(width: 32,),
                        _subData2('박스번호', controller.boxNo.value, false),
                        SizedBox(width: 32,),
                        _subData2('확정일', controller.wrkCfmDt.value ?? '', false)
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
                _subData('메모'),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Future<void> aa1() async{
    if(controller.duplicationQr.value == false){

      if(controller.smallBoxSave.isNotEmpty) {
        for(var i = 0; i < controller.smallBoxList.length; i++) {
          if(controller.smallBoxList[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
            controller.no.value = i;
          }
        }
        // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시
        if(controller.duplicationQr2.value && int.parse(controller.smallBoxList[controller.no.value]['cbxQty']) > int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'])) {
          controller.isColor.value = false;
          controller.smallBoxSave[0].addAll({'scanYn': 'Y'});
          controller.smallBoxSave[0].addAll({'scanNo': controller.textQrController.text});
          controller.smallBoxSave[0].addAll({'syncYn': 'N'});
          controller.smallBoxSave[0].addAll({'ncbxRmk': ''});
          controller.smallBoxSave[0].addAll({'syncYn': 'N'});
          controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.smallBoxList[controller.no.value]['cbxSuNo']}'});
          controller.smallBoxSave[0].addAll({'cbxSuSeq': '${controller.smallBoxList[controller.no.value]['cbxSuSeq']}'});
          controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxList[controller.no.value]['scanSeq']}'});
          controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxList[controller.no.value]['itemCd']}'});
          controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxList[controller.no.value]['setCbxQty']}'});
          controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxList[controller.no.value]['cbxQty']}'});
          controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxList[controller.no.value]['setQty']}'});
          controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxList[controller.no.value]['qtyUnit']}'});
          controller.smallBoxSave[0].addAll({'wrkQtySync': null});
    controller.smallBoxSave[0]['extrVal'] = 'D';
          controller.smallBoxDetailList.add(controller.smallBoxSave[0]); 
          if(int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty']) <= int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'])
              + controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']) {
            controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
          }else {
            controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = (controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty']
                + controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt();
          }

          controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
              PlutoRow(cells:
              Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                  MapEntry(key, PlutoCell(value: value == null ? '' : value )),
              )))
          );
          controller.textQrController.text = '';
          controller.stateManager2.removeAllRows();
          controller.stateManager2.appendRows(controller.rows2);
          controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] == controller.rows[controller.no.value].cells['cbxQty']?.value
            ? controller.isColor.value = true : null;

        }else if(controller.duplicationQr2.value && controller.rows[controller.no.value].cells['cbxQty']?.value == controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty']) {
          Get.log('아무것도 하지마');

        }
        else {

          for(var i = 0; i < controller.smallBoxList.length; i++) {
            if(controller.smallBoxList[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
              controller.no.value = i;
              controller.smallBoxSave[0].addAll({'no': '${controller.smallBoxList[i]['no']}'});
              controller.smallBoxSave[0].addAll({'scanYn': 'Y'});
              controller.smallBoxSave[0].addAll({'scanNo': controller.textQrController.text});
              controller.smallBoxSave[0].addAll({'syncYn': 'N'});
              controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.smallBoxList[i]['cbxSuNo']}'});
              controller.smallBoxSave[0].addAll({'cbxSuSeq': '${controller.smallBoxList[i]['cbxSuSeq']}'});
              controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxList[i]['scanSeq']}'});
              controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxList[i]['itemCd']}'});
              controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxList[i]['setCbxQty']}'});
              controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxList[i]['cbxQty']}'});
              controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxList[i]['setQty']}'});
              controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxList[i]['qtyUnit']}'});
              controller.smallBoxSave[0].addAll({'wrkQtySync': null});
    }
          }
          // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
          // 그보다 작을 경우에는 qty 값만큼 입력
          if(controller.rows[controller.no.value].cells['cbxQty']?.value <= (controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt()) {
            controller.smallBoxSave[0]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
            controller.isColor.value = true;
            await controller.test();
          }else {
            controller.smallBoxSave[0]['qty'] = (controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt();
            controller.smallBoxSave[0]['extrVal'] = 'D'; /// 저장 시에 DETAIL에 넘겨줘야할 오브젝트 구분
            controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
          }
          controller.smallBoxSave[0]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
          controller.smallBoxSave[0]['remark'] = '';
          controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
          controller.smallBoxSaveList[controller.smallBoxSaveList.length - 1]['prtNo'] = 'X';
          Get.log('ㅁㄴㅇㅁㄴㅇㄴ: ${controller.smallBoxSave.length}');

          controller.insertRow.value = List<PlutoRow>.generate(controller.smallBoxSave.length, (index) =>
              PlutoRow(cells:
              Map.from((controller.smallBoxSave[index]).map((key, value) {
                {
                  return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                }

              }
              )))
          );
          for(var i = 0; i < controller.insertRow.length; i++) {
            controller.insertRow[i].cells['itemNm']?.value = controller.insertRow[i].cells['itemNm']?.value.toString().trim();
            controller.insertRow[i].cells['qty']?.value = controller.insertRow[i].cells['qty']?.value.toInt();
            Get.log('구구: ${ controller.insertRow[i].cells['setQty']?.value}');
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


  Widget _subData(String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700.copyWith(color: AppTheme.black),),
        ),
        SizedBox(width: 12,),
        Container(
            width: title == '메모' ? 400 : 200,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(title == '메모' ? '' : controller.textMemoController.text, style: AppTheme.a24400,)
        ),
      ],
    );
  }

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
            int cbxQty;
            text == '동기화' ?
            {
            controller.isColor.value = true,
              for(var dong = 0; dong < controller.smallBoxList.length; dong++) {
                // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
                await controller.checkItemQr(controller.smallBoxList[dong]['itemCd']),
                if(controller.duplicationQr.value == false){
                  if(controller.smallBoxSave.isNotEmpty) {
                    for(var i = 0; i < controller.smallBoxList.length; i++) {
                      controller.smallBoxList[i]['itemCd'].toString() == controller.smallBoxSave[0]['itemCd'] ?
                      {
                      controller.no.value = i,
                      controller.smallBoxSave[0].addAll({'no': '${controller.smallBoxList[i]['no']}'}),
                      controller.smallBoxSave[0].addAll({'ncbxRmk': ''}),
                      controller.smallBoxSave[0].addAll({'wrkQtySync': null}),
                      controller.smallBoxSave[0].addAll({'cbxSuNo': controller.smallBoxList[i]['cbxSuNo']}),
                      controller.smallBoxSave[0].addAll({'cbxSuSeq': '${controller.smallBoxList[i]['cbxSuSeq']}'}),
                   //   controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxList[i]['itemCd']}'}),
                      controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxList[i]['setCbxQty']}'}),
                      controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxList[i]['cbxQty']}'}),
                      controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxList[i]['setQty']}'}),
                      controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxList[i]['qtyUnit']}'}),

                      if(controller.no.value == controller.smallBoxList.length - 1) {
                        controller.changedRows.value.add(controller.no.value)
                      },
                        await controller.test(),
                        if(controller.no.value == controller.smallBoxList.length) {
                          await controller.test(),
                        },
                      } : null
                    },

                      for(var dong2 = 0; dong2 < controller.smallBoxList.length; dong2++) {


                        // 값이 String 타입이라면 int로 변환, 이미 int라면 그대로 사용
                        if (controller.smallBoxList[dong2]['cbxQty'] is String) {
                          cbxQty = int.parse(controller.smallBoxList[dong2]['cbxQty']),
                        } else {
                          cbxQty = controller.smallBoxList[dong2]['cbxQty'],
                        },
                        if(controller.smallBoxSave[0]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                          if(controller.smallBoxSave[0]['qty'].toInt() < cbxQty) {
                            controller.smallBoxSave[0]['qty'] = controller.smallBoxList[dong2]['cbxQty'],
                           // controller.smallBoxDetailList.add(controller.smallBoxSave[0]) // 디테일 리스트에 추가
                          }
                        }
                        // },
                      },
                    controller.smallBoxSave[0]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value,
                    controller.smallBoxSave[0]['prtNo'] = 'O',

                    controller.smallBoxSave[0]['remark'] = '',
                    // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
                    // 그보다 작을 경우에는 qty 값만큼 입력
                    
                    
                   controller.duplicationQr2.value ? null : controller.smallBoxSaveList.add(controller.smallBoxSave[0]),

                    for(var dong2 = 0; dong2 < controller.smallBoxList.length; dong2++) {
                      for(var i = 0; i < controller.smallBoxSaveList.length; i++) {
                        if(controller.smallBoxSaveList[i]['prtNo'] == 'X') {
                          if(controller.smallBoxSaveList[i]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                            if(controller.smallBoxSaveList[i]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                              if(int.parse(controller.smallBoxSaveList[i]['qty']) < int.parse(controller.smallBoxList[dong2]['cbxQty'])) {
                                // 동기화 전에 원래 값을 저장해둠
                                controller.smallBoxSaveList[i]['wrkQtySync'] = controller.smallBoxSaveList[i]['qty'],
                                controller.smallBoxSaveList[i]['qty'] = controller.smallBoxList[dong2]['cbxQty'],
                                Get.log('뭐지 ${controller.smallBoxSaveList[i]['qty']}')
                              }
                            }
                          }
                        }
                      },
                    },

                    if(controller.smallBoxSaveList[dong]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
                      controller.isDropdownEnabled.value = true, // 드롭다운 활성화 상태 토글

                    // controller.stateManager2.rows[dong].cells['remark']?.
                      controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value, //enableEditingMode
                    },


                  },

                },

              },
              controller.no.value = 990,
              controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                  PlutoRow(cells:
                  Map.from((controller.smallBoxSaveList[index]).map((key, value) {
                    {
                      return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                    }

                  }
                  )))
              ),
            // 원하는 기준으로 정렬 (예: 'no' 컬럼 기준 오름차순)
            controller.rows2.value.sort((a, b) {
              int noA = int.parse(a.cells['no']?.value.toString() ?? '0');
              int noB = int.parse(b.cells['no']?.value.toString() ?? '0');
              return noA.compareTo(noB); // 오름차순 정렬
            }),
              controller.stateManager2.removeAllRows(),
             controller.stateManager2.appendRows(controller.rows2.value),
              await controller.test(),
              Get.log('이거이거 ${controller.smallBoxSaveList}'),

            Get.log('동기화 is: ${controller.isDropdownEnabled.value}'),
            }
            : text == '저장' ?
                {
                  Get.log('저장할 리스트!: ${controller.smallBoxSaveList.length}'),
                  await controller.registSmallKitSave(),
                  await controller.registSmallKitDetailSave()
                //  await controller.registSmallKitDetailSave()
                }
            : text == '동기화 취소' ?
            {
              Get.log('동기화 취소'),
              Get.log('동기화 취소1: ${controller.smallBoxSaveList.length}'),
              /*controller.smallBoxSaveList.value = controller.smallBoxSaveList
                  .where((item) => !(item['remark'] == '' && item['prtNo'] == 'O'))
                  .toList(),*/
             // smallBoxSaveList의 리스트에 changedRows에 {1,2} 가 있는데 smallBoxSaveList[1]이 존재하지않으면 ch


              controller.smallBoxSaveList.removeWhere((item) {
                bool shouldRemove = item['remark'] == '' && item['prtNo'] == 'O';
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
              await controller.registSmallKitDetailSave(),
              await controller.registSmallKitConfirm('Y'),
              controller.isConfirm.value ?
                  Get.dialog(CommonDialogWidget(contentText: '확정되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '${controller.isConfirmText.value}.', pageFlag: 0)),
            focusNode.unfocus()

            }
            : text == '확정 취소' ?
            {
              await controller.registSmallKitConfirm('N'),
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정 취소되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '취소되지않았습니다.', pageFlag: 0)),
              focusNode.unfocus()
            }
                : null;
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
          textAlign: PlutoColumnTextAlign.center,
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
          field: 'setQty',
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
          textAlign: PlutoColumnTextAlign.center,
          title: '자재명',
          field: 'itemNm',
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
          width: 60,
          title: '수량',
          field: 'qty',
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
          textAlign: PlutoColumnTextAlign.center,
          width: 160,
          title: '사유',
          field: 'remark',
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
          field: 'setQty',
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
          width: 200,
          title: 'TAG 번호',
          field: 'tagNo',
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
    /*  PlutoColumn(
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 100,
          title: 'Box번호',
          field: 'box',
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
          title: '사유',
          field: 'reason',
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
      ),*/
    ];
    return gridCols2;
  }
}


