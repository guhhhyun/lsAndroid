
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/pages/test/yellow_sound_icon_widget.dart';

import '../../common/app_theme.dart';

class YellowSoundPage extends StatelessWidget {
  YellowSoundPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity, // 가로 전체 확장
              height: double.infinity, // AppBar 기본 높이 사용
              alignment: Alignment.center, // 중앙 정렬
              child: Image.asset(
                'assets/app/YellowSound_logo_appbar.png',
              /*  width: double.infinity, // 가로로 꽉 차게
                height: double.infinity, // 높이도 AppBar 크기에 맞춤*/
                fit: BoxFit.fitHeight, // 비율 유지하면서 가로를 꽉 채움
              ),
            ),
            YellowSoundIconWidget()
          ],
        )
      ),
    );
  }
}
