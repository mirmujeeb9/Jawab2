import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
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
      body: GetBuilder<TranslatorController>(builder: (obj) {
        return SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 50.h,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        CustomContainer(
                          onTap: () {},
                          width: 35.w,
                          height: 35.w,
                          margin: EdgeInsets.only(bottom: 5.h),
                          borderRadius: 8.r,
                          borderColor: Colors.grey,
                          borderWidth: 1.w,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.grey,
                              size: 15.h,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: TextWidget(
                            text: "AI Translator",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
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
                              text: "100 000 / 250 000",
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
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 5.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 0, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0,
                              2), // Offset from top to create a shadow from the bottom
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(13.r),
                          bottomRight: Radius.circular(13.r))),
                  height: 410.h,
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 335.w,
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: obj.textEditingController,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter text",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 28.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomContainer(
                      borderRadius: 15.r,
                      height: 50.h,
                      width: 134.w,
                      color: primaryColor.withOpacity(0.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Center(
                          child: TextWidget(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                            text: "Automatic detect",
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Image.asset(
                        "images/arrows.png",
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    CustomContainer(
                      borderRadius: 15.r,
                      height: 50.h,
                      width: 134.w,
                      color: primaryColor.withOpacity(0.2),
                      child: Center(
                        child: TextWidget(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          text: "Arabic",
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                FloatingActionButton.large(
                  onPressed: () {},
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: primaryColor,
                  shape: const CircleBorder(), // Set background color to pink
                  child: SvgPicture.asset(
                    "images/mic.svg",
                    height: 40.h,
                    width: 30.w,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
