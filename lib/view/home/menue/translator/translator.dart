import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/confirmation_dialogue.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen>
// with WidgetsBindingObserver
{
  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);
    TranslatorController.to.textEditingController = TextEditingController();
    TranslatorController.to.ismicOpen.value = false;
    TranslatorController.to.isEmpty.value = true;
    // TranslatorController.to.initspeech();
    TranslatorController.to.generateApi(text: "hello");
    super.initState();
  }

  @override
  void dispose() {
    TranslatorController.to.textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return GetBuilder<TranslatorController>(builder: (obj) {
          return Obx(() {
            // log("hii $isKeyboardVisible");

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
                              onTap: () {
                                HomeController.to.selectedItemPosition.value =
                                    0;
                              },
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
                                Get.dialog(CreditDialogue(
                                  onYesBtnClick: () {
                                    Get.back();
                                    HomeController
                                        .to.selectedItemPosition.value = 11;
                                    // Get.to(() => Upgrade_to_pro(),
                                    //     transition: Transition.leftToRight);
                                  },
                                ));
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
                    Container(
                      color: Colors.white,
                      height: 5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Shadow color
                              spreadRadius: 0, // Spread radius
                              blurRadius: 2, // Blur radius
                              offset: const Offset(0,
                                  2), // Offset from top to create a shadow from the bottom
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(13.r),
                              bottomRight: Radius.circular(13.r))),
                      height: isKeyboardVisible ? 310.h : 410.h,
                      width: ScreenUtil().screenWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Scrollbar(
                              child: new SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                reverse: true,
                                child: SizedBox(
                                  height: obj.isEmpty.value
                                      ? null
                                      : isKeyboardVisible
                                          ? 260.h
                                          : 360.h,
                                  child: TextFormField(
                                    onTap: () {
                                      // textEditingController.selection =
                                      //     textEditingController.selection =
                                      //         TextSelection(
                                      //             baseOffset: 0,
                                      //             extentOffset: obj
                                      //                 .textEditingController
                                      //                 .text
                                      //                 .length);
                                    },
                                    onChanged: (v) {
                                      if (v.isNotEmpty) {
                                        if (obj.isEmpty.value) {
                                          obj.updatetext(false);
                                        }
                                      } else {
                                        obj.updatetext(true);
                                      }
                                    },
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.sp,
                                    ),
                                    maxLines: obj.isEmpty.value
                                        ? null
                                        : isKeyboardVisible
                                            ? 11
                                            : 17,
                                    keyboardType: TextInputType.multiline,
                                    controller: obj.textEditingController,
                                    textAlign: TextAlign.justify,
                                    decoration: InputDecoration(
                                      // filled: true,
                                      // fillColor: Colors.black,
                                      border: InputBorder.none,
                                      hintText: obj.ismicOpen.value
                                          ? "Speak now ..."
                                          : obj.speechToText.isListening
                                              ? "Listening..."
                                              : "Enter text ...",
                                      hintStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        color: textgrey,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            !obj.isEmpty.value || obj.ismicOpen.value
                                ? const SizedBox()
                                : CustomContainer(
                                    onTap: () async {
                                      final clipboardData =
                                          await Clipboard.getData(
                                              Clipboard.kTextPlain);

                                      obj.textEditingController.text =
                                          clipboardData!.text!;
                                      if (obj.textEditingController.text
                                          .isNotEmpty) {
                                        obj.updatetext(false);
                                      }
                                    },
                                    borderRadius: 50.r,
                                    height: 28.h,
                                    width: 91.w,
                                    color: primaryColor,
                                    child: Center(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "images/clipboard.png",
                                            height: 15.h,
                                            width: 13.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          TextWidget(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            text: "Paste",
                                            color: whiteColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            const Spacer(),
                            obj.isEmpty.value
                                ? const SizedBox()
                                : SizedBox(
                                    height: 40.h,
                                    // color: Colors.amber,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text: obj.textEditingController
                                                    .text));
                                          },
                                          child: SvgPicture.asset(
                                            width: 20.w,
                                            height: 20.h,
                                            "images/copy.svg",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Share.share(
                                              obj.textEditingController.text,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            width: 20.w,
                                            height: 20.h,
                                            "images/share.svg",
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            obj.textEditingController.clear();
                                            obj.updatetext(true);
                                            obj.updatemic(false);
                                          },
                                          child: SvgPicture.asset(
                                              width: 20.w,
                                              height: 20.h,
                                              "images/Delete.svg"),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isKeyboardVisible ? 20.h : 30.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomContainer(
                          borderRadius: 15.r,
                          height: isKeyboardVisible ? 31.h : 50.h,
                          width: 135.w,
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
                          height: isKeyboardVisible ? 31.h : 50.h,
                          width: 135.w,
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
                      height: isKeyboardVisible ? 15.h : 20.h,
                    ),
                    isKeyboardVisible
                        ? Button(
                            onTap: () {},
                            height: 36.h,
                            width: 217.w,
                            text: "Start translation",
                            fontWeight: FontWeight.w500,
                            borderRadius: 50.r,
                          )
                        : AvatarGlow(
                            glowColor: primaryColor,
                            animate: obj.ismicOpen.value,
                            glowCount: 1,
                            child: FloatingActionButton.large(
                              onPressed: () {
                                if (obj.isEmpty.value) {
                                  if (obj.ismicOpen.value) {
                                    obj.stopListening();
                                    obj.updatemic(false);
                                  } else {
                                    obj.startListening();
                                    obj.updatemic(true);
                                  }
                                }
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              backgroundColor: primaryColor,
                              shape:
                                  const CircleBorder(), // Set background color to pink
                              child: SvgPicture.asset(
                                obj.isEmpty.value
                                    ? obj.ismicOpen.value
                                        ? "images/stop.svg"
                                        : "images/mic.svg"
                                    : "images/translation.svg",
                                color: obj.isEmpty.value ? null : Colors.white,
                                height: obj.ismicOpen.value ? 25.h : 40.h,
                                width: obj.ismicOpen.value ? 25.w : 30.w,
                              ),
                            ),
                          ),
                    obj.isEmpty.value || isKeyboardVisible
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: TextWidget(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              text: "Translate",
                            ),
                          ),
                  ],
                ),
              ),
            );
          });
        });
      }),
    );
  }
}




