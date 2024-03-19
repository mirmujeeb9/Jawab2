import 'dart:ui';

import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class EnoughDialogue extends StatefulWidget {
  final VoidCallback onYesBtnClick;

  const EnoughDialogue({
    Key? key,
    required this.onYesBtnClick,
  }) : super(key: key);

  @override
  State<EnoughDialogue> createState() => _EnoughDialogueState();
}

class _EnoughDialogueState extends State<EnoughDialogue>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
      child: ScaleTransition(
        scale: scaleAnimation,
        alignment: Alignment.bottomCenter,
        child: Dialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: whiteColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(26.r))),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              height: 256.h,
              width: 335.w,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(26.r))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                    text:
                        "You don’t have enough\ncredit to use Jawab,\nplease reload  to add\nmore credit on your\naccount",
                    textAlign: TextAlign.center,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Button(
                    onTap: widget.onYesBtnClick,
                    width: 218.w,
                    height: 36.h,
                    text: "Reload",
                    fontsize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

/// credit dialogue
class CreditDialogue extends StatefulWidget {
  final VoidCallback onYesBtnClick;

  const CreditDialogue({
    Key? key,
    required this.onYesBtnClick,
  }) : super(key: key);

  @override
  State<CreditDialogue> createState() => _CreditDialogueState();
}

class _CreditDialogueState extends State<CreditDialogue>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
      child: ScaleTransition(
        alignment: Alignment.bottomCenter,
        scale: scaleAnimation,
        child: Dialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: whiteColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(26.r))),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              height: 256.h,
              width: 335.w,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(26.r))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                    text: "Credit",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                "images/token.svg",
                                height: 56.h,
                                width: 57.w,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextWidget(
                                text: "106 350 / 250 000\ntokens",
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, left: 32.w),
                            child: Container(
                              height: 33.h,
                              width: 33.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2.5),
                                  color: primaryColor,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "images/text_T.svg",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                "images/token.svg",
                                height: 56.h,
                                width: 57.w,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextWidget(
                                text: "46 minutes\nleft",
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.h, left: 22.w),
                            child: Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  color: primaryColor, shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "images/time.svg",
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Stack(
                      //   children: [
                      //     Column(
                      //       children: [
                      //         SvgPicture.asset(
                      //           "images/token.svg",
                      //           height: 56.h,
                      //           width: 57.w,
                      //         ),
                      //         SizedBox(
                      //           height: 20.h,
                      //         ),
                      //         TextWidget(
                      //           text: "46 minutes\nleft",
                      //           fontSize: 9,
                      //           fontWeight: FontWeight.w600,
                      //           color: primaryColor,
                      //           textAlign: TextAlign.center,
                      //         )
                      //       ],
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(top: 30.h, left: 25.w),
                      //       child: Container(
                      //         height: 33.h,
                      //         width: 33.w,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: Colors.white),
                      //             color: primaryColor,
                      //             shape: BoxShape.circle),
                      //         child: SvgPicture.asset(
                      //           "images/time.svg",
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Button(
                    onTap: widget.onYesBtnClick,
                    width: 218.w,
                    height: 36.h,
                    text: "Reload",
                    fontsize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MenueDialogue extends StatefulWidget {
  final VoidCallback onYesBtnClick;

  const MenueDialogue({
    Key? key,
    required this.onYesBtnClick,
  }) : super(key: key);

  @override
  State<MenueDialogue> createState() => _MenueDialogueState();
}

class _MenueDialogueState extends State<MenueDialogue>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
      child: ScaleTransition(
        scale: scaleAnimation,
        alignment: Alignment.bottomCenter,
        child: Dialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: whiteColor,
          insetPadding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          )),
          child: AspectRatio(
            aspectRatio: 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GridView.builder(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
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
                      return Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            shape: const CircleBorder(),
                            child: Container(
                              height: 85.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  color: primaryColor, shape: BoxShape.circle),
                              child: Center(
                                child: Image(
                                    height: 49.h,
                                    width: 49.w,
                                    image: AssetImage(model.image!)),
                              ),
                            ),
                          ),
                          TextWidget(
                            textAlign: TextAlign.center,
                            text: model.name!,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
