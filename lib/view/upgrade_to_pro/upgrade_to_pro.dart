import 'package:alxza/view/payment_method/payment_method.dart';
import 'package:alxza/view/upgrade_to_pro/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Upgrade_to_pro extends StatefulWidget {
  const Upgrade_to_pro({super.key});

  @override
  State<Upgrade_to_pro> createState() => _Upgrade_to_proState();
}

class _Upgrade_to_proState extends State<Upgrade_to_pro> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const Payment_method())));
        },
        child: GetBuilder<Upgrade_to_pro_Controller>(builder: (obj) {
          return SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: const CustomAppBar(
                      text: "Upgrade to Pro",
                      leading: true,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CarouselSlider(
                    items: List.generate(
                      obj.subscriptionList.length,
                      (index) {
                        SubscriptionModel model = obj.subscriptionList[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Card(
                            elevation: 9,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r))),
                            child: Container(
                              height: 390.h,
                              width: 258.w,
                              decoration: BoxDecoration(
                                  color: index % 2 != 0
                                      ? Colors.white
                                      : primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.r))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 25.h,
                                      ),
                                      TextWidget(
                                        text: model.title!,
                                        color: index % 2 != 0
                                            ? null
                                            : Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Container(
                                        height: 5.h,
                                      ),
                                      TextWidget(
                                        text: model.subtitle!,
                                        color: index % 2 != 0
                                            ? null
                                            : Colors.white,
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextWidget(
                                            text: "\$${model.price!}",
                                            color: index % 2 != 0
                                                ? null
                                                : Colors.white,
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          TextWidget(
                                            text: "/mo",
                                            color: index % 2 != 0
                                                ? null
                                                : Colors.white,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 10.h,
                                      ),
                                      TextWidget(
                                        text: model.afterprice!,
                                        color: index % 2 != 0
                                            ? null
                                            : Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      Container(
                                        height: 10.h,
                                      ),
                                      Divider(
                                        color: index % 2 != 0
                                            ? null
                                            : const Color.fromARGB(
                                                255, 151, 151, 143),
                                        thickness: 1.sp,
                                      ),
                                      Container(
                                        height: 10.h,
                                      ),
                                      Column(
                                        children: List.generate(
                                          model.rules!.length,
                                          (i) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 7.h),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color: index % 2 != 0
                                                      ? primaryColor
                                                      : Colors.white,
                                                  size: 13.sp,
                                                ),
                                                Container(
                                                  width: 10.w,
                                                ),
                                                TextWidget(
                                                  text: model.rules![i],
                                                  color: index % 2 != 0
                                                      ? null
                                                      : Colors.white,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    options: CarouselOptions(
                      onPageChanged: (i, reason) {
                        obj.index.value = i;
                      },
                      height: 440.h,
                      enlargeCenterPage: true,
                      // autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2,
                        (index) => AnimatedContainer(
                          height: index == obj.index.value ? 5.w : 7.w,
                          width: index == obj.index.value ? 12.w : 7.w,
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                index == obj.index.value ? 10.r : 100.r),
                            color: index == obj.index.value ? null : whiteColor,
                            border: Border.all(
                                color: index == obj.index.value
                                    ? primaryColor
                                    : const Color(0xffC8C8C8),
                                width: 2.w),
                          ),
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
