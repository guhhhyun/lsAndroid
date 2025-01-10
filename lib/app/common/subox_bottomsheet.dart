import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/pages/inventoryCnt/inventory_cnt_controller.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_controller.dart';


class SuboxBottomSheet extends StatelessWidget {
  SuboxBottomSheet({Key? key}) : super(key: key);
  SmallKitController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
          _listArea() : SliverToBoxAdapter(child: Container())),
          SliverToBoxAdapter(child: SizedBox(height: 12,))
          // _bottom(context)
        ],
      ),
    );
  }



 /* Widget _title() {
    return SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 12, top: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // _itemQr(),
                  _itemItemCd(),
                ],
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
                    Get.log('조회 클릭!');
                    await controller.reqCommon3();
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
            ],
          ),
        )
    );
  }
*/




  Widget _listArea() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          controller.selectedPopList.add(false);
          return _listItem(index: index, context: context);
        }, childCount: controller.popUpDataList.length));
  }

  Widget _listItem({required BuildContext context, required int index}) {


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
        if(controller.selectedPopList[index] == true) {
          controller.selectedPopList[index] = false;
          //  controller.isChoiceSheet.value = false;

        }else {
          for(var i = 0; i < controller.selectedPopList.length; i++) {
            controller.selectedPopList[i] = false;
          }

          controller.selectedPopList[index] = true;
          if(controller.selectedPopList[index] == true) {
            //    controller.isChoiceSheet.value = true;

            controller.selectedItemPopContainer.add(controller.popUpDataList[index]);
            /*  controller.measList[0]['CAR_NO'] = controller.selectedContainer[0]['CAR_NO'];
              controller.measList[0]['CUST_NM'] = controller.selectedContainer[0]['NAME'];
              controller.weighingInfoTextController.text = controller.selectedContainer[0]['CODE'];*/
          //  controller.itemCdController.text = controller.selectedItemPopContainer[0]['itemCd'];
            controller.selectedQrNo.value = controller.selectedItemPopContainer[0]['tagNo'];
          }
        }
        Get.back();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 12),
                padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                decoration: BoxDecoration(
                  border: controller.selectedPopList[index] == true ? Border.all(color: AppTheme.black, width: 2) : Border.all(color: AppTheme.gray_c_gray_200),
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
                        Text('${controller.popUpDataList[index]['itemNm']}', style: AppTheme.a20700.copyWith(color: AppTheme.black)),
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
}