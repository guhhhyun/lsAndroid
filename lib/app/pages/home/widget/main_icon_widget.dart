import 'package:flutter_svg/flutter_svg.dart';
import 'package:lsandroid/app/common/global_service.dart';
import 'package:lsandroid/app/common/utils.dart';
import 'package:lsandroid/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lsandroid/app/common/app_theme.dart';
import 'package:lsandroid/app/routes/app_route.dart';

class MainIconWidget extends StatelessWidget {
  MainIconWidget({Key? key}) : super(key: key);

  GlobalService gs = Get.find();

  Widget _buttonArea2(
      {required String title,
        required String subTitle,
        required String imgUrl,
        required Function() onPressed,
        required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppTheme.gray_c_gray_200)
      ),
      height: 100,
      width: MediaQuery.of(context).size.width / 2 - 150,
      // width: MediaQuery.of(context).size.width / 3 - 30,
      margin: EdgeInsets.only(right: 12, bottom: 12),
      child: InkWell(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 14),
              child: Row(
                children: [
                  Container(
                   /* decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppTheme.gray_gray_100
                    ),*/

                    child: SvgPicture.asset(imgUrl,
                      width: 55,
                      height: 55,
                    ),
                  ),
                  SizedBox(width: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                            title,
                            style: AppTheme.a24700.copyWith(
                              color: AppTheme.a454545,
                            ),
                          ),
                    ],
                  ),

                ],
              ),
            ),
          ),

    );
  }

  Widget _buttonArea(
      {required String title,
        required String subTitle,
        required String imgUrl,
        required Function() onPressed,
        required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 100,
     // width: MediaQuery.of(context).size.width / 3 - 30,
      margin: EdgeInsets.only(right: 12, bottom: 12),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: AppTheme.gray_c_gray_200)
                  ),
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 14, right: 14),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Ink.image(
                            image: AssetImage(imgUrl),
                            width: 45,
                            height: 45,
                          ),
                        ],
                      ),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppTheme.a24700.copyWith(
                                  color: AppTheme.a787878,
                                ),
                              ),
                              Text(
                                subTitle,
                                style: AppTheme.a24700.copyWith(
                                  color: AppTheme.a787878,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 27,),
           Container(
                width: MediaQuery.of(context).size.width-30,
                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014.svg',
                            title: '입고등록',
                            subTitle: '',
                            onPressed: () {
                              Get.log('입고등록');
                              Get.toNamed(Routes.IPGO);
                            }, context: context),
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-3.svg',
                            title: '출고등록',
                            subTitle: '',
                            onPressed: () {
                              Get.log('출고등록');
                              Get.toNamed(Routes.CHULGO);
                            }, context: context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-6.svg',
                            title: '랙입고',
                            subTitle: '',
                            onPressed: () {
                              Get.log('랙입고');
                              Get.toNamed(Routes.RACK_IPGO);
                            }, context: context),
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-6.svg',
                            title: '랙입고 일괄처리',
                            subTitle: '',
                            onPressed: () {
                              Get.log('랙입고 일괄처리');
                              Get.toNamed(Routes.RACK_IPGO_MULTI);
                            }, context: context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-1.svg',
                            title: '소박스 KIT 작업',
                            subTitle: '',
                            onPressed: () {
                              Get.log('소박스 KIT 작업');
                              Get.toNamed(Routes.SMALL_KIT);
                            }, context: context),
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-5.svg',
                            title: '별도 박스 KIT 작업',
                            subTitle: '',
                            onPressed: () {
                              Get.log('별도박스 KIT 작업');
                              Get.toNamed(Routes.OTHER_KIT);
                            }, context: context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-2.svg',
                            title: '메인 박스 KIT 작업',
                            subTitle: '',
                            onPressed: () {
                              Get.log('메인 KIT 작업');
                              Get.toNamed(Routes.MAIN_KIT);
                            }, context: context),
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-6.svg',
                            title: '피킹 작업(랙출고)',
                            subTitle: '',
                            onPressed: () {
                              Get.log('피킹 작업(랙출고)');
                              Get.toNamed(Routes.PICKING);
                            }, context: context),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014.svg',
                            title: '기타입고',
                            subTitle: '',
                            onPressed: () {
                              Get.log('기타입고');
                              Get.toNamed(Routes.ETC_IPGO);
                            }, context: context),
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-3.svg',
                            title: '기타출고',
                            subTitle: '',
                            onPressed: () {
                              Get.log('기타출고');
                              Get.toNamed(Routes.ETC_CHULGO);
                            }, context: context),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buttonArea2(
                            imgUrl: 'assets/app/Group 1014-3.svg',
                            title: '재고실사등록',
                            subTitle: '',
                            onPressed: () {
                              Get.log('재고실사등록');
                              Get.toNamed(Routes.INVENTORY_CNT);
                            }, context: context),
                        Utils.getStorage.hasData('userId') &&
                            Utils.getStorage.hasData('userPw') == false ? SizedBox(width: 0, height: 0,) :
                        _buttonArea2(
                            imgUrl: 'assets/app/logout_icon.svg',
                            title: '로그아웃',
                            subTitle: '',
                            onPressed: () {
                              Get.log('로그아웃');
                              gs.logout();
                            }, context: context),
                      ],
                    ),
                  ],
                )
              ),

                ],
              )
        ),

        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 125,),
                Container(
                    width: MediaQuery.of(context).size.width-30,
                    child: Column(
                      children: [

                      ],
                    )
                ),

              ],
            )
        ),
      ],
    );
  }

}
