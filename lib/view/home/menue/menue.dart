import 'package:alxza/view/home/edit_profile/edit_profile.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/upgrade_to_pro/upgrade_to_pro.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MenueScreen extends StatefulWidget {
  const MenueScreen({super.key});

  @override
  State<MenueScreen> createState() => _MenueScreenState();
}

class _MenueScreenState extends State<MenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const Edit_profile(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: Image.asset(
                        "images/male.png",
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      Heading(
                        fontSize: 28.sp,
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
                      height: 212.h,
                      width: 335.w,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 30.w,
                              ),
                              TextWidget(
                                text: "Your Plan : ",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor,
                              ),
                              TextWidget(
                                text: "Pack Starter",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: whiteColor,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "images/aa.png",
                                    height: 35.h,
                                    width: 35.w,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextWidget(
                                    text: "Token Left",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w300,
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  TextWidget(
                                    text: "100 000 words",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "images/yy.png",
                                    height: 35.h,
                                    width: 35.w,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextWidget(
                                    text: "Audio Left",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w300,
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  TextWidget(
                                    text: "89 min",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "images/cc.png",
                                    height: 35.h,
                                    width: 35.w,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextWidget(
                                    text: "Images Left",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w300,
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  ),
                                  TextWidget(
                                    text: "78 images",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Button(
                            onTap: () {
                              Get.to(
                                () => const Upgrade_to_pro(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            text: "Upgrade",
                            width: 152.w,
                            height: 35.h,
                            borderRadius: 8.r,
                            color: whiteColor,
                            textColor: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontsize: 11.sp,
                          ),
                        ],
                      )),
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
                      mainAxisExtent: 135.h,
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
                            height: 135.h,
                            width: 130.w,
                            onTap: () {
                              HomeController.to.tabIndex.value = index;
                              HomeController.to.selectedItemPosition.value = 3;

                              // HomeController.to.bottomsheetIndex.value = 3;
                            },
                            borderRadius: 20.r,
                            color: HomeController.to.tabIndex.value == index
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
                                      color: HomeController.to.tabIndex.value ==
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
