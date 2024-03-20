import 'dart:ui';

import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
                      Column(
                        children: [
                          Image.asset(
                            "images/aa.png",
                            height: 45.h,
                            width: 45.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextWidget(
                            text: "Token Left",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                            color: primaryColor,
                            textAlign: TextAlign.center,
                          ),
                          TextWidget(
                            text: "100 000 words",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "images/yy.png",
                            height: 45.h,
                            width: 45.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextWidget(
                            text: "Audio Left",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                            color: primaryColor,
                            textAlign: TextAlign.center,
                          ),
                          TextWidget(
                            text: "89 min",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "images/cc.png",
                            height: 45.h,
                            width: 45.w,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextWidget(
                            text: "Images Left",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                            color: primaryColor,
                            textAlign: TextAlign.center,
                          ),
                          TextWidget(
                            text: "78 images",
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
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
        child: Dialog(
          backgroundColor: whiteColor,
          insetPadding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            25.r,
          )),
          child: AspectRatio(
            aspectRatio: 0.75,
            child: Container(
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(
                  25.r,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 120.h,
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10.h,
                      ),
                      itemCount: HomeController.to.tabsList.length,
                      itemBuilder: (c, index) {
                        TabModel model = HomeController.to.tabsList[index];
                        return InkWell(
                          onTap: () {
                            HomeController.to.tabIndex.value = index;

                            Get.back();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 5,
                                shape: const CircleBorder(),
                                child: Container(
                                  height: 75.h,
                                  width: 75.w,
                                  decoration: BoxDecoration(
                                      color: HomeController.to.tabIndex.value ==
                                              index
                                          ? textgrey
                                          : primaryColor,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Image.asset(
                                      model.image!,
                                      height: 40.h,
                                      width: 40.w,
                                    ),
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
                          ),
                        );
                      }),
                ),
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
