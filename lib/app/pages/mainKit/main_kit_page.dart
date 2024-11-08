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
import 'package:lsandroid/app/pages/mainKit/main_kit_controller.dart';
import 'package:pluto_grid/pluto_grid.dart';


class MainKitPage extends StatelessWidget {
  MainKitPage({super.key});
  MainKitController controller = Get.find();
  final focusNode2 = FocusNode();
  @override
  Widget build(BuildContext context) {
    controller.isFocus.value == false ?
    controller.requestFocus() : null;
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
                  CommonAppbarWidget(title: '메인 박스 KIT 작업', isLogo: false, isFirstPage: true ),
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
              //  row.cells['no']
                if (controller.changedRows2.contains(c.row.cells['itemCd']?.value.toString())) {
                  return Colors.white; // 이미 변경된 색상 유지
                }
                if (controller.changedRows.contains(c.row.cells['itemCd']?.value.toString())) {
                  return Colors.white; // 이미 변경된 색상 유지
                }
                // 특정 조건에 해당하는 row의 색을 바꾸기
                Get.log('no::::: ${controller.no.value}');
                if(controller.isSaveColor.value) {
                  for(var i = 0; i < controller.noList2.length; i++) {
                   // controller.changedRows.value.add(controller.noList[i]);
                    controller.changedRows2.value.add(controller.noList2[i]);
                  }
                }else {
                  /*for(var i = 0; i < controller.smallBoxList.length; i++) {
                    if(controller.smallBoxList[i]['no'].toString() == (controller.no.value + 1).toString() && controller.isColor.value) {
                      controller.changedRows.value.add(c.rowIdx); // 색상이 변경된 행을 RxSet에 추가
                      return Colors.white; // 조건에 맞는 경우에만 색 변경
                    }
                  }*/
                  if (controller.isColor.value) {
                    for(var i = 0; i < controller.noList3.length; i++) {
                      // controller.changedRows.value.add(controller.noList[i]);
                      controller.changedRows.value.add(controller.noList3[i]);
                    }
                  //  controller.changedRows.value.add(c.rowIdx); // 색상이 변경된 행을 RxSet에 추가
                  //  return Colors.white; // 조건에 맞는 경우에만 색 변경
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
                                  focusNode: controller.focusNode,
                                  style:  AppTheme.a16400.copyWith(color: AppTheme.a6c6c6c),
                                  controller: controller.textQrController,
                                  textAlignVertical: TextAlignVertical.center,
                                  textInputAction: TextInputAction.done,
                                  onTap: () {
                                    controller.isFocus.value = false;
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
                                        }
                                        for(var i = 0; i < controller.smallBoxList.length; i++) {
                                          if(controller.smallBoxList[i]['syncYn'] == 'Y') { //동기화가 O인 것만 드롭다운 버튼 활성화
                                            controller.isDropdownEnabled.value = true; // 드롭다운 활성화 상태 토글
                                            controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
                                            break;
                                          }
                                        }
                                        /// 중복된 itemCd를 제거한 리스트 생성
                                        controller.uniqueSmallBoxList.value = controller.smallBoxList
                                            .fold<Map<String, dynamic>>({}, (map, item) {
                                          if (map.containsKey(item['itemCd'])) {
                                            // 기존 cbxQty 값이 있다면 추가하고, 없으면 새로 초기화하여 누적
                                            map[item['itemCd']]['cbxQty'] = (map[item['itemCd']]['cbxQty'] ?? 1) + 1;
                                          } else {
                                            // 새로 추가하는 경우 기존 cbxQty를 유지하며 item 추가
                                            map[item['itemCd']] = {
                                              ...item,
                                              'cbxQty': item['cbxQty'] ?? 1, // 기존 cbxQty가 없을 때 기본값 1
                                            };
                                          }
                                          return map;
                                          map[item['itemCd']] = item; // itemCd를 키로 사용하여 중복 제거
                                          return map;
                                        }).values.toList();
                                        Get.log('uniqueSmallBoxList: ${controller.uniqueSmallBoxList.value.length}');
                                        Get.log('smallBoxList: ${controller.smallBoxList.length}');
                                        /// 자재 리스트 새로고침
                                        controller.rows.value = List<PlutoRow>.generate(controller.uniqueSmallBoxList.value.length, (index) {
                                          return PlutoRow(
                                            cells: Map.from(controller.uniqueSmallBoxList.value[index].map((key, originalValue) {
                                              // cbxSuNm 키에 대한 로직
                                              if (key == 'cbxSuNm') {
                                                if (index == 0) {
                                                  controller.smallboxNumbering.value = originalValue.toString();
                                                  controller.cellValue.value = controller.smallboxNumbering.value; // 소박스 번호 입력
                                                } else {
                                                  controller.currentValue.value = originalValue.toString();
                                                  if (controller.currentValue.value != controller.smallboxNumbering.value) {
                                                    controller.smallboxNumbering.value = controller.currentValue.value; // 값 업데이트
                                                    controller.cellValue.value = controller.currentValue.value; // 새로운 값으로 업데이트
                                                    controller.isText.value = true; // 텍스트 표시
                                                  } else {
                                                    controller.isText.value = false; // 동일하면 텍스트 숨김
                                                    controller.cellValue.value = ''; // 빈 문자열 설정
                                                  }
                                                }
                                                //return MapEntry(key, PlutoCell(value: controller.cellValue.value));
                                              }
                                              // PlutoCell로 값 래핑
                                              return MapEntry(key, PlutoCell(value: key == 'cbxSuNm' ? controller.cellValue.value : originalValue));


                                            })),
                                          );
                                        });
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
                                          /// 저장된 값이 있다면 / detail일 결우도 추가해야할 듯 소박스랑 별도로
                                          if(controller.smallBoxList[i]['wrkQty'] != null) {
                                            if(controller.smallBoxList[i]['wrkQty'] > 0) {
                                              /// 목박스나 별도박스의 경우 (저장된 값이 있을 때)
                                              if(controller.smallBoxList[i]['mboxExcluded'] != null) {
                                                  controller.smallBoxList[i]['ncbxRmk'] = controller.smallBoxList[i]['mboxExcluded'];
                                                  controller.smallBoxSave.clear();
                                                  controller.smallBoxSave.add(controller.smallBoxList[i]);
                                                  controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                  controller.smallBoxSave[0].addAll({'boxNo': controller.smallBoxList[i]['cbxSuNm']});
                                                  controller.smallBoxSave[0].addAll({'qty': '${controller.smallBoxList[i]['wrkQty']}'});
                                                  final name = controller.reasonDropdownList
                                                      .firstWhere((item) => item['CODE'] == controller.smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
                                                  controller.smallBoxSave[0].addAll({'ncbxRmkName': name.toString()});
                                                  controller.smallBoxSave[0].addAll({'prtNo': 'X'});
                                                  controller.smallBoxSave[0].addAll({'scanYn': 'N'});
                                                  controller.smallBoxSave[0].addAll({'syncYn': 'N'});
                                                  controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
                                                  controller.isColor.value = true;
                                                  controller.noList.add(i);
                                                  controller.noList3.add(controller.smallBoxList[i]['itemCd'].toString());
                                                  await controller.test();
                                              } else {
                                                /// dScanNo가 null이면 detail이 아니다
                                                if(controller.smallBoxList[i]['dScanNo'] == null) {
                                                  final name = controller.reasonDropdownList
                                                      .firstWhere((item) => item['CODE'] == controller.smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
                                                  Get.log('controller.smallBoxList[i][wrkQty] ${controller.smallBoxList[i]['wrkQty']}');
                                                  controller.smallBoxSave.clear();
                                                  controller.smallBoxSave.add(controller.smallBoxList[i]);
                                                  controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                  controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                                  controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                                  controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                                  controller.smallBoxSave[0].addAll({'cbxMaNo': '${controller.smallBoxList[i]['cbxMaNo']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxMaSeq': '${controller.smallBoxList[i]['cbxMaSeq']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.smallBoxList[i]['cbxSuNo']}'});
                                                  controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxList[i]['scanSeq']}'});
                                                  controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxList[i]['itemCd']}'});
                                                  controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxList[i]['setCbxQty']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxList[i]['cbxQty']}'});
                                                  controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxList[i]['setQty']}'});
                                                  controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxList[i]['qtyUnit']}'});
                                                  controller.smallBoxSave[0].addAll({'wrkQtySync': '${controller.smallBoxList[i]['wrkQtySync']}'});
                                                  controller.smallBoxSave[0].addAll({'remark': '${controller.smallBoxList[i]['wrkRemark']}'});
                                                  controller.smallBoxSave[0].addAll({'qty': '${controller.smallBoxList[i]['wrkQty']}'});
                                                  controller.smallBoxSave[0].addAll({'boxNo': '${controller.smallBoxList[i]['boxNo']}'});
                                                  controller.smallBoxSave[0].addAll({'prtNo': controller.smallBoxList[i]['syncYn'] == 'Y' ? 'O' : 'X'});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmkName': name.toString()});
                                                  Get.log('');
                                                  Get.log('controller.smallBoxSave: ${controller.smallBoxSave}');
                                                  controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
                                                  Get.log('controller.smallBoxSaveList: ${controller.smallBoxSaveList}');

                                                  /*/// 여기에 originQty 조건 추가?
                                                if(controller.smallBoxList[i]['originQty'] == controller.smallBoxSave[0]['qty']) {
                                                  // 여기에 noList3 추가
                                                }*/
                                                  controller.isColor.value = true;
                                                  controller.noList.add(i);
                                                  controller.noList3.add(controller.smallBoxList[i]['itemCd'].toString());
                                                  await controller.test();
                                                }else {
                                                  final name = controller.reasonDropdownList
                                                      .firstWhere((item) => item['CODE'] == controller.smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
                                                  Get.log('controller.smallBoxList[i][wrkQty] ${controller.smallBoxList[i]['wrkQty']}');
                                                  controller.smallBoxSave.clear();
                                                  controller.smallBoxSave.add(controller.smallBoxList[i]);
                                                  controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                                  controller.smallBoxSave[0].addAll({'scanYn': controller.smallBoxList[i]['scanYn']});
                                                  controller.smallBoxSave[0].addAll({'scanNo': controller.smallBoxList[i]['scanNo']});
                                                  controller.smallBoxSave[0].addAll({'syncYn': controller.smallBoxList[i]['syncYn']});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmk': controller.smallBoxList[i]['ncbxRmk']});
                                                  controller.smallBoxSave[0].addAll({'cbxMaNo': '${controller.smallBoxList[i]['cbxMaNo']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxMaSeq': '${controller.smallBoxList[i]['cbxMaSeq']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxSuNo': '${controller.smallBoxList[i]['cbxSuNo']}'});
                                                  controller.smallBoxSave[0].addAll({'scanSeq': '${controller.smallBoxList[i]['scanSeq']}'});
                                                  controller.smallBoxSave[0].addAll({'itemCd': '${controller.smallBoxList[i]['itemCd']}'});
                                                  controller.smallBoxSave[0].addAll({'setCbxQty': '${controller.smallBoxList[i]['setCbxQty']}'});
                                                  controller.smallBoxSave[0].addAll({'cbxQty': '${controller.smallBoxList[i]['cbxQty']}'});
                                                  controller.smallBoxSave[0].addAll({'setQty': '${controller.smallBoxList[i]['setQty']}'});
                                                  controller.smallBoxSave[0].addAll({'qtyUnit': '${controller.smallBoxList[i]['qtyUnit']}'});
                                                  controller.smallBoxSave[0].addAll({'wrkQtySync': '${controller.smallBoxList[i]['wrkQtySync']}'});
                                                  controller.smallBoxSave[0].addAll({'remark': '${controller.smallBoxList[i]['wrkRemark']}'});
                                                  controller.smallBoxSave[0].addAll({'qty': '${controller.smallBoxList[i]['wrkQty']}'});
                                                  controller.smallBoxSave[0].addAll({'boxNo': '${controller.smallBoxList[i]['boxNo']}'});
                                                  controller.smallBoxSave[0].addAll({'prtNo': controller.smallBoxList[i]['syncYn'] == 'Y' ? 'O' : 'X'});
                                                  controller.smallBoxSave[0].addAll({'ncbxRmkName': name.toString()});
                                                  controller.smallBoxSave[0].addAll({'extrVal': 'D'});
                                                  Get.log('');
                                                  Get.log('controller.smallBoxSave: ${controller.smallBoxSave}');
                                                  controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
                                                  controller.smallBoxDetailList.add(controller.smallBoxSave[0]);
                                                  Get.log('controller.smallBoxDetailList: ${controller.smallBoxDetailList}');
                                                /*  controller.noList.add(i);
                                                  controller.noList3.add(controller.smallBoxList[i]['itemCd'].toString());
                                                  await controller.test();*/
                                                  // 주석풀어!
                                                 for(var aa = 0; aa < controller.uniqueSmallBoxList.length; aa++) {
                                                   if(controller.uniqueSmallBoxList[aa]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
                                                     if(controller.smallBoxSave[0]['qty'].toString() == controller.uniqueSmallBoxList[aa]['cbxQty'].toString()) {
                                                       controller.noList.add(i);
                                                       controller.noList3.add(controller.uniqueSmallBoxList[aa]['itemCd'].toString());
                                                       await controller.test();
                                                     }
                                                   }
                                                 }
                                                }
                                              }

                                            }
                                          }else {
                                            /// 목박스나 별도박스의 경우 (저장된 값이 없을 때)
                                            if(controller.smallBoxList[i]['mboxExcluded'] != null) {
                                              controller.smallBoxList[i]['ncbxRmk'] = controller.smallBoxList[i]['mboxExcluded'];
                                              controller.smallBoxSave.clear();
                                              controller.smallBoxSave.add(controller.smallBoxList[i]);
                                              controller.smallBoxSave[0].addAll({'no': controller.smallBoxList[i]['no']});
                                              controller.smallBoxSave[0].addAll({'boxNo': controller.smallBoxList[i]['cbxSuNm']});
                                              controller.smallBoxSave[0].addAll({'qty': controller.smallBoxList[i]['cbxQty'].toString()});
                                              final name = controller.reasonDropdownList
                                                  .firstWhere((item) => item['CODE'] == controller.smallBoxList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
                                              controller.smallBoxSave[0].addAll({'ncbxRmkName': name.toString()});
                                              controller.smallBoxSave[0].addAll({'prtNo': 'X'});
                                              controller.smallBoxSave[0].addAll({'scanYn': 'N'});
                                              controller.smallBoxSave[0].addAll({'syncYn': 'N'});
                                              controller.smallBoxSaveList.add(controller.smallBoxSave[0]);
                                              controller.isColor.value = true;
                                              controller.noList.add(i);
                                              controller.noList3.add(controller.smallBoxList[i]['itemCd'].toString());
                                              await controller.test();

                                            }
                                          }

                                        }

                                      }

