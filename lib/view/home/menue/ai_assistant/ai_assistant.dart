import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/ai_assistant/controller.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AiassistentScreen extends StatefulWidget {
  const AiassistentScreen({super.key});

  @override
  State<AiassistentScreen> createState() => _AiassistentScreenState();
}

class _AiassistentScreenState extends State<AiassistentScreen>
// with WidgetsBindingObserver
{
  TextEditingController textEditingController = TextEditingController();

  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);
    AiassistentController.to.transcriptStatus.value = "empty";
    AiassistentController.to.isEmpty.value = true;
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return GetBuilder<AiassistentController>(builder: (obj) {
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
                                text: "IA Assistant",
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
                            // child:
                            // InkWell(
                            //   onTap: () {
                            //     // tooltipController.showTooltip();
                            //     Get.dialog(CreditDialogue(
                            //       onYesBtnClick: () {
                            //         Get.back();
                            //         HomeController
                            //             .to.selectedItemPosition.value = 11;
                            //         // Get.to(() => Upgrade_to_pro(),
                            //         //     transition: Transition.leftToRight);
                            //       },
                            //     ));
                            //   },
                            //   child: Image.asset(
                            //     "images/token.png",
                            //     height: 35.h,
                            //     width: 35.w,
                            //   ),
                            // ),
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
                      height: isKeyboardVisible
                          ? 310.h
                          : obj.transcriptStatus.value == "complete"
                              ? 480.h
                              : 450.h,
                      width: ScreenUtil().screenWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
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
                                controller: textEditingController,
                                textAlign: TextAlign.justify,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: obj.transcriptStatus.value == "run"
                                      ? "Speak now ..."
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
                            !obj.isEmpty.value ||
                                    obj.transcriptStatus.value == "run" ||
                                    obj.transcriptStatus.value == "complete"
                                ? const SizedBox()
                                : CustomContainer(
                                    onTap: () async {
                                      final clipboardData =
                                          await Clipboard.getData(
                                              Clipboard.kTextPlain);

                                      textEditingController.text =
                                          clipboardData!.text!;
                                      if (textEditingController
                                          .text.isNotEmpty) {
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
                            !obj.isEmpty.value ||
                                    obj.transcriptStatus.value == "complete"
                                ? SizedBox(
                                    height: 40.h,
                                    // color: Colors.amber,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Clipboard.setData(ClipboardData(
                                                text: textEditingController
                                                    .text));
                                          },
                                          child: SvgPicture.asset(
                                              width: 20.w,
                                              height: 20.h,
                                              "images/copy.svg"),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Share.share(
                                              textEditingController.text,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                              width: 20.w,
                                              height: 20.h,
                                              "images/share.svg"),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            textEditingController.clear();
                                            obj.updatetext(true);
                                            obj.updatetranscriptStatus("empty");
                                          },
                                          child: SvgPicture.asset(
                                              width: 20.w,
                                              height: 20.h,
                                              "images/Delete.svg"),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: isKeyboardVisible
                          ? 25.h
                          : obj.transcriptStatus.value == "complete"
                              ? 20.h
                              : 40.h,
                    ),
                    isKeyboardVisible
                        ? obj.isEmpty.value
                            ? const SizedBox()
                            : Button(
                                onTap: () {
                                  if (obj.transcriptStatus.value ==
                                      "complete") {
                                    // textEditingController.clear();
                                    // obj.updatetranscriptStatus("empty");
                                  }
                                },
                                height: 36.h,
                                width: 250.w,
                                text: "Generate the answer",
                                fontWeight: FontWeight.w500,
                                borderRadius: 50.r,
                              )
                        : AvatarGlow(
                            glowColor: primaryColor,
                            animate: obj.transcriptStatus.value == "run"
                                ? true
                                : false,
                            glowCount: 1,
                            child: FloatingActionButton.large(
                              onPressed: () {
                                if (obj.transcriptStatus.value == "empty") {
                                  obj.updatetranscriptStatus("run");

                                  Future.delayed(const Duration(seconds: 5),
                                      () {
                                    obj.transcriptStatus.value = "complete";
                                    obj.updatetext(false);
                                    textEditingController.text =
                                        "Social Media: Bridging the Gap, Expanding Connections Social media has revolutionized communication, connecting people across borders and cultures. It fosters a sense of unity, allowing individuals to exchange ideas, collaborate, and find like-minded communities. However, its impact extends beyond personal connections. Social media has transformed marketing strategies, political campaigns, and social activism, amplifying voices and sparking global movements. ";
                                  });
                                } else if (obj.transcriptStatus.value ==
                                    "run") {
                                  obj.updatetranscriptStatus("empty");
                                }
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              backgroundColor: primaryColor,
                              shape:
                                  const CircleBorder(), // Set background color to pink
                              child: SvgPicture.asset(
                                obj.transcriptStatus.value == "run"
                                    ? "images/stop.svg"
                                    : obj.transcriptStatus.value == "complete"
                                        ? "images/translation.svg"
                                        : "images/mic.svg",
                                color: obj.transcriptStatus.value == "run"
                                    ? null
                                    : Colors.white,
                                height: obj.transcriptStatus.value == "run"
                                    ? 25.h
                                    : 40.h,
                                width: obj.transcriptStatus.value == "run"
                                    ? 25.w
                                    : 30.w,
                              ),
                            ),
                          ),
                    obj.transcriptStatus.value == "run" ||
                            isKeyboardVisible ||
                            obj.isEmpty.value
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
