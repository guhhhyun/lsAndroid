/*

import 'package:lsandroid/app/common/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


import 'package:lsandroid/app/routes/app_route.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';


class MainSlideWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainSlideWidgetSate();
}

class _MainSlideWidgetSate extends State<MainSlideWidget> {

  int mainSlideIndex = 0;

  Widget _sliderContainer(String imgUrl) {
    return Container(
      child: Image.asset(imgUrl,
          width: double.infinity, height: 294, fit: BoxFit.cover),
    );
  }

  Widget _btnSliderContainer(
      {required String imgUrl, required Function() onpress}) {
    return Material(
      child: InkWell(
        onTap: onpress,
        child: Ink.image(
          image: AssetImage(
            imgUrl,
          ),
          height: 294,
          fit: BoxFit.cover,
        ),

        // child: Container(
        //   child: Image.asset(imgUrl,
        //       width: double.infinity, height: 294, fit: BoxFit.cover),
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent)
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,

          children: [

            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 35,),
                        */
/*Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {
                                  print('클릭');
                                  Get.to(BlePrinter());
                                },
                                child: Image.asset('assets/app/Vector.png', color: AppTheme.white, width: 30, height: 30,)
                            ),
                            SizedBox(width: 14,),
                            InkWell(
                              onTap: () async{
                                print('클릭');
                                Get.to(BluetoothPrinter());

                              },
                                child: Image.asset('assets/app/printer.png', color: AppTheme.white, width: 30, height: 30,)
                            ),
                          ],
                        ),*//*

                      ],
                    ),
                  ),


                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            // height: 20,
                              padding: const EdgeInsets.only(
                                  left: AppTheme.spacing_m_16,
                                  right: AppTheme.spacing_m_16,
                                  bottom: AppTheme.spacing_m_16),
                              child: Container(
                                width: 50,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black45
                                ),
                                child: Center(child: Text('${mainSlideIndex + 1} / 5', style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),)),
                              )
                          )*/
/*StepProgressIndicator(
                            totalSteps: 5,
                            padding: 0,
                            size: 2,
                            currentStep: mainSlideIndex + 1,
                            selectedColor: AppTheme.light_ui_01,
                            unselectedColor: AppTheme.light_ui_07,
                          )
                      ),*//*

                        ],
                      ),
                      Container(
                        alignment: AlignmentDirectional.bottomCenter,
                        height: 36,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
*/
