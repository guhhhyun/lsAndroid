
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/common/common_appbar_widget.dart';
import 'package:lsandroid/app/common/dialog_widget.dart';
import 'package:lsandroid/app/pages/Ipgo/ipgo_controller.dart';
import 'package:lsandroid/app/pages/home/home_page.dart';
import 'package:pluto_grid/pluto_grid.dart';


class IpgoPage extends StatelessWidget {
   IpgoPage({super.key});

  IpgoController controller = Get.find();

  final focusNode2 = FocusNode();
   final focusNode2Key = FocusNode();
   final focusNode3 = FocusNode();
   final focusNode3Key = FocusNode();
  late double test;
   late double test2;

  @override
  Widget build(BuildContext context) {
    controller.isQr.value == false ? controller.requestFocus() : null;
    test = MediaQuery.of(context).size.width - 800;
    test2 = MediaQuery.of(context).size.width - 485;
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
                  CommonAppbarWidget(title: '입고등록', isLogo: false, isFirstPage: true ),
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


   /// 키보드 엔터 없이 그리드에서 업데이트된 항목 바로 적용 시켜주기 위한 로직 /////////////////////////////////////////////////////////////
   void _listener() {
     if (controller.gridStateMgr2.currentCell == controller.currentCell) {
       return;
     }

     if (controller.gridStateMgr2.isEditing && controller.gridStateMgr2.currentCell != null) {

       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
         controller.initialValue = controller.gridStateMgr2.textEditingController?.text;

         controller.gridStateMgr2.textEditingController!.addListener(_textEditingListener);
         if (controller.gridStateMgr2.textEditingController?.selection != null) {
           controller.gridStateMgr2.textEditingController!.selection = TextSelection(
             baseOffset: 0,
             extentOffset: controller.gridStateMgr2.textEditingController!.text.length,
           );
         }

       });
     } else {
       controller.initialValue = null;

       controller.gridStateMgr2.textEditingController?.removeListener(_textEditingListener);
     }

