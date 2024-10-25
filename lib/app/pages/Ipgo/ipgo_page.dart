
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
  late double test;

  @override
  Widget build(BuildContext context) {
    test = MediaQuery.of(context).size.width - 490;
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

  Widget _mainBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            color: AppTheme.dark_text_secondary,
            height: 1,
          ),
          Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        //  tabAlignment: TabAlignment.start,
                        onTap: (i) async {
                         /* if (i == 0) {
                            controller.chkYn.value = '';
                            await controller.reqListAlarm();
                          } else if (i == 1) {
                            controller.chkYn.value = 'N';
                            await controller.reqListAlarm();
                          } else if (i == 2) {
                            controller.chkYn.value = 'Y';
                            await controller.reqListAlarm();
                          }*/
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
                              style: AppTheme.titleSubhead3,
                            ),
                          ),
                          Container(

                            height: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              '입고취소',
                              style: AppTheme.titleSubhead3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: AppTheme.dark_text_secondary,
                height: 1,
              ),
              SizedBox(height: 12,),
              SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                child:TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: [
                    _subBody(context),
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
                Text('거래명세서 정보', style: AppTheme.a15700.copyWith(color: AppTheme.black),)
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
                Text('입고 등록', style: AppTheme.a15700.copyWith(color: AppTheme.black),)
              ],
            ),
          ),
          SizedBox(height: 4,),
           _SearchCondition2(context),
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
                 Text('입고일자', style: AppTheme.a12700.copyWith(color: AppTheme.black),),
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
                         height: 35,
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
                         height: 35,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(color: AppTheme.ae2e2e2)),
                         width: 150,
                         padding: const EdgeInsets.only( right: 12),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(controller.dayEndValue.value, style: AppTheme.a14500
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
                 _invnrTextForm('거래명세서 번호', 0),
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
           height: 35,
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
               Get.log('조회 클릭!');
               controller.checkBtn();
               controller.invnrHeight.value = 53*(double.parse((controller.ipgoCancelList.length + 1).toString()));
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
                 child: Text('조회',
                     style: AppTheme.a12700.copyWith(
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
         Text('창고', style: AppTheme.a12700.copyWith(color: AppTheme.black),),
         SizedBox(width: 8,),
         Container(
           height: 35,
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
                     style: AppTheme.a16400
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

   Widget _invnrTextForm(String title, int plag) {
    return Row(
      children: [
        Text(title,
            style: AppTheme.a12700
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
                  readOnly:  plag == 4 ? true : false,
                  expands :true,
                  minLines: null,
                  maxLines: null,
                    style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
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



   Widget _invnrList(BuildContext context) {
    // final double height = 49*(double.parse((controller.ipgoList.length + 1).toString()));
     final double height = 100;
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
     PlutoColumn(
       title: '입고일자',
       field: 'grDt',
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
       title: '품목명',
       field: 'itemNm',
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
       title: 'SAP 수량',
       field: 'sapQty',
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
       title: 'SAP 잔량',
       field: 'rmnQty',
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
       field: 'sapQtyUnit',
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
       textAlign: PlutoColumnTextAlign.center,
       backgroundColor: AppTheme.gray_c_gray_200,
     ),
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
       textAlign: PlutoColumnTextAlign.center,
       backgroundColor: AppTheme.gray_c_gray_200,
     ),
   ];


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
                 _qrCodeTextForm(),
                // _invnrTextForm('QR 코드', 3),
                 SizedBox(width: 16,),
                 _statusText(),
               ],
             ),
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Container(
               margin: EdgeInsets.only(right: 12),
               width: 120,
               height: 35,
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
                   height: 35,
                   padding: const EdgeInsets.only(

                   ),
                   child: Center(
                     child: Text('행 삭제',
                         style: AppTheme.a12700.copyWith(
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
               height: 35,
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
                   Get.log('입고등록 클릭!');
                   await controller.reqCheburnIpgo();
                   await controller.registIpgoBtn();

                   SchedulerBinding.instance!.addPostFrameCallback((_) {
                     Get.dialog(CommonDialogWidget(contentText: '저장되었습니다', pageFlag: 3,));
                   });
                   controller.ipgoQrList.clear();
                   controller.ipgoList.clear();
                   controller.gridStateMgr2.removeAllRows();

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
                     child: Text('입고 등록',
                         style: AppTheme.a12700.copyWith(
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

   void updateRows() {
     controller.rowDatas2.value = List<PlutoRow>.generate(controller.ipgoList.length, (index) =>
         PlutoRow(cells:
         Map.from((controller.ipgoList[index]).map((key, value) =>
             MapEntry(key, PlutoCell(value: key == 'no' ? '${index + 1}' :/*key == 'STOCK_QTY' ? NumberFormat('#,##0.0').format(value).replaceAll(' ', '') : key == 'IN_DATE' ? value != '' ? value.toString().substring(0,4) + '.' +  value.toString().substring(4,6) + '.' +  value.toString().substring(6, 8) : value : */value )),
         )))
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
                         }
                         controller.textQrController.text = '';
                         focusNode2.requestFocus();

                       }
                     }else {
                       controller.statusText.value = '거래명세서를 선택해주세요.';
                       controller.textQrController.text = '';
                      // Get.dialog(_dialog('거래명세서를 선택해주세요'));
                     }
                     Future.delayed(const Duration(), (){
                       focusNode2.requestFocus();
                       //  FocusScope.of(context).requestFocus(focusNode);
                       Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                     });
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
                     ),*/

                     contentPadding: const EdgeInsets.all(0),
                     fillColor: Colors.white,
                     filled: true,
                    // hintText: 'BC 번호를 입력해주세요',
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

   Widget _ipgoList(BuildContext context) {
     // final double height = 49*(double.parse((controller.ipgoList.length +  1).toString()));
     final double height = 250;
     return Container(
       child: Column(children: [
         Container(
           width: MediaQuery.of(context).size.width-32,
           height: height,
           child: Obx(() => PlutoGrid(
             columns: gridCols2(context),
             rows: controller.rowDatas2.value,
             onLoaded: (PlutoGridOnLoadedEvent event) {
               controller.gridStateMgr2 = event.stateManager;
               //controller.gridStateMgr2.setShowColumnFilter(true);
               controller.gridStateMgr2.setSelectingMode(PlutoGridSelectingMode.none);
             },
             onChanged: (PlutoGridOnChangedEvent event) {
               print(event);
             },
/*             rowColorCallback: (c) {
               return c.row.checked == true ? Colors.red : Colors.transparent;
             },*/
             configuration: PlutoGridConfiguration(
               style: PlutoGridStyleConfig(
                   columnHeight: 40,
                   rowHeight: 55,
                   columnTextStyle: AppTheme.a14500.copyWith(color: AppTheme.black),
                   columnResizeIcon: IconData(0),
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
     );
   }
   List<PlutoColumn> gridCols2(BuildContext context) {
     final List<PlutoColumn> gridCols2 = <PlutoColumn>[
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
         enableDropToResize: true,
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
         enableDropToResize: true,
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
         enableDropToResize: true,
         enableColumnDrag: false,
         titleTextAlign: PlutoColumnTextAlign.center,
         textAlign: PlutoColumnTextAlign.center,
         backgroundColor: AppTheme.gray_c_gray_200,
       ),
       PlutoColumn(
         title: '수량',
         field: 'qty',
         type: PlutoColumnType.text(),
         width: 90,
         enableSorting: false,
         enableEditingMode: false,
         enableContextMenu: false,
         enableRowDrag: false,
         enableDropToResize: true,
         enableColumnDrag: false,
         titleTextAlign: PlutoColumnTextAlign.center,
         textAlign: PlutoColumnTextAlign.center,
         backgroundColor: AppTheme.gray_c_gray_200,
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
         enableDropToResize: true,
         enableColumnDrag: false,
         titleTextAlign: PlutoColumnTextAlign.center,
         textAlign: PlutoColumnTextAlign.center,
         backgroundColor: AppTheme.gray_c_gray_200,
       ),
     ];
     return gridCols2;
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
           width:  MediaQuery.of(context).size.width - 200 ,
           padding: EdgeInsets.only(left: 24),
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 Text('입고일자', style: AppTheme.a12700.copyWith(color: AppTheme.black),),
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
                       height: 35,
                       width: 150,
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
                       height: 35,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: AppTheme.ae2e2e2)),
                       width: 150,
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
           height: 35,
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
               await controller.cancelCheckBtn();
               _ipgoCancelList(context);
               controller.height.value = 53*(double.parse((controller.ipgoCancelList.length + 1).toString()));
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
               height: 35,
               padding: const EdgeInsets.only(

               ),
               child: Center(
                 child: Text('조회', //입고취소 조회
                     style: AppTheme.a12700.copyWith(
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
                   _invnrTextForm2('거래명세서 번호', 0),
                   SizedBox(width: 16,),
                   _invnrTextForm2('품목코드', 1),
                   SizedBox(width: 16,),
                   _invnrTextForm2('프로젝트명', 2),
                 ],
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.only(right: 12),
             width: 120,
             height: 35,
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
                 height: 35,
                 padding: const EdgeInsets.only(

                 ),
                 child: Center(
                   child: Text('입고 취소',
                       style: AppTheme.a12700.copyWith(
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
             style: AppTheme.a12700
                 .copyWith(color: AppTheme.black)),
         SizedBox(width: 8,),
         Container(
           padding: EdgeInsets.only(top: 4, left: 8),
           height: 35,
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
               style:  AppTheme.a14400.copyWith(color: AppTheme.a6c6c6c),
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
         Text('창고', style: AppTheme.a12700.copyWith(color: AppTheme.black),),
         SizedBox(width: 8,),
         Container(
           height: 35,
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
                     style: AppTheme.a16400
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
         Text(title, style: AppTheme.a12700.copyWith(color: AppTheme.black),),
         SizedBox(width: 8,),
         Container(
           height: 35,
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
                     style: AppTheme.a16400
                         .copyWith(color: value['NAME'].toString() == '선택해주세요' ? AppTheme.aBCBCBC : AppTheme.a6c6c6c),
                   ),
                 );
               }).toList()
               : controller.ipgoDropdownList.map((value) {
                 return DropdownMenuItem<String>(
                   value: value['NAME'].toString(),
                   child: Text(
                     value['NAME'].toString(),
                     style: AppTheme.a16400
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
         ),
       ],
     );
   }


   Widget _ipgoCancelList(BuildContext context) {

     return Column(children: [
       Obx(() => Container(
           width: MediaQuery.of(context).size.width-32,
           height: controller.height.value,
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
                     controller.ipgoCancelBollList[event.rowIdx!] = true;
                     // controller.selectedCancelList.add(event.row!.cells.entries);
                     Get.log('이거 봐야함2 ${controller.ipgoCancelBollList.value}');
                   } else {
                     controller.ipgoCancelBollList[event.rowIdx!] = false;
                     //  controller.selectedCancelList.remove(event.rowIdx);
                     Get.log('이거 봐야함3 ${controller.ipgoCancelBollList.value}');
                   }
                 }
               }

             },
             configuration: PlutoGridConfiguration(
               style: PlutoGridStyleConfig(
                   columnHeight: 40,
                   rowHeight: 55,
                   //gridBorderColor: Colors.transparent,
                   //  activatedColor: Colors.transparent,
                   cellColorInReadOnlyState: Colors.white,
                   columnTextStyle: AppTheme.a14500.copyWith(color: AppTheme.black)
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
         width: 100,
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
         title: '입고번호',
         field: 'inbNo',
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
         title: '입고구분',
         field: 'inbTypeNm',
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
         textAlign: PlutoColumnTextAlign.center,
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
         title: '업체명',
         field: 'vendNm',
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
         title: '입고담당자',
         field: 'inbUserNm',
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