// import 'package:alxza/view/home/home/controller.dart';
// import 'package:alxza/view/home/menue/translator/controller.dart';
// import 'package:alxza/widget/button.dart';
// import 'package:alxza/widget/colors.dart';
// import 'package:alxza/widget/confirmation_dialogue.dart';
// import 'package:alxza/widget/custom_container.dart';
// import 'package:alxza/widget/text_widget.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';

// class TranslateScreen extends StatefulWidget {
//   const TranslateScreen({super.key});

//   @override
//   State<TranslateScreen> createState() => _TranslateScreenState();
// }

// class _TranslateScreenState extends State<TranslateScreen>
// // with WidgetsBindingObserver
// {
//   // final tooltipController = JustTheController();
//   @override
//   void initState() {
//     // SchedulerBinding.instance.addPostFrameCallback((_) {
//     //   tooltipController.showTooltip();
//     // });
//     // WidgetsBinding.instance.addObserver(this);
//     TranslatorController.to.textEditingController = TextEditingController();
//     TranslatorController.to.ismicOpen.value = false;
//     TranslatorController.to.isEmpty.value = true;
//     // TranslatorController.to.initspeech();
//     TranslatorController.to.generateApi(text: "hello");
//     super.initState();
//   }

//   @override
//   void dispose() {
//     TranslatorController.to.textEditingController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backGroundColor,
//       body: KeyboardVisibilityBuilder(
//           builder: (context, child, isKeyboardVisible) {
//         return GetBuilder<TranslatorController>(builder: (obj) {
//           return Obx(() {
//             // log("hii $isKeyboardVisible");

//             return SizedBox(
//               height: ScreenUtil().screenHeight,
//               width: ScreenUtil().screenWidth,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       color: Colors.white,
//                       height: 50.h,
//                     ),
//                     Container(
//                       color: Colors.white,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Row(
//                           children: [
//                             CustomContainer(
//                               onTap: () {
//                                 HomeController.to.selectedItemPosition.value =
//                                     0;
//                               },
//                               width: 35.w,
//                               height: 35.w,
//                               margin: EdgeInsets.only(bottom: 5.h),
//                               borderRadius: 8.r,
//                               borderColor: Colors.grey,
//                               borderWidth: 1.w,
//                               child: Center(
//                                 child: Icon(
//                                   Icons.arrow_back_ios_new,
//                                   color: Colors.grey,
//                                   size: 15.h,
//                                 ),
//                               ),
//                             ),
//                             const Spacer(),

