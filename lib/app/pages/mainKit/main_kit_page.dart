/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/app_theme.dart';
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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(

          backgroundColor: Colors.white,

          title: Text('메인 박스 KIT 작업'),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        _main(context),

                      ],
                    )
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.white,
                      height: height,
                      width: MediaQuery.of(context).size.width/2 - 20,
                      child: PlutoGrid(
                        columns: gridCols(context),
                        rows: controller.rows.value,
                        // columnGroups: columnGroups,
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          controller.stateManager = event.stateManager;
                          // stateManager.setShowColumnFilter(true);
                        },
                        onChanged: (PlutoGridOnChangedEvent event) {
                          print(event);
                        },
                        configuration: const PlutoGridConfiguration(
                          style: PlutoGridStyleConfig(
                            defaultCellPadding: EdgeInsets.all(0),
                            columnTextStyle: AppTheme.a18700,
                            columnHeight: 60,
                            rowHeight: 50,
                            cellTextStyle: AppTheme.a18400,
                            //  rowColor: AppTheme.red_red_300 //조회해서 같은 값이 들어가있으면 회색 아니면 빨강
                          ),
                        ),
                        */
/* rowColorCallback: (c) {
                        Get.log('aaasdsd : ${c.row.sortIdx}');
                        for(var i = 0; i < rows.length; i++) {
                          if (isRow[i] == false) {
                            return AppTheme.red_red_300;
                          } else {
                            return AppTheme.white;
                          }
                        }
                         return Colors.transparent;
                      },*//*

                        // configuration: const PlutoGridConfiguration(),
                      ),
                    ),
                    SizedBox(width: 24,),
                    Container(
                      color: Colors.white,
                      height: height,
                      width: MediaQuery.of(context).size.width/2 - 20,
                      child: PlutoGrid(
                        columns: gridCols2(context),
                        rows: controller.rows2,
                        // columnGroups: columnGroups,
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          controller.stateManager2 = event.stateManager;
                          // stateManager.setShowColumnFilter(true);
                        },
                        onChanged: (PlutoGridOnChangedEvent event) {
                          print(event);
                        },
                        */
/* createFooter: (stateManager) {
                        stateManager.footerHeight = 45;
                        return Container();
                      },*//*

                        configuration: const PlutoGridConfiguration(
                          style: PlutoGridStyleConfig(
                            columnTextStyle: AppTheme.a18700,
                            columnHeight: 60,
                            rowHeight: 50,
                            cellTextStyle: AppTheme.a14700,
                          ),
                        ),
                        // configuration: const PlutoGridConfiguration(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget _main(BuildContext context) {

    var orientation = MediaQuery.of(context).orientation;

    double containerWidth = orientation == Orientation.portrait ? 300.0 : 750.0;
    return Column(
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
                                  await _test();

                                  focusNode.requestFocus();
                                  Future.delayed(const Duration(), (){
                                    focusNode.requestFocus();

                                    //  FocusScope.of(context).requestFocus(focusNode);
                                    Future.delayed(const Duration(), () => SystemChannels.textInput.invokeMethod('TextInput.hide'));
                                  });
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(

                                      onTap: () async {
                                        FocusScope.of(context).autofocus(focusNode);
                                      },
                                      child: Image.asset('assets/app/search.png', color: AppTheme.a6c6c6c, width: 32, height: 32,)
                                  ),

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
                      _subData('상태')
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: MediaQuery.of(context).size.width - 10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _subData2('프로젝트명', controller.text2.value, true),
                      SizedBox(width: 32,),
                      _subData2('자재 코드', controller.text3.value, true),
                      SizedBox(width: 32,),
                      _subData2('수량', controller.text4.value, false),
                      SizedBox(width: 32,),
                      _subData2('박스번호', controller.text5.value, false)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12),
          child: */
