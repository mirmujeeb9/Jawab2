import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/upgrade_to_pro/upgrade_to_pro.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
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
          height: 70.h,
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                      Heading(
                        text: "Salam aleykoum\nJuju Mitcheli !",
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Container(
                    height: 180.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160.w,
                          height: 335.h,
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Pack Gold",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                              ),
                              TextWidget(
                                  text:
                                      'Unlock Alxza premium to\nunlock all features',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: whiteColor),
                              Button(
                                onTap: () {
                                  Get.to(
                                    () => const Upgrade_to_pro(),
                                    transition: Transition.rightToLeft,
                                  );
                                },
                                text: "Upgrade",
                                width: 90.w,
                                height: 30.h,
                                borderRadius: 8.r,
                                color: whiteColor,
                                textColor: primaryColor,
                                fontWeight: FontWeight.w500,
                                fontsize: 11.sp,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 118.h,
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
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: "What do you want to do today ?",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                GridView.builder(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 140.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 15.h,
                    ),
                    itemCount: HomeController.to.tabsList.length,
                    itemBuilder: (c, index) {
                      TabModel model = HomeController.to.tabsList[index];
                      return Obx(
                        () => Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          child: CustomContainer(
                            height: 140.h,
                            width: 130.w,
                            onTap: () {
                              HomeController.to.selectedIndex.value = index;
                            },
                            borderRadius: 20.r,
                            color:
                                HomeController.to.selectedIndex.value == index
                                    ? const Color(0xffDEDAE2)
                                    : Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Container(
                                    height: 69.h,
                                    width: 71.w,
                                    decoration: BoxDecoration(
                                      color: HomeController
                                                  .to.selectedIndex.value ==
                                              index
                                          ? primaryColor
                                          : const Color(0xffDEDAE2),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child: Image(
                                          height: 49.h,
                                          width: 49.w,
                                          image: AssetImage(model.image!)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: model.name!,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
