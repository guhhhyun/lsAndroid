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
import 'package:lsandroid/app/pages/otherKit/other_kit_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class OtherKitPage extends StatelessWidget {
  OtherKitPage({super.key});
  OtherKitController controller = Get.find();
  final focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    controller.isFocus.value == false ? controller.requestFocus() : null;
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
                  CommonAppbarWidget(title: '별도 박스 KIT 작업', isLogo: false, isFirstPage: true ),
                  Obx(() => _main(context),),
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
                if(controller.isSaveColor.value) {
                  for(var i = 0; i < controller.noList.length; i++) {
                    controller.changedRows.value.add(controller.noList[i]);
                  }
                  if (controller.changedRows.contains(c.row.cells['itemCd']?.value.toString())) {
                    return Colors.white; // 이미 변경된 색상 유지
                  }else {
                    return AppTheme.red_red_200;
                  }
                }else {
                  if (controller.isColor.value) {
                    for(var i = 0; i < controller.noList2.length; i++) {
                      // controller.changedRows.value.add(controller.noList[i]);
                      controller.changedRows2.value.add(controller.noList2[i]);
                      /*   if (controller.changedRows.contains(controller.uniqueSmallBoxList[0]['itemCd'])) {
                        return Colors.white; // 이미 변경된 색상 유지
                      }*/
                    }
                    if (controller.changedRows2.contains(c.row.cells['itemCd']?.value.toString())) {
                      return Colors.white; // 이미 변경된 색상 유지
                    }else {
                      return AppTheme.red_red_200;
                    }

                  }
                }
               /* if (controller.changedRows.contains(c.row.cells['itemCd']?.value.toString())) {
                  return Colors.white; // 이미 변경된 색상 유지
                }
                if (controller.changedRows2.contains(c.row.cells['itemCd']?.value.toString())) {
                  return Colors.white; // 이미 변경된 색상 유지
                }*/

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
                // stateManager.setShowColumnFilter(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
                print('$event aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
                // Get.log('그리드 변겸됐다');
                if (event.column.field == 'ncbxRmkName') {
                  print('선택한 값: ${event.value}');
                  // NAME 값이 event.value와 같은 항목의 CODE를 가져옴
                  final code = controller.reasonDropdownList
                      .firstWhere((item) => item['NAME'] == event.value, orElse: () => {'CODE': ''})['CODE'];
                  controller.smallBoxSaveList[event.rowIdx]['ncbxRmk'] = code.toString();
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
                                child: TextFormField(
                                  minLines: null,
                                  expands: true,
                                  maxLines: null,
                                  focusNode: controller.focusNode,
                                  style:  AppTheme.a16400.copyWith(color: AppTheme.black),
                                  controller: controller.textQrController,
                                  textAlignVertical: TextAlignVertical.center,
                                  textInputAction: TextInputAction.done,
                                  onTap: () {

                                    if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                                    else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                  },
                                  onTapOutside:(event) => { controller.focusCnt.value = 0 },

                                  onFieldSubmitted: (value) async {
                                    controller.isFocus.value = false;
                                    if(controller.smallBoxList.isEmpty)
                                    {
                                      await controller.checkQR();
                                      await controller.checkQRZero();
                                      if(controller.smallBoxList.isNotEmpty) {
                                        for(var i = 0; i < controller.smallBoxList.length; i++) {
                                          controller.smallBoxList[i].addAll({'no': '${i+1}'});
                                          controller.smallBoxList[i].addAll({'setQty': controller.smallBoxList[i]['setQty'] ?? 0});
                                          controller.smallBoxList[i].addAll({'setCbxQty': controller.smallBoxList[i]['setCbxQty'] ?? 0});
                                          String original = controller.smallBoxList[i]['setCbxQty'].toString();
                                          String modified = original.split('.').first; // 소수점 앞부분만 가져옴
                                          controller.smallBoxList[i].addAll({'itemNm': controller.smallBoxList[i]['itemNm'].toString().trim()});
                                          controller.smallBoxList[i].addAll({'setQty': int.parse(controller.smallBoxList[i]['setQty'].toString())
                                              * int.parse(modified)});

                                        }
                                        for(var i = 0; i < controller.smallBoxListZero.length; i++) {
                                          controller.smallBoxListZero[i].addAll({'no': '${i+1}'});
                                          controller.smallBoxListZero[i].addAll({'setQty': controller.smallBoxListZero[i]['setQty'] ?? 0});
                                          controller.smallBoxListZero[i].addAll({'setCbxQty': controller.smallBoxListZero[i]['setCbxQty'] ?? 0});
                                          String original = controller.smallBoxListZero[i]['setCbxQty'].toString();
                                          String modified = original.split('.').first; // 소수점 앞부분만 가져옴
                                          controller.smallBoxListZero[i].addAll({'itemNm': controller.smallBoxListZero[i]['itemNm'].toString().trim()});
                                          controller.smallBoxListZero[i].addAll({'setQty': int.parse(controller.smallBoxListZero[i]['setQty'].toString())
                                              * int.parse(modified)});
                                        }
                                        for(var i = 0; i < controller.smallBoxList.length; i++) {
                                          if(controller.smallBoxList[0]['syncYn'] == 'Y') { //동기화가 O인 것만 드롭다운 버튼 활성화
                                            controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글
                                            controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
                                            break;
                                          }
                                        }
                                        controller.rows.value = List<PlutoRow>.generate(controller.smallBoxListZero.length, (index) =>
                                            PlutoRow(cells:
                                            Map.from((controller.smallBoxListZero[index]).map((key, value) =>
                                                MapEntry(key, PlutoCell(value: value ?? '')),
                                            )))
                                        );

                                        //  controller.rowDatas2.add(controller.insertRow[0]);
                                        controller.stateManager.removeAllRows();
                                        controller.stateManager.appendRows(controller.rows.value);
                                        controller.textQrController.text = '';



                                        for(var i = 0; i < controller.smallBoxList.length; i++) {
                                          /// 저장된 값이 있다면
                                          if(controller.smallBoxList[i]['wrkQty'] != null) {
                                            if(controller.smallBoxList[i]['wrkQty'] > 0) {
                                              /// 우측에 아직 들어간 값이 없다면 그냥 INSERT
                                              if(controller.smallBoxSaveList.isEmpty) {
                                                /// 디테일이 아닌경우
                                                if(controller.smallBoxList[i]['dScanNo'] == null) {
                                                  Get.log('controller.smallBoxList[i][wrkQty] ${controller.smallBoxList[i]['wrkQty']}');
                                                  controller.smallBoxSave.clear();
                                                  controller.smallBoxSave.add(controller.smallBoxList[i]);
                                                  controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                  controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                                  controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                                  controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                                  controller.smallBoxSave[0].addAll({'cbxExNo': '${controller.smallBoxList[i]['cbxExNo']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxList[i]['cbxExSeq']}'});
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
                                                }else { /// 디테일인 경우
                                                  Get.log('controller.smallBoxList[i][wrkQty] ${controller.smallBoxList[i]['wrkQty']}');
                                                  controller.smallBoxSave.clear();
                                                  controller.smallBoxSave.add(controller.smallBoxList[i]);
                                                  controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                  controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                                  controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                                  controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                                  controller.smallBoxSave[0].addAll({'cbxExNo': '${controller.smallBoxList[i]['cbxExNo']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxList[i]['cbxExSeq']}'});
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
                                                  controller.smallBoxSave[0].addAll({'extrVal': 'D'});

                                                  controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
                                                  controller.smallBoxDetailList.add(controller.smallBoxSave[0]); /// 디테일에 인서트

                                                }

                                              } /// 우측에 저장된 값이 있으면 이미 우측에 들어간 itemCd가 있는지 확인해야한다. 있으면 수량만 +시켜주고 없으면 그냥 insert 해준다.
                                              /// 이 경우 디테일이다
                                              else {
                                                for(var saveInx = 0; saveInx < controller.smallBoxSaveList.length; saveInx++) {
                                                  if(controller.smallBoxList[i]['itemCd'] == controller.smallBoxSaveList[saveInx]['itemCd']) {
                                                    controller.smallBoxSaveList[saveInx].addAll({'qty':
                                                    int.parse(controller.smallBoxSaveList[saveInx]['qty'].toString()) + int.parse(controller.smallBoxList[i]['wrkQty'].toString())});

                                                    controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                    controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                                    controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                                    controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                                    controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                                    controller.smallBoxSave[0].addAll({'cbxExNo': '${controller.smallBoxList[i]['cbxExNo']}'});
                                                    controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxList[i]['cbxExSeq']}'});
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
                                                    controller.smallBoxSave[0].addAll({'extrVal': 'D'});
                                                    controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
                                                    controller.isSaveListDup.value = false;
                                                    break;
                                                  }else {
                                                    controller.isSaveListDup.value = true;
                                                  }
                                                }
                                                if(controller.isSaveListDup.value) {
                                                  Get.log('controller.smallBoxList[i][wrkQty] ${controller.smallBoxList[i]['wrkQty']}');
                                                  controller.smallBoxSave.clear();
                                                  controller.smallBoxSave.add(controller.smallBoxList[i]);
                                                  controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                  controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                                  controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                                  controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                                  controller.smallBoxSave[0].addAll({'cbxExNo': '${controller.smallBoxList[i]['cbxExNo']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxList[i]['cbxExSeq']}'});
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
                                                }
                                              }


                                            }
                                          }
                                        }

                                      }
                                      for(var i = 0; i < controller.addRowSaveList.length; i++) {

                                        controller.addRowSaveList[i].addAll({'no': '0${i + 1}'});
                                        controller.addRowSaveList[i].addAll({'prtNo': controller.addRowSaveList[i]['syncYn'] == 'Y' ? 'O' : 'X'});
                                      //  controller.addRowSaveList[i].addAll({'itemNmNonKit': ''});
                                        controller.addRowSaveList[i].addAll({'qty': '${controller.addRowSaveList[i]['wrkQty']}'});
                                        for(var a = 0; a < controller.smallBoxSaveList.length; a++) {
                                          if(controller.smallBoxSaveList[a]['itemCd'] == controller.addRowSaveList[i]['itemCd']) {
                                            controller.isOther.value = true;
                                            break;
                                          }else {
                                            controller.isOther.value = false;
                                          }
                                        }
                                        controller.isOther.value == false ?
                                        controller.smallBoxSaveList.add(controller.addRowSaveList[i]) : null;


                                      }
                                      controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                                          PlutoRow(cells:
                                          Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                                          )))
                                      );
                                      controller.stateManager2.removeAllRows();
                                      controller.stateManager2.appendRows(controller.rows2);
                                      for(var i = 0; i < controller.smallBoxList.length; i++) {
                                        await controller.test();
                                        if(controller.smallBoxList[i]['wrkQty'].toString() == controller.smallBoxList[i]['cbxQty'].toString()) {
                                          controller.isSaveColor.value = false;
                                          controller.noList2.add(controller.smallBoxList[i]['itemCd'].toString());
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


                                    controller.focusNode.requestFocus();
                                    Future.delayed(const Duration(), (){
                                      controller.focusNode.requestFocus();
                                      Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    labelStyle: AppTheme.a16400.copyWith(color: AppTheme.black),
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
                Container(
                  width: MediaQuery.of(context).size.width - 10,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _subData2('프로젝트명', controller.projectNm.value == null ? controller.projectNm.value : controller.projectNm.value, true),
                        SizedBox(width: 32,),
                        _subData2('자재코드/자재명', controller.itemCdNm.value.trim(), true),
                        SizedBox(width: 32,),
                        _subData2('박스번호', controller.boxNo.value, false),
                        SizedBox(width: 32,),
                        _subData2('확정일', controller.wrkCfmDt.value == 'null' ? '' : controller.wrkCfmDt.value, false)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _subDataMemo('메모'),
                    Row(
                      children: [

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
                              Get.log('조회 클릭!');
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
                        ),

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
                              Get.log('조회 클릭!');
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
                              color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          width: 55,
                          height: 55,
                        ),),
                      ],
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

  Future<void> aa1() async{
    if(controller.duplicationQr.value == false){

      if(controller.smallBoxSave.isNotEmpty) {
        for(var i = 0; i < controller.smallBoxListZero.length; i++) {
          if(controller.smallBoxListZero[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
            controller.no.value = i;
            break;
          }
        }
        // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시
        if(controller.duplicationQr2.value && int.parse(controller.smallBoxListZero[controller.no.value]['cbxQty'].toString()) > int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())) {
          controller.isColor.value = false;
          controller.smallBoxSave[0].addAll({'scanYn': 'Y'});
          controller.smallBoxSave[0].addAll({'scanNo': controller.textQrController.text});
          controller.smallBoxSave[0].addAll({'syncYn': 'N'});
          controller.smallBoxSave[0].addAll({'ncbxRmk': ''});
          controller.smallBoxSave[0].addAll({'syncYn': 'N'});
          controller.smallBoxSave[0].addAll({'cbxExNo': '${controller.smallBoxListZero[controller.no.value]['cbxExNo']}'});
          controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxListZero[controller.no.value]['cbxExSeq']}'});
          controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxListZero[controller.no.value]['scanSeq']}'});
          controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxListZero[controller.no.value]['itemCd']}'});
          controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxListZero[controller.no.value]['setCbxQty']}'});
          controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxListZero[controller.no.value]['cbxQty']}'});
          controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxListZero[controller.no.value]['setQty']}'});
          controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxListZero[controller.no.value]['qtyUnit']}'});
          controller.smallBoxSave[0].addAll({'wrkQtySync': null});
          controller.smallBoxSave[0].addAll({'extrVal': 'D'});
          controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
          if(int.parse(controller.smallBoxListZero[controller.no.value]['cbxQty'].toString()) <= int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())
        //  if(int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty']) <= int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'])
              + controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']) {
            controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
            controller.isSaveColor.value = false;
            controller.isColor.value = true;
            controller.noList2.add(controller.smallBoxListZero[controller.no.value]['itemCd']);
            controller.test();
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

          for(var i = 0; i < controller.smallBoxListZero.length; i++) {
            if(controller.smallBoxListZero[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
              controller.no.value = i;
              controller.smallBoxSave[0].addAll({'no': '${controller.smallBoxListZero[i]['no']}'});
              controller.smallBoxSave[0].addAll({'scanYn': 'Y'});
              controller.smallBoxSave[0].addAll({'scanNo': controller.textQrController.text});
              controller.smallBoxSave[0].addAll({'syncYn': 'N'});
              controller.smallBoxSave[0].addAll({'cbxExNo': '${controller.smallBoxListZero[i]['cbxExNo']}'});
              controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxListZero[i]['cbxExSeq']}'});
              controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxListZero[i]['scanSeq']}'});
              controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxListZero[i]['itemCd']}'});
              controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxListZero[i]['setCbxQty']}'});
              controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxListZero[i]['cbxQty']}'});
              controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxListZero[i]['setQty']}'});
              controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxListZero[i]['qtyUnit']}'});
              controller.smallBoxSave[0].addAll({'wrkQtySync': null});
            }
          }
          // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
          // 그보다 작을 경우에는 qty 값만큼 입력
          if(controller.rows[controller.no.value].cells['cbxQty']?.value <= (controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt()) {
            controller.smallBoxSave[0]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
            controller.isColor.value = true;

            controller.noList2.add(controller.smallBoxListZero[controller.no.value]['itemCd']);
            await controller.test();
          }else {
            controller.smallBoxSave[0]['qty'] = (controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']).toInt();
            controller.smallBoxSave[0].addAll({'extrVal': 'D'}); /// 저장 시에 DETAIL에 넘겨줘야할 오브젝트 구분
            controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
          }
          controller.smallBoxSave[0]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
          controller.smallBoxSave[0]['ncbxRmkName'] = '';
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
            constraints: BoxConstraints(
              minWidth: 200.0, // 최소 너비 설정
            ),
            height: 50,
            width: null,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
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
            if(text == '행 추가')
            {
              controller.isFocus.value = true;
              controller.smallBoxListZero.isNotEmpty ?
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog(context);
                },
              ) :  Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요', pageFlag: 0));
            /*controller.insertRow.value = List<PlutoRow>.generate(controller.ipgoQrList.length, (index) =>
            PlutoRow(cells:
            Map.from((controller.ipgoQrList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value ?? '' )),
            )))
            ),
            //  controller.rowDatas2.add(controller.insertRow[0]);
            controller.stateManager2.insertRows(controller.ipgoList.length, controller.insertRow)*/
            }

            else if(text == '동기화')
            {
              controller.smallBoxList[0]['wrkCfmYn'] != 'Y' ?
              syncProcess() : Get.dialog(CommonDialogWidget(contentText: '확정 처리된 상태입니다.', pageFlag: 0));
              /*if(controller.isDonggi.value == false) {
                controller.isSaveColor.value = true;
                for(var dong = 0; dong < controller.smallBoxList.length; dong++) {
                  Get.log('smallBoxSaveList: ${controller.smallBoxSaveList}');
                  controller.noList.add(controller.smallBoxList[dong]['itemCd']);

                  // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
                  for (var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
                    // 이미 오른쪽에 스캔된 자재가 있는데 수량이 작다면? -> 동기화 대상
                    if(controller.smallBoxList[dong]['itemCd'] == controller.smallBoxSaveList[dong2]['itemCd']) {
                      controller.noSync.value = false;
                      if (int.parse(controller.smallBoxList[dong]['cbxQty'].toString()) >
                          int.parse(controller.smallBoxSaveList[dong2]['qty'].toString())) {
                        controller.smallBoxSaveList[dong2].addAll({
                          'wrkQtySync': controller
                              .smallBoxSaveList[dong2]['qty']
                        });
                        controller.smallBoxSaveList[dong2].addAll(
                            {'ncbxRmk': ''});
                        controller.smallBoxSaveList[dong2].addAll(
                            {'syncYn': 'Y'});
                        controller.smallBoxSaveList[dong2].addAll(
                            {'prtNo': 'O'});
                        controller.smallBoxSaveList[dong2]['ncbxRmkName'] = '';
                        controller.smallBoxSaveList[dong2].addAll(
                            {'qty': controller.smallBoxList[dong]['cbxQty']});
                        controller.noSync.value = false;
                        break;
                      }else {
                        controller.noSync.value = false;
                        break;
                      }
                    }else {
                      controller.noSync.value = true;
                    }
                  }
                  if(controller.noSync.value) {
                    controller.smallBoxList[dong].addAll({
                      'wrkQtySync': 0
                    });
                    controller.smallBoxList[dong].addAll(
                        {'ncbxRmk': ''});
                    controller.smallBoxList[dong].addAll(
                        {'syncYn': 'Y'});
                    controller.smallBoxList[dong].addAll(
                        {'prtNo': 'O'});
                    controller.smallBoxList[dong].addAll(
                        {'ncbxRmkName': ''});
                    controller.smallBoxList[dong].addAll(
                        {'qty': controller.smallBoxList[dong]['cbxQty']});
                    controller.smallBoxSaveList.add(controller.smallBoxList[dong]);
                  }

                }
                for(var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
                  if(controller.smallBoxSaveList[dong2]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
                    controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글
                    controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
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
                controller.isDonggi.value = true;
              }*/

              /*controller.isColor.value = true;
              for(var dong = 0; dong < controller.smallBoxList.length; dong++) {
                // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
                await controller.checkItemQr(controller.smallBoxList[dong]['itemCd']);
                if(controller.duplicationQr.value == false){
                  if(controller.smallBoxSave.isNotEmpty) {
                    for(var i = 0; i < controller.smallBoxList.length; i++) {
                      controller.smallBoxList[i]['itemCd'].toString() == controller.smallBoxSave[0]['itemCd'] ?
                      {
                        controller.no.value = i,
                        controller.smallBoxSave[0].addAll({'no': '${controller.smallBoxList[i]['no']}'}),
                        controller.smallBoxSave[0].addAll({'ncbxRmk': ''}),
                        controller.smallBoxSave[0].addAll({'wrkQtySync': null}),
                        controller.smallBoxSave[0].addAll({'cbxExNo': controller.smallBoxList[i]['cbxExNo']}),
                        controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxList[i]['cbxExSeq']}'}),
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
                      } : null;
                    }

                    for(var dong2 = 0; dong2 < controller.smallBoxList.length; dong2++) {


                      // 값이 String 타입이라면 int로 변환, 이미 int라면 그대로 사용
                      if (controller.smallBoxList[dong2]['cbxQty'] is String) {
                        cbxQty = int.parse(controller.smallBoxList[dong2]['cbxQty']);
                      } else {
                        cbxQty = controller.smallBoxList[dong2]['cbxQty'];
                      }
                      if(controller.smallBoxSave[0]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                        if(controller.smallBoxSave[0]['qty'].toInt() < cbxQty) {
                          controller.smallBoxSave[0]['qty'] = controller.smallBoxList[dong2]['cbxQty'];
                          // controller.smallBoxDetailList.add(controller.smallBoxSave[0]) // 디테일 리스트에 추가
                        }
                      }
                      // },
                    }
                    controller.smallBoxSave[0]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
                    controller.smallBoxSave[0]['prtNo'] = 'O';

                    controller.smallBoxSave[0]['ncbxRmkName'] = '';
                    // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
                    // 그보다 작을 경우에는 qty 값만큼 입력


                    controller.duplicationQr2.value ? null : controller.smallBoxSaveList.add(controller.smallBoxSave[0]);

                    for(var dong2 = 0; dong2 < controller.smallBoxList.length; dong2++) {
                      for(var i = 0; i < controller.smallBoxSaveList.length; i++) {
                        if(controller.smallBoxSaveList[i]['prtNo'] == 'X') {
                          if(controller.smallBoxSaveList[i]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                            if(controller.smallBoxSaveList[i]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                              if(int.parse(controller.smallBoxSaveList[i]['qty']) < int.parse(controller.smallBoxList[dong2]['cbxQty'])) {
                                // 동기화 전에 원래 값을 저장해둠
                                controller.smallBoxSaveList[i]['wrkQtySync'] = controller.smallBoxSaveList[i]['qty'];
                                controller.smallBoxSaveList[i]['qty'] = controller.smallBoxList[dong2]['cbxQty'];
                                Get.log('뭐지 ${controller.smallBoxSaveList[i]['qty']}');
                              }
                            }
                          }
                        }
                      }
                    }
                    for(var ii = 0; ii < controller.smallBoxSaveList.length; ii++) {
                      if(controller.smallBoxSaveList[ii]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
                        controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글

                        // controller.stateManager2.rows[dong].cells['remark']?.
                        controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode

                      }
                    }


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

              Get.log('동기화 is: ${controller.isDropdownEnabled.value}');*/
            }
            else if(text == '저장')
            {
              if(controller.isSaveClick.value == false) { // 중복방지 로직
                controller.isSaveClick.value = true;
                Get.log('저장할 리스트!: ${controller.smallBoxSaveList.length}');
                await controller.registSmallKitSave();
                await controller.registSmallKitDetailSave();
                await controller.registMemoSmallKitSave();
                controller.isSave.value ?
                Get.dialog(CommonDialogWidget(contentText: '저장되었습니다.', pageFlag: 0)) :
                Get.dialog(CommonDialogWidget(contentText: '${controller.isSaveText.value}.', pageFlag: 0));
              }
              // await controller.registSmallKitDetailSave()
            }
             else if(text == '동기화 취소')
            {
              Get.log('동기화 취소');
              Get.log('동기화 취소1: ${controller.smallBoxSaveList.length}');
              // smallBoxSaveList의 리스트에 changedRows에 {1,2} 가 있는데 smallBoxSaveList[1]이 존재하지않으면 ch
              if(controller.smallBoxList[0]['wrkCfmYn'] != 'Y') {
                controller.isColor.value = false;
                controller.isSaveColor.value = true;
                controller.changedRows.clear();
                controller.isDonggi.value = false;

                controller.smallBoxSaveList.removeWhere((item) {
                  bool shouldRemove = false;

                  if (item['ncbxRmk'] == '' && item['prtNo'] == 'O') {
                    if(item['wrkQtySync'].toString() == '0') {
                      int index = controller.smallBoxListZero.indexWhere((element) => element['no'] == item['no']);

                      controller.noList.remove(item['itemCd']);
                      controller.test();
                      shouldRemove = true;
                      controller.test();
                    }else {
                      int index = controller.smallBoxListZero.indexWhere((element) => element['no'] == item['no']);
                      controller.smallBoxSaveList[index].addAll({'qty': '${controller.smallBoxSaveList[index]['wrkQtySync']}'});
                      controller.smallBoxSaveList[index].addAll({'prtNo': 'X'});
                      controller.smallBoxSaveList[index].addAll({'syncYn': 'N'});
                      Get.log('qty::: ${controller.smallBoxSaveList[index]['qty']}');
                      controller.noList.remove(item['itemCd']);
                      shouldRemove = false;
                      controller.test();
                    }
                  }else if(item['ncbxRmk'] != '' && item['prtNo'] == 'O') {
                    Get.log('동기화 안돼!');
                  }
                  return shouldRemove;
                });
                await controller.test();
                controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                    PlutoRow(cells:
                    Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                        MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                    )))
                );
                controller.stateManager2.removeAllRows();
                controller.stateManager2.appendRows(controller.rows2.value);

              }else {
                Get.dialog(CommonDialogWidget(contentText: '확정 처리된 상태입니다.', pageFlag: 0));
              }
            }
             else if(text == '확정')
            {
              if(controller.isConfirmClick.value == false) {
                controller.isConfirmClick.value = true;
                Get.dialog(
                  Center(child: CircularProgressIndicator()),
                  barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
                );
                try{
                  await controller.registSmallKitSave();
                  await controller.registSmallKitDetailSave();
                  await controller.registSmallKitConfirm('Y') ;
                  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                }catch(e) {
                  Get.log('$e');
                }finally {
                  controller.isConfirm.value ?
                  Get.dialog(CommonDialogWidget(contentText: '확정되었습니다.', pageFlag: 0)) :
                  Get.dialog(CommonDialogWidget(contentText: '${controller.isConfirmText.value}.', pageFlag: 0));
                  controller.focusNode.unfocus();
                }
              }


            }
            else if(text == '확정 취소')
            {
              await controller.registSmallKitConfirm('N');
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정 취소되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '취소되지않았습니다.', pageFlag: 0));
              controller.focusNode.unfocus();
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

  /// 동기화 로직
  void syncProcess() async {
    if(controller.isDonggi.value == false) {
      controller.isColor.value = false;
      controller.isSaveColor.value = true;
      for(var dong = 0; dong < controller.smallBoxListZero.length; dong++) {
        Get.log('smallBoxSaveList: ${controller.smallBoxListZero}');
        controller.noList.add(controller.smallBoxListZero[dong]['itemCd']);
        await controller.test();
        if(controller.smallBoxSaveList.isEmpty){
          controller.noSync.value = true;
        }
        // 동기화 시에 수량이 왼쪽 수량보다 적을 시 수량 맞춰주는 동기화(수량, 동기화(prt_no) 값 바꾸기)
        for (var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
          // 이미 오른쪽에 스캔된 자재가 있는데 수량이 작다면? -> 동기화 대상
          if(controller.smallBoxListZero[dong]['itemCd'] == controller.smallBoxSaveList[dong2]['itemCd']) {
            controller.noSync.value = false;
            if (int.parse(controller.smallBoxListZero[dong]['cbxQty'].toString()) >
                int.parse(controller.smallBoxSaveList[dong2]['qty'].toString())) {
              controller.smallBoxSaveList[dong2].addAll({
                'wrkQtySync': controller
                    .smallBoxSaveList[dong2]['qty']
              });
              controller.smallBoxSaveList[dong2].addAll(
                  {'ncbxRmk': ''});
              controller.smallBoxSaveList[dong2].addAll(
                  {'syncYn': 'Y'});
              controller.smallBoxSaveList[dong2].addAll(
                  {'prtNo': 'O'});
              controller.smallBoxSaveList[dong2]['ncbxRmkName'] = '';
              controller.smallBoxSaveList[dong2].addAll(
                  {'qty': controller.smallBoxListZero[dong]['cbxQty']});
              controller.smallBoxSaveList[dong2].addAll(
                  {'boxNo': controller.smallBoxListZero[dong]['cbxSuNo']});
              controller.noSync.value = false;
              break;
            }else {
              controller.noSync.value = false;
              break;
            }
          }else {
            controller.noSync.value = true;
          }
        }
        if(controller.noSync.value) {
          controller.smallBoxListZero[dong].addAll({
            'wrkQtySync': 0
          });
          controller.smallBoxListZero[dong].addAll(
              {'ncbxRmk': ''});
          controller.smallBoxListZero[dong].addAll(
              {'syncYn': 'Y'});
          controller.smallBoxListZero[dong].addAll(
              {'prtNo': 'O'});
          controller.smallBoxListZero[dong].addAll(
              {'ncbxRmkName': ''});
          controller.smallBoxListZero[dong].addAll(
              {'qty': controller.smallBoxListZero[dong]['cbxQty']});
          controller.smallBoxListZero[dong].addAll(
              {'boxNo': controller.smallBoxListZero[dong]['cbxSuNo']});
          controller.smallBoxSaveList.add(controller.smallBoxListZero[dong]);
        }
        await controller.test();
      }
      for(var dong2 = 0; dong2 < controller.smallBoxSaveList.length; dong2++) {
        if(controller.smallBoxSaveList[dong2]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
          controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글
          controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
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
      controller.isDonggi.value = true;
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
              padding: EdgeInsets.all(0),
              width: 60,
              // color: textColor,
              child: Text(
                    rendererContext.cell.value.toString(),
                    style: AppTheme.a14500.copyWith(color: Colors.black),
                textAlign: TextAlign.left,
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
/*      PlutoColumn(
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
      ),*/
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

        content: _alertBody(context), /// 내부 메인body

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
                        controller.addRowList.clear();
                        controller.addRowList.add({
                          'itemCd': controller.textItemCdController.text,
                          'itemNm': controller.textItemNmController.text,
                          'qty': int.parse(controller.textQtyController.text),
                          'setQty': int.parse(controller.textSetController.text),
                          'qtyUnit': controller.textUnitController.text,
                          'prtNo': 'X',
                          'itemNmNonKit': controller.textItemNmController.text,
                          'syncYn': 'N',
                          'scanYn': 'N',
                          'ncbxRmk': '60',
                          'ncbxRmkName': 'KIT 외 구성품',
                          'cbxExNo': '${controller.smallBoxList[0]['cbxExNo']}-E',
                          'cbxExSeq': controller.smallBoxSaveList.length+1,
                          'setCbxQty': '0',
                          'cbxQty': controller.textQtyController.text
                        });
                        controller.smallBoxSaveList.add(controller.addRowList[0]);
                        List<dynamic> withLeadingZero = controller.smallBoxSaveList.where((item) => item['no'].toString().startsWith('0')).toList();
                        controller.addRowList[0].addAll({'no': '0${withLeadingZero.length + 1}'});
                        controller.insertRow.value = List<PlutoRow>.generate(controller.addRowList.length, (index) =>
                            PlutoRow(cells:
                            Map.from((controller.addRowList[index]).map((key, value) {
                              {
                                return MapEntry(key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
                              }
                            }
                            )))
                        );
                        controller.stateManager2.insertRows(controller.smallBoxSaveList.length, controller.insertRow);
                        //  controller.addRowList[0].addAll({'cbxSuSeq': '${controller.smallBoxList[i]['cbxSuSeq']}'});
                      //  controller.addRowList[0].addAll({'scanSeq': '${controller.smallBoxList[i]['scanSeq']}'});
                        Get.dialog(CommonDialogWidget(contentText: '추가되었습니다', pageFlag: 10,));
                        controller.textItemCdController.text = '';
                        controller.textItemNmController.text = '';
                        controller.textQtyController.text = '';
                        controller.textSetController.text = '';
                        controller.textUnitController.text = '';
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
                  SizedBox(width: 32,),
                  _subData2('확정일', controller.wrkCfmDt.value ?? '', false),
                ],
              ),
              SizedBox(width: 32,),

              SizedBox(height: 4,),
              Container(
                color: AppTheme.dark_text_secondary,
                height: 1,
              ),
              SizedBox(height: 12,),
              _alertInput('자재코드'),
              SizedBox(height: 4,),
              _alertInput('자재명'),
              SizedBox(height: 4,),
              _alertInput('수량'),
              SizedBox(height: 4,),
              _alertInput('세트'),
              SizedBox(height: 4,),
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
          child: Text(title, style: AppTheme.a24700.copyWith(color: AppTheme.black), textAlign: TextAlign.right, ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: Container(
           width: 200,
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 6),
              decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.ae2e2e2),
                  borderRadius: BorderRadius.circular(10),
                  color: AppTheme.white
              ),
              child: TextFormField(

                style:  AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                controller: title == '자재코드' ? controller.textItemCdController : title == '자재명' ? controller.textItemNmController : title == '수량' ? controller.textQtyController
                 : title == '세트' ? controller.textSetController : title == '단위' ? controller.textUnitController : controller.textItemCdController,
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
      ],
    );
  }

  /*void donggihwaBackUp() {
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
                controller.smallBoxSave[0].addAll({'cbxExNo': controller.smallBoxList[i]['cbxExNo']}),
                controller.smallBoxSave[0].addAll({'cbxExSeq': '${controller.smallBoxList[i]['cbxExSeq']}'}),
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

            controller.smallBoxSave[0]['ncbxRmkName'] = '',
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
            for(var ii = 0; ii < controller.smallBoxSaveList.length; ii++) {
              if(controller.smallBoxSaveList[ii]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
                controller.isDropdownEnabled.value = true, // 드롭다운 활성화 상태 토글

                // controller.stateManager2.rows[dong].cells['remark']?.
                controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value, //enableEditingMode

              },
            }


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
  }*/
}