/*SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child:*//*
 Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _subData('메모'),
              Container(
                alignment: Alignment.centerRight,
                width: containerWidth,
                //  width: MediaQuery.of(context).size.width/2 - 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _button('행추가'),
                      _button('저장'),
                      _button('동기화'),
                      _button('동기화 취소'),
                      _button('확정'),
                      _button('확정 취소'),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
        // ),

      ],
    );
  }

  Future _test() async{
    controller.textQrController.text == '' ? {controller.stateManager.removeAllRows(), controller.rows.clear()}
        :
    controller.textQrController.text.length == 1 ?
    controller.rows.value = [
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '1'),
          'name': PlutoCell(value: '6201436'),
          'age': PlutoCell(value: 'COT-EPOXY애관PIC(L) CV220-D218(20'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '2'),
          'name': PlutoCell(value: '6205327'),
          'age': PlutoCell(value: 'LEP-SRC(LSR)325L-D210-D100'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 3),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '3'),
          'name': PlutoCell(value: '7627103'),
          'age': PlutoCell(value: '케이블보호금구 230G D165-235L-PCD320(편9'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '4'),
          'name': PlutoCell(value: '7206751'),
          'age': PlutoCell(value: '명판 AGO STS304 70mmX40mm 영문'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '5'),
          'name': PlutoCell(value: '7632034'),
          'age': PlutoCell(value: '중간플랜지 CV220GO(AL) ID160-OD34)'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '6'),
          'name': PlutoCell(value: '7207650'),
          'age': PlutoCell(value: '지지플랜지 CV220GO D620-30T AL'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '7'),
          'name': PlutoCell(value: '7602628'),
          'age': PlutoCell(value: 'PS TAPE (50X0.025-100) 진공포장 0.5g'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '8'),
          'name': PlutoCell(value: '7270751'),
          'age': PlutoCell(value: '유리테이프 15X0.25-5M'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '9'),
          'name': PlutoCell(value: '7207344'),
          'age': PlutoCell(value: '오링 P-275 NBR'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '10'),
          'name': PlutoCell(value: '7244327'),
          'age': PlutoCell(value: '오링 G-115(NBR)'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '11'),
          'name': PlutoCell(value: '7207296'),
          'age': PlutoCell(value: '오링 G-280 NBR'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '12'),
          'name': PlutoCell(value: '7632037'),
          'age': PlutoCell(value: 'SHAFT(B) L120-M8(V+)'),
          'role': PlutoCell(value: 3),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 3),
          'salary': PlutoCell(value: 1),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '13'),
          'name': PlutoCell(value: '7207428'),
          'age': PlutoCell(value: '육각볼트 M10-30L STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '14'),
          'name': PlutoCell(value: '7212399'),
          'age': PlutoCell(value: '육각구멍붙이볼트 M10-25L STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '15'),
          'name': PlutoCell(value: '7208487'),
          'age': PlutoCell(value: '육각볼트 M12-50L STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '16'),
          'name': PlutoCell(value: '7207101'),
          'age': PlutoCell(value: '스프링와셔 M10 ID10.5-OD18-2.7T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '17'),
          'name': PlutoCell(value: '7207102'),
          'age': PlutoCell(value: '스프링와셔 M12 ID12.5-OD21-3.2T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '18'),
          'name': PlutoCell(value: '7207798'),
          'age': PlutoCell(value: '평와셔 M10 ID11-OD21-1.1T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '19'),
          'name': PlutoCell(value: '7207799'),
          'age': PlutoCell(value: '평와셔 M12 ID13-OD28-1.5T STS304'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
          'box': PlutoCell(value: ''),
          'reason': PlutoCell(value: ''),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '20'),
          'name': PlutoCell(value: '7207171'),
          'age': PlutoCell(value: '알미늄호일 0.015X250-20M'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
      PlutoRow(
        cells: {
          'id': PlutoCell(value: '21'),
          'name': PlutoCell(value: '7207375'),
          'age': PlutoCell(value: '위생장갑'),
          'role': PlutoCell(value: 0),
          'joined': PlutoCell(value: ''),
          'working_time': PlutoCell(value: 0),
          'salary': PlutoCell(value: 0),
        },
      ),
    ] : null;
    controller.rows.isNotEmpty ? controller.text.value = '완료' : controller.text.value = '';
    controller.textQrController.text == '' ? controller.stateManager2.removeAllRows() :
    controller.stateManager.rows.isNotEmpty && _duplicationRow('6201436') == false && controller.textQrController.text == '01' ?
    controller.rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: controller.rows2.length+1),
        'name': PlutoCell(value: '6201436'),
        'age': PlutoCell(value: 'COT-EPOXY애관PIC(L) CV220-D218(20'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '8555'),
        'reason': PlutoCell(value: ''),
      },
    ),) : controller.stateManager.rows.isNotEmpty && _duplicationRow('6205327') == false && controller.textQrController.text == '02' ?
    controller.rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: controller.rows2.length+1),
        'name': PlutoCell(value: '6205327'),
        'age': PlutoCell(value: 'LEP-SRC(LSR)325L-D210-D100'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 3),
        'box': PlutoCell(value: '1666'),
        'reason': PlutoCell(value: ''),
      },
    ),) : controller.stateManager.rows.isNotEmpty && _duplicationRow('7627103') == false && controller.textQrController.text == '03' ?
    controller.rows2.add(PlutoRow(
      cells: {
        'id': PlutoCell(value: controller.rows2.length+1),
        'name': PlutoCell(value: '7627103'),
        'age': PlutoCell(value: '케이블보호금구 230G D165-235L-PCD320(편9'),
        'role': PlutoCell(value: 3),
        'joined': PlutoCell(value: ''),
        'working_time': PlutoCell(value: 3),
        'salary': PlutoCell(value: 1),
        'box': PlutoCell(value: '2222'),
        'reason': PlutoCell(value: ''),
      },
    ),) : null;
    controller.isRow.clear();
    //마스터 리스트의 길이만큼 추가
    for(var i = 0; i < controller.rows.length; i++) {
      controller.isRow.add(false);
    }

    controller.stateManager.rows.isEmpty ?
    controller.textQrController.text == '' ? {controller.text.value = '', controller.text2.value = '', controller.text3.value = ''
      , controller.text4.value = '', controller.text5.value = ''}
        : {
      controller.stateManager.insertRows(0, controller.rows),
      controller.rows.isNotEmpty ? controller.text2.value = 'GREATER CHANGHUA OWF CHW2B+04' : '',
      controller.rows.isNotEmpty ? controller.text3.value = '2191465 IJ/PM2/CV345KV1000SQ28(소선SB' : '',
      controller.rows.isNotEmpty ? controller.text4.value = '3 set' : '',
      controller.rows.isNotEmpty ? controller.text5.value = '104978244' : ''
    } :  _containRow();
    controller.textQrController.text = '';
  }

  void _containRow() {
    for(var rowIndex = 0; rowIndex < controller.rows.length; rowIndex++) {
      for(var rowIndex2 = 0; rowIndex2 < controller.rows2.length; rowIndex2++) {
        // stateManager.rows[rowIndex].cells[stateManager.columns[1].field];
        controller.stateManager.rows[rowIndex].cells['name']!.value.toString().contains(controller.stateManager2.rows[rowIndex2].cells['name']!.value.toString()) ?
        controller.isRow[rowIndex] = true : null;

      }
    }
    Get.log('하아 ${controller.isRow}');
  }

  bool _duplicationRow(String matrCode) {
    for(var rowIndex2 = 0; rowIndex2 < controller.rows2.length; rowIndex2++) {
      if (controller.stateManager2.rows[rowIndex2].cells['name']!.value.toString().contains(matrCode)) {
        return true;
      }else {
        return false;
      }
    }
    return false;
  }


  Widget _subData(String title) {
    return Row(
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700,),
        ),
        SizedBox(width: 12,),
        Container(
            width: title == '메모' ? 400 : 200,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(title == '메모' ? '' : controller.text.value, style: AppTheme.a24400,)
        ),
      ],
    );
  }

  Widget _subData2(String title, String content, bool isLong) {
    return Row(
      children: [
        Container(
          child: Text(title, style: AppTheme.a24700,),
        ),
        SizedBox(width: 12,),
        Container(

          // width: isLong ? 200 : null,
            padding: const EdgeInsets.all(4),
            */
