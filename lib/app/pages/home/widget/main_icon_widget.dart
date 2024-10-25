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

  Widget _buttonArea(
      {required String title,
        required String subTitle,
        required String imgUrl,
        required Function() onPressed,
        required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 30,
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
                     /* Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Ink.image(
                            image: AssetImage(imgUrl),
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),*/
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: AppTheme.newBody.copyWith(
                                  color: AppTheme.a787878,
                                ),
                              ),
                              Text(
                                subTitle,
                                style: AppTheme.newBody.copyWith(
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

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
          left: AppTheme.spacing_l_20,
          top: 12,
          right: AppTheme.spacing_l_20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('메뉴', style: AppTheme.newTitle.copyWith(color: AppTheme.black))
              ],
            ),

          /*  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('원하시는 작업을 선택해주세요', style: AppTheme.bodyBody2.copyWith(color: AppTheme.a969696))
              ],
            ),*/
            const SizedBox(height: 27,),
            /*Obx(()=> */Container(
              width: MediaQuery.of(context).size.width-30,
              child: Wrap(
                children: [
                //  gs.datasList.contains(200) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/checklist-1.png',
                      title: '입고등록',
                      subTitle: '',
                      onPressed: () {
                        Get.log('입고등록');
                        Get.toNamed(Routes.IPGO);
                      }, context: context),
                  _buttonArea(
                      imgUrl: 'assets/app/checklist-1.png',
                      title: '랙입고',
                      subTitle: '',
                      onPressed: () {
                        Get.log('랙입고');
                        Get.toNamed(Routes.RACK_IPGO);
                      }, context: context),
                  _buttonArea(
                      imgUrl: 'assets/app/checklist-1.png',
                      title: '소박스 KIT 작업',
                      subTitle: '',
                      onPressed: () {
                        Get.log('소박스 KIT 작업');
                        Get.toNamed(Routes.SMALL_KIT);
                      }, context: context),
                  _buttonArea(
                      imgUrl: 'assets/app/checklist-1.png',
                      title: '별도 박스 KIT 작업',
                      subTitle: '',
                      onPressed: () {
                        Get.log('별도박스 KIT 작업');
                        Get.toNamed(Routes.OTHER_KIT);
                      }, context: context),
                  _buttonArea(
                      imgUrl: 'assets/app/checklist-1.png',
                      title: '피킹 작업(랙출고)',
                      subTitle: '',
                      onPressed: () {
                        Get.log('피킹 작업(랙출고)');
                        Get.toNamed(Routes.PICKING);
                      }, context: context),
                //  gs.datasList.contains(300) == false ? SizedBox(width: 0, height: 0,) :
              /*    _buttonArea(
                      imgUrl: 'assets/app/online-test-1.png',
                      title: '설비/안전',
                      subTitle: '내역등록',
                      onPressed: () {
                        Get.log('설비/안전 내역 등록');
                    //    Get.toNamed(Routes.FACILITY);

                      }, context: context
                  ),

                //  gs.datasList.contains(400) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-1.png',
                      title: '제품',
                      subTitle: '위치이동',
                      onPressed: () {
                        Get.log('제품 위치이동');
                      //  Get.toNamed(Routes.PRODUCT_LOCATION);
                      }, context: context
                  ),
                //  gs.datasList.contains(500) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group.png',
                      title: '재고실사',
                      subTitle: '',
                      onPressed: () {
                        Get.log('재고실사');
                     //   Get.toNamed(Routes.INVENTORY_COUNTING);
                      }, context: context
                  ),
                 // gs.datasList.contains(600) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-3.png',
                      title: '공정이동',
                      subTitle: '',
                      onPressed: () {

                        Get.log('공정이동');
                     //   Get.toNamed(Routes.PROCESS_TRANSFER);
                      }, context: context
                  ),
                 // gs.datasList.contains(1600) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-2.png',
                      title: '작업조회',
                      subTitle: '',
                      onPressed: () {
                        Get.log('작업조회');
                     //   Get.toNamed(Routes.PROCESS_CHECK);
                      }, context: context
                  ),
                 // gs.datasList.contains(800) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-5.png',
                      title: '공정조회',
                      subTitle: '',
                      onPressed: () {
                        Get.log('공정조회');
                      //  Get.toNamed(Routes.GONGJUNG_CHHECK);
                      }, context: context
                  ),
                 // gs.datasList.contains(900) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-5.png',
                      title: '제품재고',
                      subTitle: '조회',
                      onPressed: () {
                        Get.log('제품재고 조회');
                      //  Get.toNamed(Routes.INVENTORY_CHECK);
                      }, context: context
                  ),
                 // gs.datasList.contains(1300) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-6.png',
                      title: '제품포장',
                      subTitle: '검수',
                      onPressed: () {
                        Get.log('제품포장 검수');
                      //  Get.toNamed(Routes.PACKAGING_INSPEC);
                      }, context: context
                  ),
                 // gs.datasList.contains(1200) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/product-development-2.png',
                      title: '스크랩',
                      subTitle: '라벨발행',
                      onPressed: () {
                        Get.log('스크랩 라벨발행');
                     //   Get.toNamed(Routes.SCRAP_LABEL);
                      }, context: context
                  ),
                 // gs.datasList.contains(1000) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-5.png',
                      title: '설비가동',
                      subTitle: '모니터링',
                      onPressed: () {
                        Get.log('설비가동 모니터링');
                      //  Get.toNamed(Routes.FACILITY_MONITORING);
                      }, context: context
                  ),
                 // gs.datasList.contains(1700) == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-5.png',
                      title: '가공설',
                      subTitle: '검수',
                      onPressed: () {
                        Get.log('가공설');
                      //  Get.toNamed(Routes.GAGONG_FACILITY);
                      }, context: context
                  ),*/
                  Utils.getStorage.hasData('userId') &&
                      Utils.getStorage.hasData('userPw') == false ? SizedBox(width: 0, height: 0,) :
                  _buttonArea(
                      imgUrl: 'assets/app/Group-5.png',
                      title: '로그아웃',
                      subTitle: '',
                      onPressed: () {
                        Get.log('로그아웃');
                        gs.logout();
                      }, context: context
                  ),
                ],
              ),
            ),

              ],
            )
      ),
    );
  }

}
