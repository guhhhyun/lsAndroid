import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/pages/inventoryCnt/inventory_cnt_controller.dart';


class BottomSheetModal extends StatelessWidget {
  BottomSheetModal({Key? key}) : super(key: key);
  InventoryCntController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0))
      ),
     // padding: EdgeInsets.only(top: 40, bottom: 24, left: 16, right: 16),
      height: 240,
      width: 150,
      child: CustomScrollView(
        slivers: [
        //  _title(),
          Obx(() =>   controller.popUpDataList.isNotEmpty ?
          _listArea() : SliverToBoxAdapter(child: Container()))
          // _bottom(context)
        ],
      ),
    );
  }



  Widget _title() {
    return SliverToBoxAdapter(
      child: Container(
          padding: EdgeInsets.only(left: 12, bottom: 20),
          child: Text('자재 선택', style: AppTheme.titleHeadline.copyWith(color: AppTheme.black),
          )),
    );
  }



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
          controller.selectedContainer.clear();
        }else {
          for(var i = 0; i < controller.selectedPopList.length; i++) {
            controller.selectedPopList[i] = false;
          }
          controller.selectedContainer.clear();
          controller.selectedPopList[index] = true;
          if(controller.selectedPopList[index] == true) {
        //    controller.isChoiceSheet.value = true;

            controller.selectedItemPopContainer.add(controller.popUpDataList[index]);
            /*  controller.measList[0]['CAR_NO'] = controller.selectedContainer[0]['CAR_NO'];
              controller.measList[0]['CUST_NM'] = controller.selectedContainer[0]['NAME'];
              controller.weighingInfoTextController.text = controller.selectedContainer[0]['CODE'];*/
            controller.itemCdController.text = controller.selectedItemPopContainer[0]['itemCd'];
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
                        Text('자재코드', style: AppTheme.a14700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['itemCd']}', style: AppTheme.a14700.copyWith(color: AppTheme.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('자재명:', style: AppTheme.a14700.copyWith(color: AppTheme.black)),
                        Text('${controller.popUpDataList[index]['itemNm']}', style: AppTheme.a14700.copyWith(color: AppTheme.black)),
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
