import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_controller.dart';
import 'package:lsandroid/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDialogBoxWidget extends StatelessWidget {
  String? contentText;
  Widget? contentWidget;
  int pageFlag;
  SmallKitController controller = Get.find();
  Function()? onOk;


  CommonDialogBoxWidget(
      {super.key,
        this.contentText,
        this.contentWidget,
        this.onOk,
        required this.pageFlag
      });

  Widget _contentText(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '이미 스캔된 자재입니다.',
              style: AppTheme.a22400.copyWith(color: AppTheme.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
            SizedBox(width: 8,),
            Text(
              '스캔 취소하시겠습니까?',
              style: AppTheme.a22400.copyWith(color: AppTheme.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      scrollable: true,
      content: _contentText(context),
      buttonPadding: const EdgeInsets.all(0),
      insetPadding: const EdgeInsets.all(0),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.only(top: 16, bottom: 12),
      actions: [
        Row(
          children: [
            Expanded(
              child: Material(
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5)))),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                  // 성공
                  onPressed: () {
                    controller.isCancelIpgo.value = false;

                    Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    color: AppTheme.gray_c_gray_400,
                    child: Center(
                            child: Text(
                                '닫기',
                                style: AppTheme.a18700.copyWith(color: AppTheme.white)
                            )),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12,),
            Expanded(
              child: Material(
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(5)))),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(0))),
                  // 성공
                  onPressed: () {
                    controller.isCancelIpgo.value = true;
                    Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    color: Colors.black,
                    child: Center(
                            child: Text(
                                '확인',
                                style: AppTheme.a18700.copyWith(color: AppTheme.white)
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
}