//                             Center(
//                               child: TextWidget(
//                                 text: "AI Translator",
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             const Spacer(),
//                             // JustTheTooltip(
//                             //   borderRadius: BorderRadius.circular(7.r),
//                             //   tailLength: 5,
//                             //   margin: const EdgeInsets.all(0),
//                             //   preferredDirection: AxisDirection.down,
//                             //   tailBaseWidth: 15.w,
//                             //   controller: tooltipController,
//                             //   backgroundColor: Colors.white,
//                             //   offset: 0,
//                             //   content: Padding(
//                             //     padding: EdgeInsets.symmetric(
//                             //         horizontal: 15.w, vertical: 3.h),
//                             //     child: TextWidget(
//                             //       text: "100 000 / 250 000",
//                             //       fontSize: 12.sp,
//                             //       color: primaryColor,
//                             //       fontWeight: FontWeight.w500,
//                             //     ),
//                             //   ),
//                             //   child:

//                             InkWell(
//                               onTap: () {
//                                 // tooltipController.showTooltip();
//                                 Get.dialog(CreditDialogue(
//                                   onYesBtnClick: () {
//                                     Get.back();
//                                     HomeController
//                                         .to.selectedItemPosition.value = 11;
//                                     // Get.to(() => Upgrade_to_pro(),
//                                     //     transition: Transition.leftToRight);
//                                   },
//                                 ));
//                               },
//                               child: Image.asset(
//                                 "images/token.png",
//                                 height: 35.h,
//                                 width: 35.w,
//                               ),
//                             ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.white,
//                       height: 5.h,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               color:
//                                   Colors.black.withOpacity(0.2), // Shadow color
//                               spreadRadius: 0, // Spread radius
//                               blurRadius: 2, // Blur radius
//                               offset: const Offset(0,
//                                   2), // Offset from top to create a shadow from the bottom
//                             ),
//                           ],
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(13.r),
//                               bottomRight: Radius.circular(13.r))),
//                       height: isKeyboardVisible ? 310.h : 410.h,
//                       width: ScreenUtil().screenWidth,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             new Scrollbar(
//                               child: new SingleChildScrollView(
//                                 scrollDirection: Axis.vertical,
//                                 reverse: true,
//                                 child: SizedBox(
//                                   height: obj.isEmpty.value
//                                       ? null
//                                       : isKeyboardVisible
//                                           ? 260.h
//                                           : 360.h,
//                                   child: obj.apiState == "pending"
//                                       ? TextFormField(
//                                           onTap: () {
//                                             // textEditingController.selection =
//                                             //     textEditingController.selection =
//                                             //         TextSelection(
//                                             //             baseOffset: 0,
//                                             //             extentOffset: obj
//                                             //                 .textEditingController
//                                             //                 .text
//                                             //                 .length);
//                                           },
//                                           onChanged: (v) {
//                                             if (v.isNotEmpty) {
//                                               if (obj.isEmpty.value) {
//                                                 obj.updatetext(false);
//                                               }
//                                             } else {
//                                               obj.updatetext(true);
//                                             }
//                                           },
//                                           style: TextStyle(
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.w400,
//                                             fontSize: 13.sp,
//                                           ),
//                                           maxLines: obj.isEmpty.value
//                                               ? null
//                                               : isKeyboardVisible
//                                                   ? 11
//                                                   : 17,
//                                           keyboardType: TextInputType.multiline,
//                                           controller: obj.textEditingController,
//                                           textAlign: TextAlign.justify,
//                                           decoration: InputDecoration(
//                                             // filled: true,
//                                             // fillColor: Colors.black,
//                                             border: InputBorder.none,
//                                             hintText: obj.ismicOpen.value
//                                                 ? "Speak now ..."
//                                                 : obj.speechToText.isListening
//                                                     ? "Listening..."
//                                                     : "Enter text ...",
//                                             hintStyle: TextStyle(
//                                               fontFamily: "Poppins",
//                                               fontWeight: FontWeight.w600,
//                                               color: textgrey,
//                                               fontSize: 20.sp,
//                                             ),
//                                           ),
//                                         )
//                                       : obj.apiState == "complete"
//                                           ? DefaultTextStyle(
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 17.sp),
//                                               child: AnimatedTextKit(
//                                                 isRepeatingAnimation: false,
//                                                 repeatForever: false,
//                                                 displayFullTextOnTap: true,
//                                                 totalRepeatCount: 1,
//                                                 animatedTexts: [
//                                                   TyperAnimatedText(
//                                                       obj.generatedtext.trim()),
//                                                 ],
//                                               ),
//                                             )
//                                           : SizedBox(),
//                                 ),
//                               ),
//                             ),
//                             !obj.isEmpty.value || obj.ismicOpen.value
//                                 ? const SizedBox()
//                                 : CustomContainer(
//                                     onTap: () async {
//                                       final clipboardData =
//                                           await Clipboard.getData(
//                                               Clipboard.kTextPlain);

