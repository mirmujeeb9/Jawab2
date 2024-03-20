import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatBot2Screen extends StatefulWidget {
  const ChatBot2Screen({super.key});

  @override
  State<ChatBot2Screen> createState() => _ChatBot2ScreenState();
}

class _ChatBot2ScreenState extends State<ChatBot2Screen>
// with WidgetsBindingObserver
{
  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.h,
                ),
                Container(
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
                        // JustTheTooltip(
                        //   borderRadius: BorderRadius.circular(7.r),
                        //   tailLength: 5,
                        //   margin: const EdgeInsets.all(0),
                        //   preferredDirection: AxisDirection.down,
                        //   tailBaseWidth: 15.w,
                        //   controller: tooltipController,
                        //   backgroundColor: Colors.white,
                        //   offset: 0,
                        //   content: Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 15.w, vertical: 3.h),
                        //     child: TextWidget(
                        //       text: "100 000 / 250 000",
                        //       fontSize: 12.sp,
                        //       color: primaryColor,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                        //   ),
                        //   child:

                        InkWell(
                          onTap: () {
                            // tooltipController.showTooltip();
                          },
                          child: Image.asset(
                            "images/token.png",
                            height: 35.h,
                            width: 35.w,
                          ),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(11),
                          topRight: const Radius.circular(11),
                          bottomRight: Radius.circular(11.r),
                        ),
                      ),
                      color: const Color(0xff241649),
                      child: Container(
                        height: 80.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(11),
                            topRight: const Radius.circular(11),
                            bottomRight: Radius.circular(11.r),
                          ),
                          color: const Color(0xff241649),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 55.h,
                              width: 185.w,
                              child: TextWidget(
                                text:
                                    "Write an art article\ndiscussing the benefits of\npracticing mindfulness in daily life",
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80.w,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "images/copy.svg",
                            height: 20.h,
                            width: 18.w,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            "images/share.svg",
                            height: 17.h,
                            width: 15.w,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(11),
                          topRight: const Radius.circular(11),
                          bottomLeft: Radius.circular(11.r),
                        ),
                      ),
                      child: Container(
                        height: 424.h,
                        width: 244.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(11),
                              topRight: const Radius.circular(11),
                              bottomLeft: Radius.circular(11.r),
                            ),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 410.81.h,
                              width: 199.w,
                              child: TextWidget(
                                text:
                                    "Write an art article\ndiscussing the benefits of\npracticing mindfulness in daily life\nWrite an art article\ndiscussing the benefits of\npracticing mindfulness in daily life\nWrite an art article\ndiscussing the benefits of\npracticing mindfulness in daily life\nWrite an art article\ndiscussing the benefits of\npracticing mindfulness in daily life\n ",
                                fontSize: 13.sp,
                                color: const Color(0xff7E7E7E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Container(
                        height: 50.h,
                        width: 270.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                            color: Colors.white),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.mic,
                              size: 40.h,
                              color: const Color(0xff241649),
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 10.h,
                              left: 20.w,
                            ),
                            border: InputBorder.none,
                            hintText: "Ask me anything",
                            hintStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 11.h,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: primaryColor,
                      shape:
                          const CircleBorder(), // Set background color to pink
                      child: SvgPicture.asset(
                        "images/Send.svg",
                        height: 17.h,
                        width: 17.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