                                      if(controller.addRowSaveList.isNotEmpty) {
                                        for(var i = 0; i < controller.addRowSaveList.length; i++) {
                                          final name = controller.reasonDropdownList
                                              .firstWhere((item) => item['CODE'] == controller.addRowSaveList[i]['ncbxRmk'], orElse: () => {'NAME': ''})['NAME'];
                                          controller.addRowSaveList[i].addAll({'no': '0${i + 1}'});
                                          controller.addRowSaveList[i].addAll({'prtNo': controller.addRowSaveList[i]['syncYn'] == 'Y' ? 'O' : 'X'});
                                          //  controller.addRowSaveList[i].addAll({'itemNmNonKit': ''});
                                          controller.addRowSaveList[i].addAll({'qty': '${controller.addRowSaveList[i]['wrkQty'].toString()}'});
                                          controller.addRowSaveList[i].addAll({'boxNo': '${controller.addRowSaveList[i]['cbxSuNo']}'});
                                          controller.addRowSaveList[i].addAll({'ncbxRmkName': name.toString()});
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
                                      }
                                      controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                                          PlutoRow(cells:
                                          Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                                              MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                                          )))
                                      );
                                      controller.stateManager2.removeAllRows();
                                      controller.stateManager2.appendRows(controller.rows2);
                                      await controller.test();
                                    }
                                    else
                                    {
                                      /// 자재 스캔 시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                                      await controller.checkItemQr('');
                                      await controller.test();
                                      await aa2();


                                    }

                                    await controller.test();
                                    controller.focusNode.requestFocus();
                                    Future.delayed(const Duration(), (){
                                      controller.focusNode.requestFocus();
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
                        Obx(() => _subData('상태'),),
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
                    child: Obx(() => Row(
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
                    ),)
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
        for(var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
          if(controller.uniqueSmallBoxList[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
            controller.no.value = i;
          }
        }
        // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시
        if(controller.duplicationQr2.value && int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString())
            > int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())) {
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
          if(int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString()) <= int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())
              + controller.smallBoxSave[0]['qty'] + controller.smallBoxSave[0]['qtyRes']) {
            controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
            controller.isSaveColor.value = true;
            controller.noList2.add(controller.uniqueSmallBoxList[controller.no.value]['itemCd'].toString());
            controller.test();
          }else {
            controller.isSaveColor.value = false;
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

          for(var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
            if(controller.uniqueSmallBoxList[i]['itemCd'] == controller.smallBoxSave[0]['itemCd']) {
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

  Future<void> aa2() async {
    /// 메인은 자재코드를 소박스로 찍으니까 다르게 만들어줘야할듯? 그래서 aa2를 만들었다
    if (controller.duplicationQr.value == false &&
        controller.duplicationQr3.value == false) {
      controller.isSaveColor.value = false;
      if (controller.smallBoxSave.isNotEmpty) {
        for (var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
            for (var ii = 0; ii < controller.smallBoxSave.length; ii++) {
              if (controller.uniqueSmallBoxList[i]['itemCd'].toString().trim() == controller.smallBoxSave[ii]['itemCd'].toString().trim()) {
                final name = controller.reasonDropdownList
                    .firstWhere((item) =>
                item['CODE'] == controller.uniqueSmallBoxList[i]['ncbxRmk'],
                    orElse: () => {'NAME': ''})['NAME'];
                controller.no.value = i;
                if (controller.smallBoxSave[ii]['qtyRes'] == null) {
                  controller.smallBoxSave[ii].addAll({'qtyRes': 0});
                }
                // controller.smallBoxSave[ii]['qtyRes'] ?? 0;
                /// ************************** 로직 시작 ************************************************************************************
                ///
                // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시 --디테일 부분
                if (controller.duplicationQr2.value && int.parse(
                    controller.uniqueSmallBoxList[controller.no.value]['cbxQty']
                        .toString())
                    > int.parse(
                        controller.smallBoxSaveList[controller.dupSaveListIndex
                            .value]['qty'].toString())) {
                  controller.isNewItem.value = false;
                  controller.isColor.value = false;
                  controller.smallBoxSave[ii].addAll({'scanYn': 'Y'});
                  controller.smallBoxSave[ii].addAll(
                      {'scanNo': controller.textQrController.text});
                  controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                  controller.smallBoxSave[ii].addAll({'ncbxRmk': ''});
                  controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                  controller.smallBoxSave[ii].addAll({
                    'cbxMaNo': '${controller.uniqueSmallBoxList[controller
                        .no
                        .value]['cbxMaNo']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'cbxMaSeq': ''
                  });
                  controller.smallBoxSave[ii].addAll({
                    'cbxSuNo': ''
                  });
                  controller.smallBoxSave[ii].addAll({
                    'scanSeq': '${controller.uniqueSmallBoxList[controller
                        .no.value]['scanSeq']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'itemCd': '${controller.uniqueSmallBoxList[controller.no
                        .value]['itemCd']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'setCbxQty': '${controller.uniqueSmallBoxList[controller
                        .no.value]['setCbxQty']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'cbxQty': '${controller.uniqueSmallBoxList[controller.no
                        .value]['cbxQty']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'setQty': '${controller.uniqueSmallBoxList[controller.no
                        .value]['setQty']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'qtyUnit': '${controller.uniqueSmallBoxList[controller
                        .no.value]['qtyUnit']}'
                  });
                  controller.smallBoxSave[ii].addAll({
                    'boxNo': '${controller.uniqueSmallBoxList[controller.no
                        .value]['boxNo']}'
                  });
                  controller.smallBoxSave[ii].addAll({'prtNo': 'X'});
                  controller.smallBoxSave[ii].addAll(
                      {'ncbxRmkName': name.toString()});
                  controller.smallBoxSave[ii].addAll({'wrkQtySync': null});
                  controller.smallBoxSave[ii].addAll({'extrVal': 'D'});
                 /* for (var a = 0; a < controller.smallBoxList.length; a++) {
                    if (controller.smallBoxSave[ii]['qrNo'].toString() ==
                        controller.smallBoxList[a]['testQr'].toString()
                        && controller.smallBoxSave[ii]['itemCd'].toString() ==
                            controller.smallBoxList[a]['itemCd'].toString()) {

                    }
                  }*/

                  controller.smallBoxDetailList.add(
                      controller.smallBoxSave[ii]);
                  if (int.parse(controller.uniqueSmallBoxList[controller.no
                      .value]['cbxQty'].toString()) <= int.parse(
                      controller.smallBoxSaveList[controller.dupSaveListIndex
                          .value]['qty'].toString())
                      + controller.smallBoxSave[ii]['qty'] +
                      controller.smallBoxSave[ii]['qtyRes']) {
                    controller.smallBoxSaveList[controller.dupSaveListIndex
                        .value]['qty'] =
                        controller.rows[controller.no.value].cells['cbxQty']
                            ?.value;
                    controller.isSaveColor.value = false;
                    controller.isColor.value = true;
                    controller.noList3.add(
                        controller.uniqueSmallBoxList[i]['itemCd']);
                    controller.test();
                  } else {
                    controller.isSaveColor.value = false;
                    controller.isColor.value = false;
                    controller.smallBoxSaveList[controller.dupSaveListIndex
                        .value]['qty'] = (int.parse(
                        controller.smallBoxSaveList[controller.dupSaveListIndex
                            .value]['qty'].toString())
                        + controller.smallBoxSave[ii]['qty'] +
                        controller.smallBoxSave[ii]['qtyRes']).toInt();
                  }

                  controller.rows2.value = List<PlutoRow>.generate(
                      controller.smallBoxSaveList.length, (index) =>
                      PlutoRow(cells:
                      Map.from((controller.smallBoxSaveList[index]).map((key,
                          value) =>
                          MapEntry(key, PlutoCell(
                              value: value == null ? '' : value)),
                      )))
                  );
                  controller.textQrController.text = '';
                  controller.stateManager2.removeAllRows();
                  controller.stateManager2.appendRows(controller.rows2);
                  controller.smallBoxSaveList[controller.dupSaveListIndex
                      .value]['qty'] ==
                      controller.rows[controller.no.value].cells['cbxQty']
                          ?.value
                      ? controller.isColor.value = true : null;
                  /*    }
                }*/


                } else if (controller.duplicationQr2.value &&
                    controller.rows[controller.no.value].cells['cbxQty']
                        ?.value ==
                        controller.smallBoxSaveList[controller.dupSaveListIndex
                            .value]['qty']) {
                  Get.log('아무것도 하지마');
                }
                // 새로 스캔하는 자재
                else {
                  controller.isNewItem.value = true;
                  for (var i = 0; i <
                      controller.uniqueSmallBoxList.length; i++) {
                    if (controller.uniqueSmallBoxList[i]['itemCd'] ==
                        controller.smallBoxSave[ii]['itemCd']) {
                      /*/// 일단 분할자재 때문에 이렇게 했는데 고쳐야할 수도 너무 지저분
                      for (var a = 0; a < controller.smallBoxList.length; a++) {
                        if (controller.smallBoxSave[ii]['qrNo'].toString() ==
                            controller.smallBoxList[a]['testQr'].toString()
                            &&
                            controller.smallBoxSave[ii]['itemCd'].toString() ==
                                controller.smallBoxList[a]['itemCd']
                                    .toString()) {
                          controller.no.value = i;
                          controller.smallBoxSave[ii].addAll({
                            'no': '${controller.uniqueSmallBoxList[i]['no']}'
                          });
                          controller.smallBoxSave[ii].addAll({'scanYn': 'Y'});
                          controller.smallBoxSave[ii].addAll(
                              {'scanNo': controller.textQrController.text});
                          controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                          controller.smallBoxSave[ii].addAll(
                              {'cbxMaNo': '${controller
                                  .uniqueSmallBoxList[i]['cbxMaNo']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'cbxMaSeq': '${controller
                                  .smallBoxList[a]['cbxMaSeq']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'cbxSuNo': '${controller
                                  .smallBoxList[a]['cbxSuNo']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'scanSeq': '${controller
                                  .uniqueSmallBoxList[i]['scanSeq']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'itemCd': '${controller
                                  .uniqueSmallBoxList[i]['itemCd']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'setCbxQty': '${controller
                                  .uniqueSmallBoxList[i]['setCbxQty']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'cbxQty': '${controller
                                  .uniqueSmallBoxList[i]['cbxQty']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'setQty': '${controller
                                  .uniqueSmallBoxList[i]['setQty']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'qtyUnit': '${controller
                                  .uniqueSmallBoxList[i]['qtyUnit']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'boxNo': '${controller
                                  .uniqueSmallBoxList[controller.no
                                  .value]['boxNo']}'});
                          controller.smallBoxSave[ii].addAll(
                              {'ncbxRmkName': name.toString()});
                          controller.smallBoxSave[ii].addAll(
                              {'wrkQtySync': null});
                          controller.smallBoxSave[ii].addAll({'prtNo': 'X'});
                        }
                      }*/
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
                      controller.smallBoxSave[ii].addAll({'boxNo': '${controller.uniqueSmallBoxList[controller.no.value]['boxNo']}'});
                      controller.smallBoxSave[ii].addAll({'ncbxRmkName': name.toString()});
                      controller.smallBoxSave[ii].addAll({'wrkQtySync': null});
                      controller.smallBoxSave[ii].addAll({'prtNo': 'X'});
                    }
                  }
                  // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
                  // 그보다 작을 경우에는 qty 값만큼 입력
                  if (controller.rows[controller.no.value].cells['cbxQty']
                      ?.value <= (controller.smallBoxSave[ii]['qty'] +
                      controller.smallBoxSave[ii]['qtyRes']).toInt()) {
                    controller.smallBoxSave[ii]['qty'] =
                        controller.rows[controller.no.value].cells['cbxQty']
                            ?.value;
                    controller.isSaveColor.value = false;
                    controller.isColor.value = true;
                    controller.noList3.add(
                        controller.uniqueSmallBoxList[i]['itemCd']);
                    controller.test();
                  } else {
                    controller.smallBoxSave[ii]['qty'] =
                        (controller.smallBoxSave[ii]['qty'] +
                            controller.smallBoxSave[ii]['qtyRes']).toInt();
                    controller.smallBoxSave[ii].addAll({'extrVal': 'D'});

                    /// 저장 시에 DETAIL에 넘겨줘야할 오브젝트 구분
                    //controller.smallBoxSave[ii]['ncbxRmkName'] = '';
                    controller.smallBoxDetailList.add(
                        controller.smallBoxSave[ii]);
                  }
                  //  controller.smallBoxSave[ii]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
                  // controller.smallBoxSave[ii]['ncbxRmkName'] = '';
                  controller.smallBoxSaveList.add(controller.smallBoxSave[ii]);
                  controller.smallBoxSaveList[controller.smallBoxSaveList
                      .length - 1]['prtNo'] = 'X';
                  Get.log('ㅁㄴㅇㅁㄴㅇㄴ: ${controller.smallBoxSave.length}');


                  /*controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                    PlutoRow(cells:
                    Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                        MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                    )))
                );*/


                }
              }
            }

        }
      }
      if (controller.isNewItem.value) {
        controller.insertRow.value =
        List<PlutoRow>.generate(controller.smallBoxSave.length, (index) =>
            PlutoRow(cells:
            Map.from((controller.smallBoxSave[index]).map((key, value) {
              {
                return MapEntry(
                    key, PlutoCell(value: value ?? '')); // 일반 셀은 기존 로직대로
              }
            }
            )))
        );
        for (var i = 0; i < controller.insertRow.length; i++) {
          controller.insertRow[i].cells['itemNm']?.value =
              controller.insertRow[i].cells['itemNm']?.value.toString().trim();
          controller.insertRow[i].cells['qty']?.value =
              controller.insertRow[i].cells['qty']?.value.toInt();
          Get.log('구구: ${ controller.insertRow[i].cells['setQty']?.value}');
        }
        controller.stateManager2.insertRows(
            controller.no.value, controller.insertRow.value);
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
            width: title == '메모' ? 400 : null,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(title == '메모' ? controller.textMemoController.text : controller.statusText.value, style: AppTheme.a20700.copyWith(color: AppTheme.black),)
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
            if(text == '행 추가') {
              controller.isFocus.value = true;
              controller.smallBoxList.isNotEmpty ?
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _alertDialog(context);
                },
              ) :  Get.dialog(CommonDialogWidget(contentText: '박스를 스캔해주세요', pageFlag: 0));
            }else if(text == '동기화') {
              controller.smallBoxList[0]['wrkCfmYn'] != 'Y' ?
              syncProcess() : Get.dialog(CommonDialogWidget(contentText: '확정 처리된 상태입니다.', pageFlag: 0));
            }else if(text == '저장') {
              Get.log('저장할 리스트!: ${controller.smallBoxSaveList.length}');
              await controller.registSmallKitSave();
              await controller.registSmallKitDetailSave();
              controller.isSave.value ?
              Get.dialog(CommonDialogWidget(contentText: '저장되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '${controller.isSaveText.value}.', pageFlag: 0));
            }else if(text == '동기화 취소') {
              Get.log('동기화 취소');
              Get.log('동기화 취소1: ${controller.smallBoxSaveList.length}');
              /*controller.smallBoxSaveList.value = controller.smallBoxSaveList
                  .where((item) => !(item['remark'] == '' && item['prtNo'] == 'O'))
                  .toList(),*/
              // smallBoxSaveList의 리스트에 changedRows에 {1,2} 가 있는데 smallBoxSaveList[1]이 존재하지않으면 ch

             if(controller.smallBoxList[0]['wrkCfmYn'] != 'Y') {
               controller.smallBoxSaveList.removeWhere((item) {
                 bool shouldRemove = item['ncbxRmk'] == '' && item['prtNo'] == 'O';
                 if (item['ncbxRmk'] == '' && item['prtNo'] == 'O') {
                   int index = controller.uniqueSmallBoxList.indexWhere((element) => element['no'] == item['no']);
                   controller.changedRows.remove(index);
                   controller.test();
                 }else if(item['ncbxRmk'] != '' && item['prtNo'] == 'O') {
                   Get.dialog(CommonDialogWidget(contentText: '동기화 된 자재 중 사유가 선택된 항목이 있습니다.', pageFlag: 0));
                 } else if(item['prtNo'] == 'O') {
                   int index = controller.uniqueSmallBoxList.indexWhere((element) => element['no'] == item['no']);
                   controller.smallBoxSaveList[index]['qty'] = controller.smallBoxSaveList[index]['wrkQtySync'];
                   Get.log('qty::: ${controller.smallBoxSaveList[index]['qty']}');
                 }
                 return shouldRemove;
               });

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


            }else if(text == '확정') {
              await controller.registSmallKitSave();
              await controller.registSmallKitDetailSave();
              await controller.registSmallKitConfirm('Y') ;
            //  controller.isConfirm.value ? await controller.registSmallKitSave() : null;
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '${controller.isConfirmText.value}.', pageFlag: 0));
              controller.focusNode.unfocus();
            }else if(text == '확정 취소') {
              await controller.registSmallKitConfirm('N');
              controller.isConfirm.value ?
              Get.dialog(CommonDialogWidget(contentText: '확정 취소되었습니다.', pageFlag: 0)) :
              Get.dialog(CommonDialogWidget(contentText: '취소되지않았습니다.', pageFlag: 0));
              controller.focusNode.unfocus();
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
              *//*controller.insertRow.value = List<PlutoRow>.generate(controller.ipgoQrList.length, (index) =>
            PlutoRow(cells:
            Map.from((controller.ipgoQrList[index]).map((key, value) =>
            MapEntry(key, PlutoCell(value: value ?? '' )),
            )))
            ),
            //  controller.rowDatas2.add(controller.insertRow[0]);
            controller.stateManager2.insertRows(controller.ipgoList.length, controller.insertRow)*//*
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
              *//*controller.smallBoxSaveList.value = controller.smallBoxSaveList
                  .where((item) => !(item['remark'] == '' && item['prtNo'] == 'O'))
                  .toList(),*//*
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
    int cbxQty;
    // 로딩 다이얼로그 시작
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
    );

    try {
      // 작업 시작
      controller.isSaveColor.value = false;
      controller.isColor.value = true;

      for (var dong = 0; dong < controller.uniqueSmallBoxList.length; dong++) {
        controller.changedRows.value.add(controller.uniqueSmallBoxList[dong]['itemCd'].toString());
        await controller.checkItemQr(controller.uniqueSmallBoxList[dong]['itemCd']);

        if (controller.duplicationQr.value == false) {
          if (controller.smallBoxSave.isNotEmpty) {
            // 주요 데이터 처리 로직
            for (var i = 0; i < controller.uniqueSmallBoxList.length; i++) {
              for (var ii = 0; ii < controller.smallBoxSave.length; ii++) {
                if (controller.uniqueSmallBoxList[i]['itemCd'].toString() == controller.smallBoxSave[ii]['itemCd']) {
                  controller.no.value = i;
                  controller.smallBoxSave[ii].addAll({
                    'no': '${controller.uniqueSmallBoxList[i]['no']}',
                    'ncbxRmk': '',
                    'wrkQtySync': null,
                    'cbxMaNo': controller.uniqueSmallBoxList[i]['cbxMaNo'],
                    'cbxMaSeq': '${controller.uniqueSmallBoxList[i]['cbxMaSeq']}',
                    'cbxSuNo': '${controller.uniqueSmallBoxList[i]['cbxSuNo']}',
                    'setCbxQty': '${controller.uniqueSmallBoxList[i]['setCbxQty']}',
                    'cbxQty': '${controller.uniqueSmallBoxList[i]['cbxQty']}',
                    'setQty': '${controller.uniqueSmallBoxList[i]['setQty']}',
                    'qtyUnit': '${controller.uniqueSmallBoxList[i]['qtyUnit']}'
                  });
                }
              }
            }

            for(var dong2 = 0; dong2 < controller.uniqueSmallBoxList.length; dong2++) {
              for(var ii = 0; ii < controller.smallBoxSave.length; ii++) {
                // 값이 String 타입이라면 int로 변환, 이미 int라면 그대로 사용
                if (controller.uniqueSmallBoxList[dong2]['cbxQty'] is String) {
                  cbxQty = int.parse(controller.uniqueSmallBoxList[dong2]['cbxQty']);
                } else {
                  cbxQty = controller.uniqueSmallBoxList[dong2]['cbxQty'];
                };
                if(controller.smallBoxSave[ii]['itemCd'].toString() == controller.uniqueSmallBoxList[dong2]['itemCd'].toString()) {
                  if(controller.smallBoxSave[ii]['qty'].toInt() < cbxQty) {
                    controller.smallBoxSave[ii]['qty'] = controller.uniqueSmallBoxList[dong2]['cbxQty'];
                    // controller.smallBoxDetailList.add(controller.smallBoxSave[0]) // 디테일 리스트에 추가
                  }
                }
              }

            }
            for(var i = 0; i < controller.smallBoxSave.length; i++) {
              controller.smallBoxSave[i]['setQty'] = controller.rows[controller.no.value].cells['setQty']?.value;
              controller.smallBoxSave[i]['prtNo'] = 'O';
              controller.smallBoxSave[i]['ncbxRmkName'] = '';
              // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
              // 그보다 작을 경우에는 qty 값만큼 입력
              controller.duplicationQr2.value ? null : controller.smallBoxSaveList.add(controller.smallBoxSave[i]);
            };
            for(var dong2 = 0; dong2 < controller.smallBoxList.length; dong2++) {
              for(var i = 0; i < controller.smallBoxSaveList.length; i++) {
                if(controller.smallBoxSaveList[i]['prtNo'] == 'X') {
                  if(controller.smallBoxSaveList[i]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                    if(controller.smallBoxSaveList[i]['itemCd'].toString() == controller.smallBoxList[dong2]['itemCd'].toString()) {
                      if(int.parse(controller.smallBoxSaveList[i]['qty'].toString()) < int.parse(controller.smallBoxList[dong2]['cbxQty'].toString())) {
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
            controller.isDropdownEnabled.value = true;
            controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value; //enableEditingMode
            /*for(var ii = 0; ii < controller.smallBoxSaveList.length; ii++) {
                      if(controller.smallBoxSaveList[ii]['prtNo'] == 'O') { //동기화가 O인 것만 드롭다운 버튼 활성화
                        controller.isDropdownEnabled.value = true, // 드롭다운 활성화 상태 토글
                        // controller.stateManager2.rows[dong].cells['remark']?.
                        controller.stateManager2.columns[4]!.enableEditingMode = controller.isDropdownEnabled.value, //enableEditingMode
                      },
                    }*/
            // 나머지 중첩된 반복문들을 처리하는 로직
            // ...
          }
        }
      }
      controller.no.value = 990;
      controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
          PlutoRow(cells:
          Map.from((controller.smallBoxSaveList[index]).map((key, value) {
            return MapEntry(key, PlutoCell(value: value ?? ''));
          }))
          )
      );

      // 정렬 작업
      controller.rows2.value.sort((a, b) {
        int noA = int.parse(a.cells['no']?.value.toString() ?? '0');
        int noB = int.parse(b.cells['no']?.value.toString() ?? '0');
        return noA.compareTo(noB);
      });

      controller.stateManager2.removeAllRows();
      controller.stateManager2.appendRows(controller.rows2.value);

      await controller.test();
      Get.log('이거이거 ${controller.smallBoxSaveList}');
      Get.log('동기화 is: ${controller.isDropdownEnabled.value}');

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
          width: 170,
          title: '소박스 번호',
          field: 'cbxSuNm',
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
          field: 'boxNo', //tagNo?
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
                          'cbxMaNo': '${controller.smallBoxList[0]['cbxMaNo']}-E',
                          'cbxMaSeq': controller.smallBoxSaveList.length+1,
                          'setCbxQty': '0',
                          'cbxQty': controller.textQtyController.text,
                          'boxNo': '',
                          'cbxSuNo': '${controller.smallBoxList[0]['cbxMaNo']}-E',
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
        ),
      ],
    );
  }








/*

  Future<void> aa3() async{                                   /// 메인은 자재코드를 소박스로 찍으니까 다르게 만들어줘야할듯? 그래서 aa2를 만들었다
    if(controller.duplicationQr.value == false && controller.duplicationQr3.value == false){
      controller.isSaveColor.value = false;
      if(controller.smallBoxSave.isNotEmpty) {
        for(var i = 0; i < controller.smallBoxList.length; i++) {
            /// 소박스 안에 여러 자재가 있는 경우때문에
            for (var ii = 0; ii < controller.smallBoxSave.length; ii++) {
              if (controller.smallBoxList[i]['itemCd'] == controller.smallBoxSave[ii]['itemCd']) {
                controller.no.value = i;
                */
/*controller.bunhalList.clear();
                for(var iii = 0; iii < controller.smallBoxList.length; iii++) {
                  if(controller.smallBoxList[i]['itemCd'] == controller.smallBoxList[iii]['itemCd']) {
                    controller.bunhalList.add(controller.smallBoxList[i]['itemCd']);
                  }
                }
                /// 분할자재일 경우
                if( controller.bunhalList[0] == controller.smallBoxSave[ii]['itemCd'] && controller.bunhalList.length > 1) {
                  for(var su = 0; su < controller.smallBoxSaveList.length; su++) {
                    /// 우측 리스트안에 들어간 cbxSuNo이 있을 때
                    if(controller.smallBoxSaveList[su]['cbxSuNo'] == controller.smallBoxList[i]['cbxSuNo']) {
                       break outerLoop;
                    }else {

                    }
                  }

                }*//*


                final name = controller.reasonDropdownList
                    .firstWhere((item) =>
                item['CODE'] == controller.smallBoxList[i]['ncbxRmk'],
                    orElse: () => {'NAME': ''})['NAME'];

                if (controller.smallBoxSave[ii]['qtyRes'] == null) {
                  controller.smallBoxSave[ii].addAll({'qtyRes': 0});
                }
                // controller.smallBoxSave[ii]['qtyRes'] ?? 0;
                /// ************************** 로직 시작 ************************************************************************************
                ///
                // 우측리스트에 들어가있는 자재를 또 스캔했고 왼쪽 수량보다 작을 시 --디테일 부분
                if (controller.duplicationQr2.value && int.parse(controller.smallBoxList[controller.no.value]['cbxQty'].toString())
                    > int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())) {

                  controller.isNewItem.value = false;
                  controller.isColor.value = false;
                  controller.smallBoxSave[ii].addAll({'scanYn': 'Y'});
                  controller.smallBoxSave[ii].addAll({'scanNo': controller.textQrController.text});
                  controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                  controller.smallBoxSave[ii].addAll({'ncbxRmk': ''});
                  controller.smallBoxSave[ii].addAll({'syncYn': 'N'});
                  controller.smallBoxSave[ii].addAll({'cbxMaNo': '${controller.smallBoxList[controller.no.value]['cbxMaNo']}'});
                  controller.smallBoxSave[ii].addAll({'cbxMaSeq': '${controller.smallBoxList[controller.no.value]['cbxMaSeq']}'});
                  controller.smallBoxSave[ii].addAll({'cbxSuNo': '${controller.smallBoxList[controller.no.value]['cbxSuNo']}'});
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
                  controller.smallBoxSave[ii]['extrVal'] = 'D';
                  controller.smallBoxDetailList.add(
                      controller.smallBoxSave[ii]);
                  if (int.parse(controller.uniqueSmallBoxList[controller.no.value]['cbxQty'].toString()) <= int.parse(controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'].toString())
                      + controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes']) {
                    controller.smallBoxSaveList[controller.dupSaveListIndex.value]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
                    controller.isSaveColor.value = false;
                    controller.isColor.value = true;
                    controller.noList3.add(controller.uniqueSmallBoxList[i]['itemCd']);
                    controller.test();
                  } else {
                    controller.isSaveColor.value = false;
                    controller.isColor.value = false;
                    controller.smallBoxSaveList[controller.dupSaveListIndex
                        .value]['qty'] = (int.parse(
                        controller.smallBoxSaveList[controller.dupSaveListIndex
                            .value]['qty'].toString())
                        + controller.smallBoxSave[ii]['qty'] +
                        controller.smallBoxSave[ii]['qtyRes']).toInt();
                  }

                  controller.rows2.value = List<PlutoRow>.generate(
                      controller.smallBoxSaveList.length, (index) =>
                      PlutoRow(cells:
                      Map.from((controller.smallBoxSaveList[index]).map((key,
                          value) =>
                          MapEntry(key, PlutoCell(
                              value: value == null ? '' : value)),
                      )))
                  );
                  controller.textQrController.text = '';
                  controller.stateManager2.removeAllRows();
                  controller.stateManager2.appendRows(controller.rows2);
                  controller.smallBoxSaveList[controller.dupSaveListIndex
                      .value]['qty'] ==
                      controller.rows[controller.no.value].cells['cbxQty']
                          ?.value
                      ? controller.isColor.value = true : null;
                  */
/*    }
                }*//*



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
                      controller.smallBoxSave[ii].addAll({'boxNo': '${controller.uniqueSmallBoxList[controller.no.value]['boxNo']}'});
                      controller.smallBoxSave[ii].addAll({'ncbxRmkName': name.toString()});
                      controller.smallBoxSave[ii].addAll({'wrkQtySync': null});
                      controller.smallBoxSave[ii].addAll({'prtNo': 'X'});
                    }
                  }
                  // 왼쪽 리스트의 수량보다 클 경우에는 왼쪽수량만큼 입력
                  // 그보다 작을 경우에는 qty 값만큼 입력
                  if (controller.rows[controller.no.value].cells['cbxQty']?.value <= (controller.smallBoxSave[ii]['qty'] +
                      controller.smallBoxSave[ii]['qtyRes']).toInt()) {
                    controller.smallBoxSave[ii]['qty'] = controller.rows[controller.no.value].cells['cbxQty']?.value;
                    controller.isSaveColor.value = false;
                    controller.isColor.value = true;
                    controller.noList3.add(controller.uniqueSmallBoxList[i]['itemCd']);
                    controller.test();
                  } else { // 아직 다 수량을 스캔 못했을 때
                    controller.smallBoxSave[ii]['qty'] = (controller.smallBoxSave[ii]['qty'] + controller.smallBoxSave[ii]['qtyRes']).toInt();
                    controller.smallBoxSave[ii]['extrVal'] = 'D';

                    /// 저장 시에 DETAIL에 넘겨줘야할 오브젝트 구분
                    controller.smallBoxDetailList.add(controller.smallBoxSave[ii]);
                  }
                  controller.smallBoxSaveList.add(controller.smallBoxSave[ii]);
                  controller.smallBoxSaveList[controller.smallBoxSaveList.length - 1]['prtNo'] = 'X';
                  Get.log('ㅁㄴㅇㅁㄴㅇㄴ: ${controller.smallBoxSave.length}');


                  */
/*controller.rows2.value = List<PlutoRow>.generate(controller.smallBoxSaveList.length, (index) =>
                    PlutoRow(cells:
                    Map.from((controller.smallBoxSaveList[index]).map((key, value) =>
                        MapEntry(key, PlutoCell(value: value == null ? '' : value )),
                    )))
                );*//*



                }
              }
            }


        }


      }
    }
    if(controller.isNewItem.value) {
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
  }

*/









}


