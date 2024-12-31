import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialogWidget extends StatelessWidget {
  String? contentText;
  Widget? contentWidget;
  int pageFlag;

  Function()? onOk;


  CommonDialogWidget(
      {super.key,
        this.contentText,
        this.contentWidget,
        this.onOk,
        required this.pageFlag
      });

  Widget _contentText(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
      child: Center(
        child: Text(
          contentText ?? '',
          style: AppTheme.bodyBody2.copyWith(color: AppTheme.black),
          overflow: TextOverflow.ellipsis,
          maxLines: 10,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      scrollable: true,
      content: contentWidget ?? _contentText(context),
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
              pageFlag == 10 ? Navigator.of(Get.overlayContext!, rootNavigator: true).pop() : null;
              // Get.back();
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
