import 'package:alxza/view/welcome/welcome.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoarding10 extends StatefulWidget {
  const OnBoarding10({super.key});

  @override
  State<OnBoarding10> createState() => _OnBoarding10State();
}

class _OnBoarding10State extends State<OnBoarding10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Column(
          children: [
            Container(
              height: ScreenUtil().screenHeight * 0.8,
              width: ScreenUtil().screenWidth,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          height: 329.h,
                          width: 329.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'images/lauch_bg.png',
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Image.asset(
                              'images/robot_finger.png',
                            ),
                          ),
                        ),
                        TextWidget(
                          text: 'And many more\namazing features ...',
                          textAlign: TextAlign.center,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21.r),
                        ),
                        child: InkWell(
                          onTap: () {
                            Get.offAll(
                              () => const WelcomeScreen(),
                              transition: Transition.leftToRight,
                            );
                          },
                          child: Container(
                            width: 50.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: primaryColor,
                            ),
                            child: Center(
                              child: TextWidget(
                                text: "Skip",
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Button(
              onTap: () {
                Get.offAll(
                  () => const WelcomeScreen(),
                  transition: Transition.rightToLeft,
                );
              },
              width: 335.w,
              text: "Next",
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }
}

class LaunchingWidget extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  int index;

  LaunchingWidget({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: 329.h,
            width: 329.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  'images/lauch_bg.png',
                ),
              ),
            ),
            child: Center(
              child: Image.asset(
                image,
                height: 180.h,
                width: 203.w,
              ),
            ),
          ),
          Heading(
            textAlign: TextAlign.center,
            text: title,
          ),
          Subheading(
            textAlign: TextAlign.center,
            text: subtitle,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
