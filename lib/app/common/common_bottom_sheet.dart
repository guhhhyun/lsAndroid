import 'package:lsandroid/app/common/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//import '../pages/main/main_controller.dart';

class CommonBottomWidget extends StatelessWidget {
 // MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => NavigationBar(
      backgroundColor: AppTheme.white,
        surfaceTintColor: AppTheme.white,
      onDestinationSelected: (selected) {
       /* controller.changeMenu(selected);

        controller.selected.value = selected;*/
      },
    //  selectedIndex: controller.selected.value,
      destinations: const [


      ],
    ));
  }
}