/* decoration: BoxDecoration(
                border: Border.all(color: AppTheme.ae2e2e2),
                borderRadius: BorderRadius.circular(10)
            ),*//*

            child: Text(content, style: AppTheme.a24400.copyWith(color: AppTheme.light_ui_08),)
        ),
      ],
    );
  }

  Widget _button(String text) {
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
          onPressed: () {
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
          enableSorting: false,
          enableEditingMode: false,
          enableContextMenu: false,
          enableRowDrag: false,
          enableDropToResize: false,
          enableColumnDrag: false,
          titleTextAlign: PlutoColumnTextAlign.center,
          textAlign: PlutoColumnTextAlign.center,
          width: 60,
          title: '순번',
          field: 'id',
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
          field: 'name',
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
          field: 'age',
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
          field: 'role',
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
          title: '포장구분',
          field: 'joined',
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
          field: 'working_time',
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
          width: 60,
          title: '수량',
          field: 'salary',
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
      ),
    ];
    return gridCols;
  }

  List<PlutoColumn> gridCols2(BuildContext context) {
    final List<PlutoColumn> gridCols2 = <PlutoColumn>[
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
          title: '순번',
          field: 'id',
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
          field: 'name',
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
          field: 'age',
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
          field: 'role',
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
          title: '포장구분',
          field: 'joined',
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
          field: 'working_time',
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
          width: 60,
          title: '수량',
          field: 'salary',
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
      ),
    ];
    return gridCols2;
  }
}


*/
