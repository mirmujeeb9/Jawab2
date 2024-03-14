import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tooltipController = JustTheController();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      tooltipController.showTooltip();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: Obx(
        () => SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.circle,
          height: 75.h,
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          padding: const EdgeInsets.all(0),
          snakeViewColor: primaryColor,
          selectedItemColor:
              SnakeShape.circle == SnakeShape.indicator ? primaryColor : null,
          unselectedItemColor: Colors.blueGrey,
          currentIndex: HomeController.to.selectedItemPosition.value,
          onTap: (index) =>
              HomeController.to.selectedItemPosition.value = index,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "images/menue.svg",
                  color: HomeController.to.selectedItemPosition.value == 0
                      ? whiteColor
                      : textgrey,
                ),
                label: 'menue'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "images/chat.svg",
                  color: HomeController.to.selectedItemPosition.value == 1
                      ? whiteColor
                      : textgrey,
                ),
                label: 'chat'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "images/history.svg",
                  color: HomeController.to.selectedItemPosition.value == 2
                      ? whiteColor
                      : textgrey,
                ),
                label: 'history'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "images/person.svg",
                  color: HomeController.to.selectedItemPosition.value == 3
                      ? whiteColor
                      : textgrey,
                ),
                label: 'person')
          ],
        ),
      ),
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "images/male.svg",
                    ),
                    JustTheTooltip(
                      borderRadius: BorderRadius.circular(7.r),
                      tailLength: 5,
                      margin: const EdgeInsets.all(0),
                      preferredDirection: AxisDirection.down,
                      tailBaseWidth: 15.w,
                      controller: tooltipController,
                      backgroundColor: Colors.white,
                      offset: 0,
                      content: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 3.h),
                        child: TextWidget(
                          text: "your Tokens",
                          fontSize: 12.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          tooltipController.showTooltip();
                        },
                        child: SvgPicture.asset(
                          "images/token.svg",
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      TextWidget(
                        text: "Salam aleykoum\nJuju Mitcheli !",
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Container(
                    height: 200.h,
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200.w,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Pack Gold",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                              ),
                              TextWidget(
                                  text:
                                      'Unlock Alxza premium to\nunlock all features',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor),
                              Button(
                                onTap: () {},
                                text: "Upgrade",
                                width: 130.w,
                                height: 40.h,
                                borderRadius: 10.r,
                                color: whiteColor,
                                textColor: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 130.h,
                              width: 118.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'images/gold-medal.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              height: 10.h,
                              width: 118.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    'images/elipse.png',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