     controller.currentCell = controller.gridStateMgr2.currentCell;
   }

   void _textEditingListener() {
     controller.debounce.debounce(callback: _update);
   }

   void _update() {
     if (controller.initialValue == controller.gridStateMgr2.textEditingController?.text) {
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

     controller.ipgoList[controller.currentCell!.row!.sortIdx].addAll({'qty': controller.gridStateMgr2.textEditingController?.text});
     print('이건가? ${controller.gridStateMgr2.textEditingController?.text}');
   }

  Widget _mainBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            color: AppTheme.dark_text_secondary,
            height: 1,
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 380,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        //  tabAlignment: TabAlignment.start,
                        onTap: (i) async {
                         // i == 1 ? controller.smallBoxIsQr.value == false ? controller.requestFocus2() : null : null;
                        },
                        indicatorSize: TabBarIndicatorSize.tab,
                        controller: controller.tabController,
                        indicatorColor: AppTheme.black,
                        labelColor: AppTheme.black,
                        unselectedLabelColor: AppTheme.light_ui_05,
                        tabs: [
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              '입고등록',
                              style: AppTheme.a20700,
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              '소박스등록',
                              style: AppTheme.a20700,
                            ),
                          ),
                          Container(

                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              '입고취소',
                              style: AppTheme.a20700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() => Container(
                    margin: EdgeInsets.only(right: 14, bottom: 4),
                    decoration: BoxDecoration(
                        color: controller.isDbConnected.value ? Colors.greenAccent.withOpacity(0.7) : Colors.redAccent.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    width: 40,
                    height: 40,
                  ),),

                ],
              ),
              Container(
                color: AppTheme.dark_text_secondary,
                height: 1,
              ),
              SizedBox(height: 12,),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child:TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    _subBody(context),
                    _subBody1(context),
                    _subBody2(context),
                 /*   controller.isLoading.value == true ? CommonLoading(bLoading: controller.isLoading.value) :
                    _allBody(),
                    controller.isLoading.value == true ? CommonLoading(bLoading: controller.isLoading.value) :
                    _noConfirmBody(),
                    controller.isLoading.value == true ? CommonLoading(bLoading: controller.isLoading.value) :
                    _confirmBody()*/
                  ],
                ),
              ),

            ]),
          ),
        ]),
      ),
    );
  }

  Widget _subBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            padding: EdgeInsets.only(bottom: 4,),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.black
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('거래명세서 정보', style: AppTheme.a20700.copyWith(color: AppTheme.black),)
              ],
            ),
          ),
          SizedBox(height: 4,),
          Obx(() => _SearchCondition(context),),
          SizedBox(height: 12,),
          _invnrList(context),
          SizedBox(height: 12,),
          /// 하단 입고등록 시작
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            padding: EdgeInsets.only(bottom: 4,),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: AppTheme.black
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('입고 등록', style: AppTheme.a20700.copyWith(color: AppTheme.black),)
              ],
            ),
          ),
          SizedBox(height: 4,),
           SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: _SearchCondition2(context)),
          SizedBox(height: 12,),
          _ipgoList(context),

        ],
      ),
    );
  }


   Widget _SearchCondition(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Container(
           width:  MediaQuery.of(context).size.width - 200 ,
           padding: EdgeInsets.only(left: 24),
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 Text('입고일자', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
                 SizedBox(width: 8,),
                 Container(
                     child: InkWell(
                       onTap: () async{
                         var datePicked = await DatePicker.showSimpleDatePicker(
                           titleText: '날짜 선택',
                           itemTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
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
                             Text(controller.dayStartValue.value, style: AppTheme.a20400
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
                           itemTextStyle: AppTheme.a20400.copyWith(color: AppTheme.black),
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
                          /* if(controller.choiceButtonVal.value != 0) {

                           }*/
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
                         height: 40,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(color: AppTheme.ae2e2e2)),
                         width: 150,
                         padding: const EdgeInsets.only( right: 12),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(controller.dayEndValue.value, style: AppTheme.a20400
                                 .copyWith(color: AppTheme.a6c6c6c
                                 , fontSize: 17),),
                           ],
                         ),

                       ),
                     ),
                   ),
                 SizedBox(width: 16,),
                 _dropDownItem(),
                 SizedBox(width: 16,),
                 _invnrTextForm3(),
                 //_invnrTextForm('거래명세서 번호', 0),
                 SizedBox(width: 16,),
                 _invnrTextForm('품목코드', 1),
                 SizedBox(width: 16,),
                 _invnrTextForm('프로젝트명', 2),

               ],
             ),
           ),
         ),
         Container(
           margin: EdgeInsets.only(right: 12),
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
               if(controller.isChecked.value == false) {
                 controller.isChecked.value = true;
                 await controller.checkBtn();
                 controller.saveTextInvnr.value = controller.textInvnrController.text;
                 controller.isSelectedInvnr.value = true;
                 if(controller.gridStateMgr.rows.length == 1) {
                   controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 0);
                   controller.selectedInvnrIndex.value = 0;
                 }else {
                   controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 1);
                   Get.log('현재위치: ${controller.gridStateMgr.currentRowIdx}');
                   controller.selectedInvnrIndex.value = controller.gridStateMgr.currentRowIdx!;
                 }
               //  controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 1);

                 Get.log('현재위치: ${controller.gridStateMgr.currentRowIdx}');

                // controller.invnrHeight.value = 53*(double.parse((controller.ipgoCancelList.length + 1).toString()));
               }
               controller.isChecked.value = false;
               controller.isQr.value = true;
               controller.focusNode.unfocus();
               focusNode2.requestFocus();



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
                     style: AppTheme.a18700.copyWith(
                         color: AppTheme.white,
                         )),
               ),
             ),
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
   Widget _invnrTextForm3() {
     return Row(
       children: [
         Text('거래명세서 번호',
             style: AppTheme.a20700
                 .copyWith(color: AppTheme.black)),
         SizedBox(width: 8,),
         Container(
           padding: EdgeInsets.only(top: 4, left: 8),
           height: 35,
           width:  150,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: Border.all(color: AppTheme.ae2e2e2)),
           child: Center(
             child: TextFormField(
               focusNode: controller.focusNode,
               expands :true,
               minLines: null,
               maxLines: null,
               style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
               // maxLines: 5,
               controller: controller.textInvnrController,
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
                 controller.isQr.value = true;
                 if(controller.focusCnt.value++ > 1) controller.focusCnt.value = 0;
                 else Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
               },
               onTapOutside:(event) => { controller.focusCnt.value = 0 },
               onFieldSubmitted: (value) async{
                 await controller.checkBtn(); // 조회
                 controller.ipgoQrList.clear();
                 controller.ipgoList.clear();
                 controller.gridStateMgr2.removeAllRows();
                 if(controller.gridStateMgr.rows.length == 1) {
                   controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 0);
                   controller.selectedInvnrIndex.value = 0;
                 }else {
                   controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 1);
                   Get.log('현재위치: ${controller.gridStateMgr.currentRowIdx}');
                   controller.selectedInvnrIndex.value = controller.gridStateMgr.currentRowIdx!;
                 }
                 controller.isSelectedInvnr.value = true;
                 controller.isQr.value = true;
                 controller.saveTextInvnr.value = controller.textInvnrController.text;
                 controller.textInvnrController.text = '';
                 focusNode2.requestFocus();
                 /*controller.focusNode.requestFocus();
                 Future.delayed(const Duration(), (){
                   controller.focusNode.requestFocus();
                   //  FocusScope.of(context).requestFocus(focusNode);
                   Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                 });*/
               },
               // onChanged: ((value) => controller.submitSearch(value)),
             ),
           ),

         ),
       ],
     );
   }

   Widget _invnrTextForm(String title, int plag) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a20700
                .copyWith(color: AppTheme.black)),
        SizedBox(width: 8,),
        Container(
          padding: EdgeInsets.only(top: 4),
          height: 35,
          width: plag == 4 ? 250 : 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.ae2e2e2)),
          child: Center(
            child: TextFormField(
                  onTap: () {
                    controller.isQr.value = true;
                  },
                  readOnly:  plag == 4 ? true : false,
                  expands :true,
                  minLines: null,
                  maxLines: null,
                    style:  AppTheme.a18700.copyWith(color: AppTheme.a6c6c6c),
                    // maxLines: 5,
                    controller: plag == 0 ? controller.textInvnrController : plag == 1 ? controller.textItemController
                                          : controller.textProjectController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      fillColor: Colors.white,
                     // filled: true,
                      hintText: '',
                      hintStyle: AppTheme.a18700.copyWith(color: AppTheme.aBCBCBC),
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



   Widget _invnrList(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
     final double height = 300;
     return Container(
       child: Column(children: [
         Container(
           width: MediaQuery.of(context).size.width-32,
           height: height,
           child: PlutoGrid(
             mode: PlutoGridMode.selectWithOneTap, // 탭 한번으로 반응하게?
             columns: gridCols,
             rows: controller.rowDatas,
             onLoaded: (PlutoGridOnLoadedEvent event) {
               controller.isSelectedInvnr.value = false;
               controller.gridStateMgr = event.stateManager;
               controller.gridStateMgr.setSelectingMode(PlutoGridSelectingMode.none);
               //gridStateMgr.setShowColumnFilter(true);
             },
             onChanged: (PlutoGridOnChangedEvent event) {
               print(event);
             },
             onSelected: (c) {

               controller.isSelectedInvnr.value = true;
               controller.selectedInvnrIndex.value != controller.gridStateMgr.currentRowIdx!
                   ? {controller.ipgoQrList.clear(), controller.ipgoList.clear(), controller.gridStateMgr2.removeAllRows()} : null;
               controller.selectedInvnrIndex.value = controller.gridStateMgr.currentRowIdx!;

               print(controller.gridStateMgr.currentRowIdx);
             },
             rowColorCallback: (c) {
               if(controller.gridStateMgr.currentRowIdx == c.rowIdx) {
                 return AppTheme.blue_blue_50;
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
                 cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black)
               ),
             ),
           ),
         ),
       ],),
     );
   }

   final List<PlutoColumn> gridCols = <PlutoColumn>[
     PlutoColumn(
       title: '번호',
       field: 'no',
       type: PlutoColumnType.text(),
       width: 60,
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
       title: '거래명세서 번호',
       field: 'doc1',
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
       title: '입고일자',
       field: 'grDt',
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
       title: '품목코드',
       field: 'itemCd',
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
       title: '품목명',
       field: 'itemNm',
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
       title: 'ERP 수량',
       field: 'erpQty',
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
       title: 'WMS 수량',
       field: 'wmsQty',
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
       title: 'ERP 잔량',
       field: 'rmnQty',
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
       title: '단위',
       field: 'erpQtyUnit',
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
 /*    PlutoColumn(
       title: '프로젝트명',
       field: 'pjtNm',
       type: PlutoColumnType.text(),
       width: 170,
       enableSorting: false,
       enableEditingMode: false,
       enableContextMenu: false,
       enableRowDrag: false,
       enableDropToResize: false,
       enableColumnDrag: false,
       titleTextAlign: PlutoColumnTextAlign.center,
       textAlign: PlutoColumnTextAlign.left,
       backgroundColor: AppTheme.gray_c_gray_200,
     ),*/
     PlutoColumn(
       title: '업체명',
       field: 'vendNm',
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
   ];


   Widget _SearchCondition2(BuildContext context) {
     return Container(
       width: MediaQuery.of(context).size.width-30,
       padding: EdgeInsets.only(left: 12),
       child: Container(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               width: MediaQuery.of(context).size.width/2 + 50,
               child: SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                       children: [
                         _qrCodeTextForm(context),
                        // _invnrTextForm('QR 코드', 3),
                         SizedBox(width: 16,),
                         Obx(()=> _statusText()),
                       ],

                 ),
               ),
             ),
             Row(
               children: [
                 Obx(() => _oneDropDownItem(),),
                 SizedBox(width: 12,),
                 Container(
                   margin: EdgeInsets.only(right: 12),
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
                     onPressed: () {
                       Get.log('행 삭제 클릭!');
                       if(controller.gridStateMgr2.currentRowIdx != null) {
                         controller.ipgoList.removeAt(controller.gridStateMgr2.currentRowIdx!);
                         controller.gridStateMgr2.removeAllRows();
                         updateRows();
                         controller.gridStateMgr2.appendRows(controller.rowDatas2.value);
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
                         child: Text('행 삭제',
                             style: AppTheme.a18700.copyWith(
                               color: AppTheme.white,
                             )),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 12,),
                 Container(
                   margin: EdgeInsets.only(right: 12),
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
                       if(controller.ipgoList.isNotEmpty) {
                         Get.dialog(
                           Center(child: CircularProgressIndicator()),
                           barrierDismissible: false, // 사용자가 다이얼로그를 닫을 수 없도록 설정
                         );
                         if(controller.isIpgoClick.value == false) {
                           controller.isIpgoClick.value = true;
                           if(controller.isIpgoClick.value) {
                             Get.log('입고등록 클릭!');
                             await controller.reqCheburnIpgo();
                             await controller.registIpgoBtnMulti();
                             //ipgoList
                           }
                           controller.successIpgo.value == true ?
                           SchedulerBinding.instance!.addPostFrameCallback((_) {
                             Get.dialog(CommonDialogWidget(contentText: '저장되었습니다', pageFlag: 3,));
                           }) : Get.dialog(CommonDialogWidget(contentText: '등록에 실패하였습니다', pageFlag: 3,));
                           controller.ipgoQrList.clear();
                           controller.ipgoList.clear();
                           controller.gridStateMgr2.removeAllRows();

                           /// 거래명세서 재조회
                           await controller.checkBtn2(); // 조회
                           controller.ipgoQrList.clear();
                           controller.ipgoList.clear();
                           controller.gridStateMgr2.removeAllRows();
                           if(controller.gridStateMgr.rows.length == 1) {
                             controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 0);
                             controller.selectedInvnrIndex.value = 0;
                           }else {
                             controller.gridStateMgr.setCurrentCell(controller.gridStateMgr.firstCell, 1);
                             Get.log('현재위치: ${controller.gridStateMgr.currentRowIdx}');
                             controller.selectedInvnrIndex.value = controller.gridStateMgr.currentRowIdx!;
                           }
                           controller.isSelectedInvnr.value = true;
                           controller.isQr.value = true;
                           ///
                         }
                       }
                       // controller.isIpgoClick.value = false;
                       focusNode2.requestFocus();
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
                         child: Text('입고 등록',
                             style: AppTheme.a18700.copyWith(
                               color: AppTheme.white,
                             )),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ],
         ),
       ),
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
           width: controller.statusText.value == '' ? 200 : null,
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

   void updateRows() {
     controller.rowDatas2.value = List<PlutoRow>.generate(controller.ipgoList.length, (index) =>
         PlutoRow(cells:
         Map.from((controller.ipgoList[index]).map((key, value) =>
             MapEntry(key, PlutoCell(value: key == 'no' ? '${index + 1}' :/*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
         )))
     );
   }

   void updateRows2() {
     controller.rowDatas4.value = List<PlutoRow>.generate(controller.ipgoBoxList.length, (index) =>
         PlutoRow(cells:
         Map.from((controller.ipgoBoxList[index]).map((key, value) =>
             MapEntry(key, PlutoCell(value: /*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
         )))
     );
   }

   Widget _qrCodeTextForm(BuildContext context) {
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
                 padding: const EdgeInsets.only(left: 8, right: 6),
                 decoration: BoxDecoration(
                     border: Border.all(color: AppTheme.ae2e2e2),
                     borderRadius: BorderRadius.circular(10),
                   color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                 ),
                 child: KeyboardListener(
                   focusNode: focusNode2Key,
                   onKeyEvent: (event) async {
                     if (event is KeyDownEvent) {
                       if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                         // 엔터 키 감지
                         controller.isDuplQr.value = false;
                         if(controller.isSelectedInvnr.value) {
                           for(var i = 0; i < controller.ipgoList.length; i++) {
                             if(controller.ipgoList[i]['qrNo'].contains(controller.textQrController.text)) {
                               controller.isDuplQr.value = true;
                             }
                           }
                           if(controller.isDuplQr.value) {
                             controller.statusText.value = '중복된 QR코드입니다.';
                             controller.textQrController.text = '';
                           }else{
                             await controller.checkQR();
                             if(controller.ipgoQrList.isNotEmpty) {
                               if(controller.ipgoQrList.length > 1) {
                                 // 중복 QR코드가 있을 때 선택하게끔 POP UP 띄우기
                                 showDialog(
                                   barrierDismissible: false,
                                   context: context, //context
                                   builder: (BuildContext context) {
                                     return _alertDialog(context);
                                   },
                                 ); // context가 왜?
                               }else {
                                 controller.ipgoQrList[0].addAll({'no': '${controller.ipgoList.length + 1}'});
                                 controller.ipgoList.add(controller.ipgoQrList[0]);
                                 controller.insertRow = List<PlutoRow>.generate(controller.ipgoQrList.length, (index) =>
                                     PlutoRow(cells:
                                     Map.from((controller.ipgoQrList[index]).map((key, value) =>
                                         MapEntry(key, PlutoCell(value: value ?? '' )),
                                     )))
                                 );
                                 //  controller.rowDatas2.add(controller.insertRow[0]);
                                 controller.gridStateMgr2.insertRows(0, controller.insertRow);
                               }

                             }
                             controller.textQrController.text = '';
                             focusNode2.requestFocus();

                           }
                         }else {
                           controller.statusText.value = '거래명세서를 선택해주세요.';
                           controller.textQrController.text = '';
                           // Get.dialog(_dialog('거래명세서를 선택해주세요'));
                         }
                         controller.isQr.value = true;

                       }
                     }
                   },
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
                       controller.isQr.value = true;
                     },
                     onTapOutside:(event) => { controller.focusCnt.value = 0 },
                     keyboardType: TextInputType.none,
                     decoration: InputDecoration(

                       contentPadding: const EdgeInsets.all(0),
                       fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                       filled: true,
                      // hintText: 'BC 번호를 입력해주세요',
                       hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
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

         content: _alertList(context), /// 내부 메인body

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
                         Get.log('닫기 클릭!');
                         controller.ipgoQrList.clear();
                         controller.ipgoQrList.add(controller.ipgoDupQrList[controller.alertIndex.value]);
                         controller.ipgoQrList[0].addAll({'no': '${controller.ipgoList.length + 1}'});
                         controller.ipgoList.add(controller.ipgoQrList[0]);
                         controller.insertRow = List<PlutoRow>.generate(controller.ipgoQrList.length, (index) =>
                             PlutoRow(cells:
                             Map.from((controller.ipgoQrList[index]).map((key, value) =>
                                 MapEntry(key, PlutoCell(value: value ?? '' )),
                             )))
                         );
                         //  controller.rowDatas2.add(controller.insertRow[0]);
                         controller.gridStateMgr2.insertRows(controller.ipgoList.length, controller.insertRow);
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

   Widget _alertList(BuildContext context) {
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
         }, childCount: controller.ipgoDupQrList.length)));
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
           controller.alertIndex.value = index;
         //  Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
         },
         child: Obx(() => Container(
           margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
           padding: const EdgeInsets.only(top: 18, bottom: 18, left: 18, right: 18),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: controller.isSelect[index] ? Border.all(color: AppTheme.black, width: 3) : Border.all(color: AppTheme.ae2e2e2),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${controller.ipgoDupQrList[index]['qrNo']}'),
                      SizedBox(width: 12,),
                      Text('${controller.ipgoDupQrList[index]['itemCd']}'),
                      SizedBox(width: 12,),
                      Text('${controller.ipgoDupQrList[index]['itemNm']}')
                    ],
                  )

             ],
           ),
         ),)
     );
   }

   Widget _ipgoList(BuildContext context) {
     // final double height = 49*(double.parse((controller.ipgoList.length +  1).toString()));
     //final double height = 500;
     return Container(
       child: Expanded(
         child: Column(children: [
           Container(
             width: MediaQuery.of(context).size.width-32,
             height: MediaQuery.of(context).size.height - 650,
             child: Obx(() => PlutoGrid(
               columns: gridCols2(context),
               rows: controller.rowDatas2.value,
               onLoaded: (PlutoGridOnLoadedEvent event) {
                 controller.gridStateMgr2 = event.stateManager;
                 //controller.gridStateMgr2.setShowColumnFilter(true);
                 controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
                 controller.gridStateMgr2.addListener(_listener);
               },
               onChanged: (PlutoGridOnChangedEvent event) {
                 print(event);
               //  controller.ipgoList[controller.ipgoList.length - 1 - event.rowIdx].addAll({'qty': event.value!});
               },
         /*             rowColorCallback: (c) {
                 return c.row.checked == true ? Colors.red : Colors.transparent;
               },*/
               configuration: PlutoGridConfiguration(
                 style: PlutoGridStyleConfig(
                     columnHeight: 55,
                     rowHeight: 55,
                     columnTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                     cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
                     columnResizeIcon: const IconData(0),
                   // checkedColor: Colors.red.shade100,
                   /*   //gridBorderColor: Colors.transparent,
                     activatedColor: Colors.transparent,
                     checkedColor: Colors.red.shade100,
                     cellColorInReadOnlyState: Colors.white,
                     columnTextStyle: AppTheme.a14500.copyWith(color: AppTheme.black)*/
                 ),
               ),
             ),)
           ),
         ],),
       ),
     );
   }
   List<PlutoColumn> gridCols2(BuildContext context) {
     final List<PlutoColumn> gridCols2 = <PlutoColumn>[
       PlutoColumn(
         title: '번호',
         field: 'no',
         type: PlutoColumnType.text(),
         width: 80,
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
         title: '번호',
         field: 'itemNm',
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
       ),*/
       PlutoColumn(
         title: '라벨타입',
         field: 'tagTypeNm',
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
         title: '품목코드',
         field: 'itemCd',
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
         title: '품목명',
         field: 'itemNm',
         type: PlutoColumnType.text(),
         width: test2,
         enableSorting: false,
         enableEditingMode: false,
         enableContextMenu: false,
         enableRowDrag: false,
           enableDropToResize: false,
         //enableDropToResize: true,
         enableColumnDrag: false,
         titleTextAlign: PlutoColumnTextAlign.center,
         textAlign: PlutoColumnTextAlign.left,
         backgroundColor: AppTheme.gray_c_gray_200,
           renderer: (rendererContext) {
             return Container(
               margin: EdgeInsets.all(0),
               padding: EdgeInsets.all(0),
               width: 60,
               // color: textColor,
               child: Text(
                     rendererContext.cell.value.toString(),
                     style: AppTheme.a18400.copyWith(color: Colors.black)
               ),
             );
           }
       ),
       PlutoColumn(
         title: '수량',
         field: 'qty',
         type: PlutoColumnType.text(),
         width: 90,
         enableSorting: false,
         enableEditingMode: true,
         enableContextMenu: false,
         enableRowDrag: false,
         enableDropToResize: false,
         enableColumnDrag: false,
         enableAutoEditing: true,
         titleTextAlign: PlutoColumnTextAlign.center,
         textAlign: PlutoColumnTextAlign.center,
         backgroundColor: AppTheme.gray_c_gray_200,
         checkReadOnly: (PlutoRow row, PlutoCell cell) {
           var isCheck = true;
           if(controller.ipgoList.isNotEmpty) {
             if(controller.ipgoList[row.sortIdx]['qrNo'].toString().contains('^^^^')) {
               isCheck = false;
             }else {
               isCheck = true;
             }
           }
           return isCheck;
           /*controller.etcChulgoQrDetailTotalList[controller.currentRowIndex2.value]['qty'].toString() == '1';*/
         },
       ),
       PlutoColumn(
         title: '세트수',
         field: 'setQty',
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


   /// /////////////////////////// 소박스등록 /////////////////////////////////////////////////////////////////
   Widget _qrCodeTextForm2(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(left: 24, top: 6, bottom: 4),
       child: Row(
         children: [
           Text('QR 코드',
               style: AppTheme.a20700
                   .copyWith(color: AppTheme.black)),
           SizedBox(width: 8,),
           Container(

             width: 250,
             height: 40,
             // padding: const EdgeInsets.only(left: 20, right: 12, top: 4),
             child: Center(
                 child: Container(
                   padding: const EdgeInsets.only(left: 8, right: 6),
                   decoration: BoxDecoration(
                     border: Border.all(color: AppTheme.ae2e2e2),
                     borderRadius: BorderRadius.circular(10),
                     color: Color.lerp(Colors.yellowAccent, Colors.white, 0.8),
                   ),
                   child:  KeyboardListener(
                     focusNode: focusNode3Key,
                     onKeyEvent: (event) async {
                       if (event is KeyDownEvent) {
                         if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
                           // 엔터 키 감지
                           await controller.checkBoxQR();
                           if(controller.ipgoQrBoxList.isNotEmpty) {
                             /* controller.ipgoQrBoxList[0].addAll({'no': '${controller.ipgoBoxList.length + 1}'});*/
                             //  controller.ipgoBoxList.add(controller.ipgoQrBoxList[0]);
                             controller.insertRow2 = List<PlutoRow>.generate(controller.ipgoBoxList.length, (index) =>
                                 PlutoRow(cells:
                                 Map.from((controller.ipgoBoxList[index]).map((key, value) =>
                                     MapEntry(key, PlutoCell(value: value ?? '' )),
                                 )))
                             );
                             //  controller.rowDatas2.add(controller.insertRow[0]);
                             controller.gridStateMgr4.removeAllRows();
                             controller.gridStateMgr4.insertRows(0, controller.insertRow2);

                             controller.gridStateMgr4.setCurrentCell(controller.gridStateMgr4.firstCell, 0);
                             Get.log('현재위치: ${controller.gridStateMgr4.currentRowIdx}');
                             controller.currentRowIndex.value = controller.gridStateMgr4.currentRowIdx!;

                             /// 오른쪽 분할 그리드 시작!!
                             controller.insertRow3 = List<PlutoRow>.generate(controller.itemTotalList[0].length, (index) =>
                                 PlutoRow(cells:
                                 Map.from((controller.itemTotalList[0][index]).map((key, value) =>
                                     MapEntry(key, PlutoCell(value: value ?? '' )),
                                 )))
                             );
                             controller.gridStateMgr5.removeAllRows();
                             controller.gridStateMgr5.insertRows(0, controller.insertRow3);

                           }
                           controller.textQrController2.text = '';
                           controller.focusNode2.requestFocus();

                           controller.isQr2.value = false;
                           controller.smallBoxIsQr.value = true;
                         }
                       }
                     },
                     child: TextFormField(
                       expands :true,
                       minLines: null,
                       maxLines: null,
                       focusNode: controller.focusNode2,
                       style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
                       // maxLines: 5,
                       controller: controller.textQrController2,
                       textAlignVertical: TextAlignVertical.center,

                       onFieldSubmitted: (value) async {
                        // controller.isDuplQr.value = false;
                        /* if(controller.isSelectedInvnr.value) {*/
                           // 중복처리 일단 주석
                           /*for(var i = 0; i < controller.ipgoList.length; i++) {
                             if(controller.ipgoList[i]['qrNo'].contains(controller.textQrController.text)) {
                               controller.isDuplQr.value = true;
                             }
                           }*/
                           /*if(controller.isDuplQr.value) {
                             controller.statusText.value = '중복된 QR코드입니다.';
                             controller.textQrController.text = '';
                           }else{*/
                         /*  await controller.checkBoxQR();
                             if(controller.ipgoQrBoxList.isNotEmpty) {
                               *//* controller.ipgoQrBoxList[0].addAll({'no': '${controller.ipgoBoxList.length + 1}'});*//*
                               //  controller.ipgoBoxList.add(controller.ipgoQrBoxList[0]);
                                 controller.insertRow2 = List<PlutoRow>.generate(controller.ipgoBoxList.length, (index) =>
                                     PlutoRow(cells:
                                     Map.from((controller.ipgoBoxList[index]).map((key, value) =>
                                         MapEntry(key, PlutoCell(value: value ?? '' )),
                                     )))
                                 );
                                 //  controller.rowDatas2.add(controller.insertRow[0]);
                                 controller.gridStateMgr4.removeAllRows();
                                 controller.gridStateMgr4.insertRows(controller.ipgoBoxList.length, controller.insertRow2);

                                 controller.gridStateMgr4.setCurrentCell(controller.gridStateMgr4.firstCell, 0);
                                 Get.log('현재위치: ${controller.gridStateMgr4.currentRowIdx}');
                                 controller.currentRowIndex.value = controller.gridStateMgr4.currentRowIdx!;

                                 /// 오른쪽 분할 그리드 시작!!
                                 controller.insertRow3 = List<PlutoRow>.generate(controller.itemTotalList[0].length, (index) =>
                                     PlutoRow(cells:
                                     Map.from((controller.itemTotalList[0][index]).map((key, value) =>
                                         MapEntry(key, PlutoCell(value: value ?? '' )),
                                     )))
                                 );
                                 controller.gridStateMgr5.removeAllRows();
                                 controller.gridStateMgr5.insertRows(controller.ipgoBoxList.length, controller.insertRow3);

                             }
                             controller.textQrController2.text = '';
                             controller.requestFocus2();

                           //}
                         *//*}else {
                           controller.statusText2.value = '거래명세서를 선택해주세요.';
                           controller.textQrController2.text = '';
                           // Get.dialog(_dialog('거래명세서를 선택해주세요'));
                         }*//*
                         controller.isQr2.value = false;*/
                       },
                       keyboardType: TextInputType.none,
                       decoration: InputDecoration(

                         contentPadding: const EdgeInsets.all(0),
                         fillColor: Color.lerp(Colors.yellowAccent, Colors.white, 0.8), // 박효신
                         filled: true,
                         // hintText: 'BC 번호를 입력해주세요',
                         hintStyle: AppTheme.a14400.copyWith(color: AppTheme.aBCBCBC),
                         border: InputBorder.none,
                       ),
                       showCursor: true,


                     ),
                   ),)
             ),
           ),
         ],
       ),
     );
   }

   Widget _statusText2() {
     return Container(
       padding: EdgeInsets.only(top: 6, bottom: 4),
       child: Row(
         children: [
           Text('상태',
               style: AppTheme.a20700
                   .copyWith(color: AppTheme.black)),
           SizedBox(width: 8,),
           Container(
             padding: EdgeInsets.only(top: 6, left: 8, right: 8),
             height: 40,
             width: controller.statusText2.value == '' ? 250 : null,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 border: Border.all(color: AppTheme.ae2e2e2)),
             child: Text(controller.statusText2.value,
               style:  AppTheme.a20700.copyWith(color: AppTheme.red_red_900),
               // maxLines: 5,

             ),

           ),
         ],
       ),
     );
   }
   Widget _smallItemD() {
     return Row(
       children: [
          Text('장소'),
          DropdownButton(items: controller.containerList.map((value) {
            return DropdownMenuItem(child: Text(''));
          }).toList(),
          onChanged: (a) {
            Get.log('');
            Get.log('');
          })
       ],
     );
   }


   Widget _smallBoxDropDownItem() {
     return Row(
       children: [
         Text('위치', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
         SizedBox(width: 8,),
         Container(
           height: 40,
           width: 210,
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
               value: controller.selectedSmallBoxContainer['NAME'],
               items: controller.smallBoxContainer.map((value) {
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
                 controller.smallBoxContainer.map((e) {
                   if(e['NAME'] == value) {
                     controller.selectedSmallBoxContainer['CODE'] = e['CODE'];
                     controller.selectedSmallBoxContainer['NAME'] = e['NAME'];
                   }
                 }).toList();
               }),
         ),
       ],

     );
   }
   Widget _oneDropDownItem() {
     return Row(
       children: [
         Text('위치', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
         SizedBox(width: 8,),
         Container(
           height: 40,
           width: 210,
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
               value: controller.selectedOneBoxContainer['NAME'],
               items: controller.oneContainer.map((value) {
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
                 controller.oneContainer.map((e) {
                   if(e['NAME'] == value) {
                     controller.selectedOneBoxContainer['CODE'] = e['CODE'];
                     controller.selectedOneBoxContainer['NAME'] = e['NAME'];
                   }
                 }).toList();
               }),
         ),
       ],

     );
   }

   Widget _subBody1(BuildContext context) {
     return Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Container(
           color: AppTheme.black,
           height: 1,
         ),
         Container(

           child: SingleChildScrollView(
             padding: EdgeInsets.zero,
             scrollDirection: Axis.horizontal,
             child: Container(
               width: MediaQuery.of(context).size.width- 12,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     width: MediaQuery.of(context).size.width/2 + 50,
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         children: [
                           _qrCodeTextForm2(context),
                           SizedBox(width: 16,),
                           Obx(()=> _statusText2()),
                         ],

                       ),
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Obx(() => _smallBoxDropDownItem(),),
                       SizedBox(width: 24,),
                       Container(
                         margin: EdgeInsets.only(right: 12),
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
                           onPressed: () {
                             Get.log('행 삭제 클릭!');
                             if(controller.gridStateMgr4.currentRowIdx != null) {
                               controller.ipgoBoxList.removeAt(controller.gridStateMgr4.currentRowIdx!);
                               controller.gridStateMgr4.removeAllRows();
                               controller.gridStateMgr5.removeAllRows();
                               updateRows2();
                               controller.gridStateMgr4.appendRows(controller.rowDatas4.value);
                               controller.statusText.value = '';
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
                               child: Text('행 삭제',
                                   style: AppTheme.a18700.copyWith(
                                     color: AppTheme.white,
                                   )),
                             ),
                           ),
                         ),
                       ),
                       SizedBox(width: 12,),
                       Container(
                         margin: EdgeInsets.only(right: 12),
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
                             if(controller.isIpgoClick2.value == false) {
                               controller.isIpgoClick2.value = true;
                               Get.log('입고등록 클릭!');
                               if(controller.isIpgoClick2.value) {
                                 await controller.reqCheburnIpgoSmall();
                                 await controller.registIpgoBoxBtn();
                                 if(controller.isSboxIpgo.value) {
                                   SchedulerBinding.instance!.addPostFrameCallback((_) {
                                     Get.dialog(CommonDialogWidget(contentText: '저장되었습니다', pageFlag: 3,));
                                     controller.isIpgoClick2.value = false;
                                   });
                                   controller.ipgoQrBoxList.clear();
                                   controller.ipgoBoxList.clear();
                                   controller.gridStateMgr4.removeAllRows();
                                   controller.gridStateMgr5.removeAllRows();
                                 }
                               }


                             }
                             controller.isIpgoClick2.value = false;

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
                               child: Text('입고 등록',
                                   style: AppTheme.a18700.copyWith(
                                     color: AppTheme.white,
                                   )),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         ),
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
       ],
     );

   }


   Widget _rackIpgoList(BuildContext context) {
     // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
     final double height = 200;
     return Container(
       // padding: EdgeInsets.only(bottom: 20),
       width: MediaQuery.of(context).size.width/2  ,
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
                 columns: smallGridCols(context),
                 rows: controller.rowDatas4.value,
                 onLoaded: (PlutoGridOnLoadedEvent event) {
                   controller.gridStateMgr4 = event.stateManager;
                   controller.gridStateMgr4.setSelectingMode(PlutoGridSelectingMode.none);
                   // controller.requestFocus();
                   // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                   //gridStateMgr.setShowColumnFilter(true); ea.controller.addAll() dajsdeafdaescontroellre .A
                 },
                 onChanged: (PlutoGridOnChangedEvent event) {
                   print(event);
                 },
                 onSelected: (c) {
                   print(controller.gridStateMgr4.currentRowIdx);
                   controller.currentRowIndex.value = c.rowIdx!;
                   controller.currentRowIndex.value != controller.gridStateMgr4.currentRowIdx!
                       ? {/*controller.ipgoQrList.clear(), controller.ipgoList.clear(),*/ controller.gridStateMgr5.removeAllRows()} : null;
                   controller.currentRowIndex.value = controller.gridStateMgr4.currentRowIdx!;


                   /// 오른쪽 분할 그리드 시작!!
                   controller.insertRow3 = List<PlutoRow>.generate(controller.itemTotalList[controller.currentRowIndex.value].length, (index) =>
                       PlutoRow(cells:
                       Map.from((controller.itemTotalList[controller.currentRowIndex.value][index]).map((key, value) =>
                           MapEntry(key, PlutoCell(value: value ?? '' )),
                       )))
                   );

                   controller.gridStateMgr5.removeAllRows();
                   controller.gridStateMgr5.appendRows(controller.insertRow3);
                   controller.isQr2.value = false;


                 /*  Map<dynamic, List<Map<String, dynamic>>> groupedMap = {};
                   // chulSecondList를 순회하면서 no 값을 키로 그룹화
                   for (var item in controller.chulSecondList) {
                     var key = item['no'];
                     if (groupedMap.containsKey(key)) {
                       groupedMap[key]!.add(item);
                     } else {

                       groupedMap[key] = [item];
                     }
                   }
                  // letMap()
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

                   controller.gridStateMgr4.removeAllRows();
                   controller.gridStateMgr4.appendRows(controller.rowDatas3);
                   controller.isQr2.value = false;
                   // controller.requestFocus();*/
                 },
                 rowColorCallback: (c) {

                     if(controller.gridStateMgr5.currentRowIdx == c.rowIdx) {
                       return AppTheme.blue_blue_50;
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
   List<PlutoColumn> smallGridCols(BuildContext context) {
     final List<PlutoColumn> smallGridCols = <PlutoColumn>[
       PlutoColumn(
         title: '순서',
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
       PlutoColumn(
           title: '라벨타입',
           field: 'tagTypeNm',
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
         title: 'QR코드',
         field: 'qrNo',
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
         field: 'wmsQty',
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
         title: '단위',
         field: 'wmsQtyUnit',
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
     return smallGridCols;
   }


   Widget _rackIpgoList2(BuildContext context) {
     // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
     final double height = 200;
     return Container(
       width: MediaQuery.of(context).size.width/2 - 60,
       height: MediaQuery.of(context).size.height - 250,
       margin: EdgeInsets.only(left: 12, right: 12),
       child: SingleChildScrollView(
         child: Container(
           child: Column(children: [
             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height - 250,
               child: PlutoGrid(
                 columns: smallGridCols2(context),
                 rows: controller.rowDatas5.value,
                 onLoaded: (PlutoGridOnLoadedEvent event) {
                   controller.gridStateMgr5 = event.stateManager;
                   controller.gridStateMgr5.setSelectingMode(PlutoGridSelectingMode.none);
                   // Get.log('${controller.gridStateMgr2.currentRowIdx!}');
                   //gridStateMgr.setShowColumnFilter(true);
                 },
                 onChanged: (PlutoGridOnChangedEvent event) {
                   print(event);
                 },
                 onSelected: (c) {
                   print(controller.gridStateMgr5.currentRowIdx);
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
   List<PlutoColumn> smallGridCols2(BuildContext context) {
     final List<PlutoColumn> smallGridCols2 = <PlutoColumn>[
         PlutoColumn(
          title: '번호',
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
       PlutoColumn(
         title: '라벨타입',
         field: 'tagTypeNm',
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
         title: '라벨번호',
         field: 'qrNo',
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
         title: '품목코드',
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
         title: '품목명',
         field: 'itemNm',
         type: PlutoColumnType.text(),
         width: MediaQuery.of(context).size.width/2 - 280,
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
         field: 'wmsQty',
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
         title: '단위',
         field: 'wmsQtyUnit',
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
     return smallGridCols2;
   }






   /// /////////////////////////////////////////////////////// 입고취소 //////////////////////////////////

   Widget _subBody2(BuildContext context) {
     return Container(
       child: Column(
         children: [
           Container(
             margin: EdgeInsets.only(left: 12, right: 12),
             padding: EdgeInsets.only(bottom: 4,),
             decoration: BoxDecoration(
                 border: Border(
                     bottom: BorderSide(
                         color: AppTheme.black
                     )
                 )
             ),

           ),
           SizedBox(height: 4,),
           Obx(() => _SearchCondition3(context),),
           SizedBox(height: 4,),
           Container(
             margin: EdgeInsets.only(left: 12, right: 12),
             decoration: BoxDecoration(
                 border: Border(
                     top: BorderSide(color: AppTheme.gray_c_gray_200)
                 )
             ),
           ),
           _SearchCondition4(context),
          // _SearchCondition4(context),
           SizedBox(height: 12,),
           _ipgoCancelList(context),



         ],
       ),
     );
   }

   Widget _SearchCondition3(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Container(
           width:  MediaQuery.of(context).size.width - 150 ,
           padding: EdgeInsets.only(left: 24),
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 Text('입고일자', style: AppTheme.a20700.copyWith(color: AppTheme.black),),
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
                         controller.dayStartValue2.value = datePicked.toString().replaceRange(startIndex, lastIndex, '');
                         /*    if(controller.choiceButtonVal.value != 0) {

                           }*/
                       }else {
                         controller.dayStartValue2.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                       }
                       if(datePicked.toString() == '1994-01-01 00:00:00.000') {
                         controller.dayStartValue2.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                       }
                     },
                     child: Container(
                       height: 40,
                       width: 130,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all( color: AppTheme.ae2e2e2)),
                       padding: const EdgeInsets.only(right: 12),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(controller.dayStartValue2.value, style: AppTheme.a12500
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
                         controller.dayEndValue2.value = datePicked.toString().replaceRange(startIndex, lastIndex, '');
                         /* if(controller.choiceButtonVal.value != 0) {

                           }*/
                       }else {
                         controller.dayEndValue2.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                       }
                       if(datePicked.toString() == '1994-01-01 00:00:00.000') {
                         controller.dayEndValue2.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
                       }

                       Get.log("Date Picked ${datePicked.toString()}");
                       //  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                     },
                     child: Container(
                       height: 40,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: AppTheme.ae2e2e2)),
                       width: 130,
                       padding: const EdgeInsets.only( right: 12),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(controller.dayEndValue2.value, style: AppTheme.a14500
                               .copyWith(color: AppTheme.a6c6c6c
                               , fontSize: 17),),
                         ],
                       ),

                     ),
                   ),
                 ),
                 SizedBox(width: 16,),
                 _dropDownItem2(),
                 SizedBox(width: 16,),
                 _joneDropDownItem('존 구분', 0),
                 SizedBox(width: 16,),
                 _joneDropDownItem('입고 구분', 1),

               ],
             ),
           ),
         ),
         Container(
           margin: EdgeInsets.only(right: 12),
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
               if(controller.isCancelChecked.value == false) {
                 controller.isCancelChecked.value = true;
                 await controller.cancelCheckBtn();
                 _ipgoCancelList(context);
                 controller.height.value = 53*(double.parse((controller.ipgoCancelList.length + 1).toString()));
               }

              /* if(controller.ipgoCancelList.isNotEmpty) {
                 for(var i = 0; i < controller.ipgoCancelList.length; i++) {
                   controller.ipgoCancelList[i].addAll({'checkBox': ''});
                 }
                 controller.insertRow = List<PlutoRow>.generate(controller.ipgoCancelList.length, (index) =>
                     PlutoRow(cells:
                     Map.from((controller.ipgoCancelList[index]).map((key, value) =>
                         MapEntry(key, PlutoCell(value: value ?? '' )),
                     )))
                 );
                 //  controller.rowDatas2.add(controller.insertRow[0]);
                 controller.gridStateMgr3.insertRows(controller.ipgoCancelList.length, controller.insertRow);
               }*/
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
                     style: AppTheme.a18700.copyWith(
                       color: AppTheme.white,
                     )),
               ),
             ),
           ),
         ),
       ],
     );
   }

   Widget _SearchCondition4(BuildContext context) {
     return Container(
       margin: EdgeInsets.only(left: 12,),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(

             width:  MediaQuery.of(context).size.width - 200 ,
             padding: EdgeInsets.only(left: 12, top: 4),
             child: SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   //_invnrTextForm3(),
                   _invnrTextForm2('거래명세서 번호', 0),
                   SizedBox(width: 16,),
                   _invnrTextForm2('품목코드', 1),
                   SizedBox(width: 16,),
                   _invnrTextForm2('프로젝트명', 2)
                 ],
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 12),
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
                  await controller.registCancelIpgoBtn();
                  Get.log('입고취소되었습니다');
                  Get.dialog(_alert());

                   // CommonDialogWidget(contentText: '취소되었습니다', pageFlag: 3,);


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
                   child: Text('입고 취소',
                       style: AppTheme.a18700.copyWith(
                         color: AppTheme.white,
                       )),
                 ),
               ),
             ),
           ),
         ],
       ),
     );
   }


   Widget _invnrTextForm2(String title, int plag) {
     return Row(
       children: [
         Text(title,
             style: AppTheme.a20700
                 .copyWith(color: AppTheme.black)),
         SizedBox(width: 8,),
         Container(
           padding: EdgeInsets.only(top: 4, left: 8),
           height: 40,
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
               style:  AppTheme.a20400.copyWith(color: AppTheme.a6c6c6c),
               // maxLines: 5,
               controller: plag == 0 ? controller.textInvnrController2 : plag == 1 ? controller.textItemController2
                   : controller.textProjectController2,
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

   Widget _dropDownItem2() {
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
               value: controller.selectedCancelContainer['NAME'],
               items: controller.cancelContainerList.map((value) {
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
                 controller.cancelContainerList.map((e) {
                   if(e['NAME'] == value) {
                     controller.selectedCancelContainer['CODE'] = e['CODE'];
                     controller.selectedCancelContainer['NAME'] = e['NAME'];
                   }
                 }).toList();
               }),
         ),
       ],
     );
   }

   Widget _joneDropDownItem(String title, int gubun) {
     return Row(
       children: [
         Text(title, style: AppTheme.a20700.copyWith(color: AppTheme.black),),
         SizedBox(width: 8,),
         Container(
           height: 40,
           width: 185,
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
               value: gubun == 0 ? controller.selectedZone['NAME'] : controller.selectedIpgoDropdown['NAME'],
               items: gubun == 0 ? controller.zoneList.map((value) {
                 return DropdownMenuItem<String>(
                   value: value['NAME'].toString(),
                   child: Text(
                     value['NAME'].toString(),
                     style: AppTheme.a20400
                         .copyWith(color: value['NAME'].toString() == '선택해주세요' ? AppTheme.aBCBCBC : AppTheme.a6c6c6c),
                   ),
                 );
               }).toList()
               : controller.ipgoDropdownList.map((value) {
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
                 gubun == 0 ?
                 controller.zoneList.map((e) {
                   if(e['NAME'] == value) {
                     controller.selectedZone['CODE'] = e['CODE'];
                     controller.selectedZone['NAME'] = e['NAME'];
                   }
                 }).toList() :
                 controller.ipgoDropdownList.map((e) {
                   if(e['NAME'] == value) {
                     controller.selectedIpgoDropdown['CODE'] = e['CODE'];
                     controller.selectedIpgoDropdown['NAME'] = e['NAME'];
                   }
                 }).toList();
               }),
             /*DropdownButton(
                 borderRadius: BorderRadius.circular(10),
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
                 value: controller.selectedMachMap['CMH_NM'],
                 //  flag == 3 ? controller.selectedNoReason.value :
                 items: controller.machList.map((value) {
                   return DropdownMenuItem<String>(
                     value: value['CMH_NM'],
                     child: Text(
                       value['CMH_NM'],
                       style: AppTheme.a16500
                           .copyWith(color: value['CMH_NM'] == '설비 선택' ? AppTheme.light_placeholder : AppTheme.a6c6c6c),
                     ),
                   );
                 }).toList(),
                 onChanged: (value) {
                   controller.machList.map((e) {
                     if(e['CMH_NM'] == value) {
                       controller.selectedMachMap['CMH_ID'] = e['CMH_ID'].toString();
                       controller.selectedMachMap['CMH_NM'] = e['CMH_NM'];
                     }
                     //  Get.log('${ controller.selectedLocationMap} 선택!!!!');
                   }).toList();

                   Get.log('$value 선택!!!!');
                   // Get.log('${HomeApi.to.BIZ_DATA('L_USER_001')}');
                 })*/
           // Get.log('aa');
         ),
       ],
     );
   }


   Widget _ipgoCancelList(BuildContext context) {

     return Column(children: [
       Obx(() => Container(
           width: MediaQuery.of(context).size.width-32,
           height: MediaQuery.of(context).size.height-270,
           child: PlutoGrid(
             columns: gridCols3(context),
             rows: controller.rowDatas3.value,
             onLoaded: (PlutoGridOnLoadedEvent event) {
               controller.gridStateMgr3 = event.stateManager;
               controller.gridStateMgr3.setSelectingMode(PlutoGridSelectingMode.none);

             },
             onChanged: (PlutoGridOnChangedEvent event) {
               print(event);

             },
             onRowChecked: (event) {
               // 만약 체크 로직을 타게되면 역순으로 바꿔야한다.
               if (event.isChecked != null) {
                 if(event.isAll == true) {
                   if (event.isChecked == true) {
                     for(var i = 0; i < controller.ipgoCancelBollList.length; i++) {
                       controller.ipgoCancelBollList[i] = true;
                     }
                     Get.log('이거 봐야함1 true ${controller.ipgoCancelBollList.value}');
                   }else{
                     for(var i = 0; i < controller.ipgoCancelBollList.length; i++) {
                       controller.ipgoCancelBollList[i] = false;
                     }
                     Get.log('이거 봐야함1 false ${controller.ipgoCancelBollList.value}');
                   }


                 }else {
                   if (event.isChecked == true) {
                     // 화면상에서 역순으로 보여지게 만들어놨기 때문에 rowIdx랑 안맞는다 -> 그래서 역순으로 bollList 값을 잡고 바꿔주도록 설계
                     controller.ipgoCancelBollList[controller.ipgoCancelBollList.length -1 - event.rowIdx!] = true;
                     // controller.selectedCancelList.add(event.row!.cells.entries);
                     Get.log('이거 봐야함2 ${controller.ipgoCancelBollList.value}');
                   } else {
                     controller.ipgoCancelBollList[controller.ipgoCancelBollList.length -1 - event.rowIdx!] = false;
                     //  controller.selectedCancelList.remove(event.rowIdx);
                     Get.log('이거 봐야함3 ${controller.ipgoCancelBollList.value}');
                   }
                 }
               }

             },
             configuration: PlutoGridConfiguration(
               style: PlutoGridStyleConfig(
                   columnHeight: 55,
                   rowHeight: 55,
                   //gridBorderColor: Colors.transparent,
                   //  activatedColor: Colors.transparent,
                   cellColorInReadOnlyState: Colors.white,
                   columnTextStyle: AppTheme.a18400.copyWith(color: AppTheme.black),
                 cellTextStyle: AppTheme.a18700.copyWith(color: AppTheme.black),
               ),
             ),
           ),)
       ),
     ],);
   }

   List<PlutoColumn> gridCols3(BuildContext context) {
     final List<PlutoColumn> gridCols3 = <PlutoColumn>[
      /* PlutoColumn(
         title: '',
         field: 'checkbox',
         type: PlutoColumnType.text(),
         width: 70,
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
       ),*/
       PlutoColumn(
         title: '번호',
         field: 'no',
         type: PlutoColumnType.text(),
         width: 120,
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
         title: '입고일자',
         field: 'InbDt',
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
         title: '거래명세서 번호',
         field: 'docNo',
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
         title: '품목코드',
         field: 'itemCd',
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
         title: '품목명',
         field: 'itemNm',
         type: PlutoColumnType.text(),
         width: test,
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
         title: 'Lot No',
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
         title: '입고수량',
         field: 'qty',
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
         title: '입고번호',
         field: 'inbNo',
         type: PlutoColumnType.text(),
         width: 190,
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
         title: '입고구분',
         field: 'inbTypeNm',
         type: PlutoColumnType.text(),
         width: 190,
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
         title: '프로젝트명',
         field: 'pjtNm',
         type: PlutoColumnType.text(),
         width: 240,
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
         title: '업체명',
         field: 'vendNm',
         type: PlutoColumnType.text(),
         width: 120,
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
         title: '입고담당자',
         field: 'inbUserNm',
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
     return gridCols3;
   }


   Widget _dialog(String text) {
     return AlertDialog(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
       scrollable: true,
       content: Container(
         padding: EdgeInsets.only(top: 12, bottom: 12),
         child: Center(
           child: Text(
             text,
             style: AppTheme.bodyBody2,
             overflow: TextOverflow.ellipsis,
             maxLines: 10,
           ),
         ),
       ),
       buttonPadding: const EdgeInsets.all(0),
       insetPadding: const EdgeInsets.all(0),
       titlePadding: const EdgeInsets.all(0),
       contentPadding: const EdgeInsets.only(top: 16, bottom: 12),
       actions: [
         Material(
           child: TextButton(
             style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     const RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(
                             bottomRight: Radius.circular(5)))),
                 padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
             // 성공
             onPressed: () {
               Get.back();
             },
             child: Container(
               padding: const EdgeInsets.only(top: 16, bottom: 16),
               color: Colors.black,
               child: Center(
                   child: Text(
                       '확인',
                       style: AppTheme.titleSubhead2.copyWith(color: AppTheme.white)
                   )),
             ),
           ),
         ),
       ],
     );
   }

   Widget _alert() {
     return AlertDialog(
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
       scrollable: true,
       content: Container(
         padding: EdgeInsets.only(top: 12, bottom: 12),
         child: Center(
           child: Text(
             '취소되었습니다',
             style: AppTheme.bodyBody2,
             overflow: TextOverflow.ellipsis,
             maxLines: 10,
           ),
         ),
       ),

       buttonPadding: const EdgeInsets.all(0),
       insetPadding: const EdgeInsets.all(0),
       titlePadding: const EdgeInsets.all(0),
       contentPadding: const EdgeInsets.only(top: 16, bottom: 12),
       actions: [
         Material(
           child: TextButton(
             style: ButtonStyle(
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                     const RoundedRectangleBorder(
                         borderRadius: BorderRadius.only(
                             bottomRight: Radius.circular(5)))),
                 padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
             // 성공
             onPressed: () {
               /*pageFlag == 1 ?
              Get.offAllNamed(Routes.FACILITY_FIRST)
                  :  pageFlag == 2 ? Get.offAllNamed(Routes.FACILITY) :  pageFlag == 3 ? Get.back() :
              pageFlag == 4 ? Get.back() : pageFlag == 5 ? Get.offAllNamed(Routes.PROCESS_TRANSFER)  : pageFlag == 6 ?  Get.back()
                  : Get.offAllNamed(Routes.MAIN);*/
               Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
               controller.cancelCheckBtn();
               //  Get.back();
             },
             child: Container(
               padding: const EdgeInsets.only(top: 16, bottom: 16),
               color: Colors.black,
               child: Center(
                   child: Text(
                       '확인',
                       style: AppTheme.titleSubhead2.copyWith(color: AppTheme.white)
                   )),
             ),
           ),
         ),
       ],
     );
   }
}
