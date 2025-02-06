

import 'package:lsandroid/app/common/app_const.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/net/home_api.dart';
import 'package:lsandroid/app/pages/home/widget/main_icon_widget.dart';
import 'package:lsandroid/app/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../common/app_theme.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.find();
  GlobalService gs = Get.find();

  // 퇴사자 여부 판단
  void userLeft() async {
    var params = {
      'loginId': gs.loginId,
      'password': gs.loginPassword,
    };
    var status = await HomeApi.to.reqLogin(params);
    Get.log('로그인~~~~~~~~~~~~~~~~~~~~ $status');
    status.resultCode == '0000' ? null : gs.logout();
  }

  @override
  Widget build(BuildContext context) {
  //  userLeft();
    return  Obx(() => Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 12, top: 12),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 12,),

                        child: APP_CONST.BASE_URL == 'https://10.152.1.136:443' ? Image.asset('assets/app/logo_real.png', width: 400, height: 100,): Image.asset('assets/app/logo_dev.png', width: 400, height: 100,))  ,
                    Row(
                      children: [
                        SvgPicture.asset('assets/app/user_icon.svg', width: 24, height: 24,),
                        SizedBox(width: 8,),
                        Text('${gs.loginNm.value}', style: AppTheme.a18700.copyWith(color: AppTheme.black),),
                        SizedBox(width: 12,)
                      ],
                    ),
                  ],
                )),
          ],
        ),
          backgroundColor: AppTheme.gray_gray_100,
          toolbarHeight: 60
      ),
      body: gs.loginId.value != '' ? Stack(
        children: [
          Container(
           // margin: EdgeInsets.only(top: 24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppTheme.gray_c_gray_300)
              )
            ),
            child: Image.asset(
              fit: BoxFit.fill,
              'assets/app/back.png',
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          MainIconWidget(),
         /* Container(
              child: gs.loginId.value != '' ? CustomScrollView(
                slivers: [
                  //MainHeader(),
                  // MainSlideWidget(),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  //  HomeNewsWidget(2),
                  MainIconWidget(),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 24),
                  ),
                  //   HomeNewsWidget(1),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: AppTheme.spacing_xxxl_40),
                  ),
                  //  MainReadMoreWidget()
                ],
              ) : Container(
                color: AppTheme.white,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('로그인이 필요한 서비스 입니다.', style: AppTheme.a18700.copyWith(color: AppTheme.black),),
                    const SizedBox(height: 12,),
                    Text('로그인 해주세요', style: AppTheme.a18700.copyWith(color: AppTheme.black),),
                    const SizedBox(height: 12,),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN_PAGE);
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: AppTheme.blue_blue_200,
                        child: Text('로그인', style: AppTheme.a16700.copyWith(color: AppTheme.black),),
                      ),
                    )
                  ],
                ),
              )
          )*/
        ],
      ) : Container(
          color: AppTheme.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('로그인이 필요한 서비스 입니다.', style: AppTheme.a18700.copyWith(color: AppTheme.black),),
              const SizedBox(height: 12,),
              Text('로그인 해주세요', style: AppTheme.a18700.copyWith(color: AppTheme.black),),
              const SizedBox(height: 12,),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.LOGIN_PAGE);
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  color: AppTheme.blue_blue_200,
                  child: Text('로그인', style: AppTheme.a16700.copyWith(color: AppTheme.black),),
                ),
              )
            ],
          ),
    )));
  }
}