//                                       obj.textEditingController.text =
//                                           clipboardData!.text!;
//                                       if (obj.textEditingController.text
//                                           .isNotEmpty) {
//                                         obj.updatetext(false);
//                                       }
//                                     },
//                                     borderRadius: 50.r,
//                                     height: 28.h,
//                                     width: 91.w,
//                                     color: primaryColor,
//                                     child: Center(
//                                       child: obj.apiState == "run"
//                                           ? TextWidget(
//                                               fontSize: 15.sp,
//                                               fontWeight: FontWeight.w400,
//                                               text: "Typing...",
//                                               color: whiteColor,
//                                             )
//                                           : Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Image.asset(
//                                                   "images/clipboard.png",
//                                                   height: 15.h,
//                                                   width: 13.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 TextWidget(
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.w400,
//                                                   text: "Paste",
//                                                   color: whiteColor,
//                                                 ),
//                                               ],
//                                             ),
//                                     ),
//                                   ),
//                             const Spacer(),
//                             obj.isEmpty.value
//                                 ? const SizedBox()
//                                 : SizedBox(
//                                     height: 40.h,
//                                     // color: Colors.amber,
//                                     child: Row(
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             Clipboard.setData(ClipboardData(
//                                                 text: obj.textEditingController
//                                                     .text));
//                                           },
//                                           child: SvgPicture.asset(
//                                             width: 20.w,
//                                             height: 20.h,
//                                             "images/copy.svg",
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 15.w,
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             Share.share(
//                                               obj.textEditingController.text,
//                                             );
//                                           },
//                                           child: SvgPicture.asset(
//                                             width: 20.w,
//                                             height: 20.h,
//                                             "images/share.svg",
//                                           ),
//                                         ),
//                                         const Spacer(),
//                                         InkWell(
//                                           onTap: () {
//                                             obj.textEditingController.clear();
//                                             obj.updatetext(true);
//                                             obj.updatemic(false);
//                                           },
//                                           child: SvgPicture.asset(
//                                               width: 20.w,
//                                               height: 20.h,
//                                               "images/Delete.svg"),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: isKeyboardVisible ? 20.h : 30.h,
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         CustomContainer(
//                           borderRadius: 15.r,
//                           height: isKeyboardVisible ? 31.h : 50.h,
//                           width: 135.w,
//                           color: primaryColor.withOpacity(0.2),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 10.w),
//                             child: Center(
//                               child: TextWidget(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w500,
//                                 overflow: TextOverflow.ellipsis,
//                                 text: "Automatic detect",
//                                 color: primaryColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 5.w),
//                           child: Image.asset(
//                             "images/arrows.png",
//                             height: 20.h,
//                             width: 20.w,
//                           ),
//                         ),
//                         CustomContainer(
//                           borderRadius: 15.r,
//                           height: isKeyboardVisible ? 31.h : 50.h,
//                           width: 135.w,
//                           color: primaryColor.withOpacity(0.2),
//                           child: Center(
//                             child: TextWidget(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500,
//                               text: "Arabic",
//                               color: primaryColor,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: isKeyboardVisible ? 15.h : 20.h,
//                     ),
//                     isKeyboardVisible
//                         ? Button(
//                             onTap: () {},
//                             height: 36.h,
//                             width: 217.w,
//                             text: "Start translation",
//                             fontWeight: FontWeight.w500,
//                             borderRadius: 50.r,
//                           )
//                         : AvatarGlow(
//                             glowColor: primaryColor,
//                             animate: obj.ismicOpen.value,
//                             glowCount: 1,
//                             child: FloatingActionButton.large(
//                               onPressed: () {
//                                 if (obj.isEmpty.value) {
//                                   if (obj.ismicOpen.value) {
//                                     obj.stopListening();
//                                     obj.updatemic(false);
//                                   } else {
//                                     obj.startListening();
//                                     obj.updatemic(true);
//                                   }
//                                 }
//                               },
//                               materialTapTargetSize:
//                                   MaterialTapTargetSize.padded,
//                               backgroundColor: primaryColor,
//                               shape:
//                                   const CircleBorder(), // Set background color to pink
//                               child: SvgPicture.asset(
//                                 obj.isEmpty.value
//                                     ? obj.ismicOpen.value
//                                         ? "images/stop.svg"
//                                         : "images/mic.svg"
//                                     : "images/translation.svg",
//                                 color: obj.isEmpty.value ? null : Colors.white,
//                                 height: obj.ismicOpen.value ? 25.h : 40.h,
//                                 width: obj.ismicOpen.value ? 25.w : 30.w,
//                               ),
//                             ),
//                           ),
//                     obj.isEmpty.value || isKeyboardVisible
//                         ? const SizedBox()
//                         : Padding(
//                             padding: EdgeInsets.only(top: 5.h),
//                             child: TextWidget(
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w400,
//                               text: "Translate",
//                             ),
//                           ),
//                   ],
//                 ),
//               ),
//             );
//           });
//         });
//       }),
//     );
//   }
// }


// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:alxza/utilis/static_data.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:textwrap/textwrap.dart';

// class TranslatorController extends GetxController {
//   static TranslatorController get to => Get.find();
//   TextEditingController textEditingController = TextEditingController();
//   Rx<bool> isEmpty = true.obs;
//   Rx<bool> ismicOpen = false.obs;
//   String wordsspoken = '';
//   int? message_id;
//   Rx<String> apiState = "pending".obs;
//   String generatedtext = '';
//   void updatetext(bool value) {
//     isEmpty.value = value;
//   }

//   void updatemic(bool value) {
//     ismicOpen.value = value;
//   }

//   SpeechToText speechToText = SpeechToText();
//   void initspeech() async {
//     ismicOpen.value = await speechToText.initialize();
//     update();
//   }

//   void startListening() async {
//     await speechToText.listen(onResult: onSpeechResult);
//   }

//   void onSpeechResult(result) {
//     wordsspoken = "${result.recognizedWords}";
//     textEditingController.text = wordsspoken;
//     update();
//   }

//   void stopListening() async {
//     await speechToText.stop();
//     update();
//   }

//   void generateApi({
//     required String text,
//   }) async {
//     apiState.value = "run";
//     try {
//       var response = await http.post(
//           Uri.parse("${StaticData.baseURL}${StaticData.aiwritergenerate}"),
//           headers: {
//             "Content-Type": "application/json",
//             "Authorization": "Bearer ${StaticData.token}",
//           },
//           body: jsonEncode({
//             "post_type": "traducteur-ai-hC5y9W",
//             "openai_id": "52",
//             "maximum_length": "2000",
//             "number_of_results": "1",
//             "creativity": "1",
//             "tone_of_voice": "Professional",
//             "language": "ar-AE",
//             "texte": text
//           }));
//       log("response of generateApi ${response.statusCode}");
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         message_id = data['message_id'];
//         log("message_id is ${message_id}");

//         textEditingController.text =
//             wrap(await fetchGeneratedText(33, 1, 2000, 1)).join('\n');

//         apiState.value = "complete";
//         log("generated text is ${generatedtext}");
//       } else {}
//     } catch (error) {
//       log("Error in generateApi: $error");
//     }
//   }

//   Future<String> fetchGeneratedText(
//       int messageId, int creativity, int maxLength, int numberOfResults) async {
//     final url = Uri.parse(
//         '${StaticData.baseURL}${StaticData.aiwritergenerateoutput}?message_id=$messageId&creativity=$creativity&maximum_length=$maxLength&number_of_results=$numberOfResults');
//     var request = new http.Request("POST", url);
//     request.headers["Content-Type"] = "application/json; charset=UTF-8";
//     request.headers["Authorization"] = "Bearer ${StaticData.token}";

//     var response = await http.Client().send(request);
//     log("Streaming response is ${response.statusCode}");
//     if (response.statusCode == 200) {
//       return listenToTextStream(response);
//     } else {
//       throw Exception('Failed to fetch generated text: ${response.statusCode}');
//     }
//   }

//   Future<String> listenToTextStream(http.StreamedResponse response) async {
//     final stringStream = response.stream;
//     final stringBuffer = StringBuffer();

//     await for (final chunk in stringStream) {
//       stringBuffer.write(utf8.decode(chunk)); // Decode each byte chunk
//     }
//     return stringBuffer.toString();
//   }
// }

// /// Calls `builder` on keyboard close/open.
// /// https://stackoverflow.com/a/63241409/1321917
// class KeyboardVisibilityBuilder extends StatefulWidget {
//   final Widget Function(
//     BuildContext context,
//     Widget child,
//     bool isKeyboardVisible,
//   ) builder;

//   const KeyboardVisibilityBuilder({
//     super.key,
//     required this.builder,
//   });

//   @override
//   _KeyboardVisibilityBuilderState createState() =>
//       _KeyboardVisibilityBuilderState();
// }

// class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
//     with WidgetsBindingObserver {
//   var _isKeyboardVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeMetrics() {
//     final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
//     final newValue = bottomInset > 0.0;
//     if (newValue != _isKeyboardVisible) {
//       setState(() {
//         _isKeyboardVisible = newValue;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) => widget.builder(
//         context,
//         const SizedBox(),
//         _isKeyboardVisible,
//       );
// }
