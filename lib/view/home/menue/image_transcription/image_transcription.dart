import 'package:alxza/view/home/menue/image_transcription/controller.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/confirmation_dialogue.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:share_plus/share_plus.dart';

class ImageTranscriptionScreen extends StatefulWidget {
  const ImageTranscriptionScreen({super.key});

  @override
  State<ImageTranscriptionScreen> createState() =>
      _ImageTranscriptionScreenState();
}

class _ImageTranscriptionScreenState extends State<ImageTranscriptionScreen>
    with WidgetsBindingObserver {
  TextEditingController videourlcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final tooltipController = JustTheController();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      tooltipController.showTooltip();
    });
    WidgetsBinding.instance.addObserver(this);
    ImageTranscriptionController.to.isEmpty.value = true;
    ImageTranscriptionController.to.transcriptStatus.value = "empty";
    super.initState();
  }

  @override
  void dispose() {
    videourlcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return GetBuilder<ImageTranscriptionController>(builder: (obj) {
          return Obx(() {
            // log("hii $isKeyboardVisible");

            return Form(
              key: formkey,
              child: SizedBox(
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
                                  text: "Image Transcription",
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
                                    text: "25 min left",
                                    fontSize: 12.sp,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    tooltipController.showTooltip();
                                    // Get.dialog(CreditDialogue(
                                    //   onYesBtnClick: () {
                                    //     Get.back();
                                    //   },
                                    // ));
                                    Get.dialog(MenueDialogue(
                                      onYesBtnClick: () {
                                        Get.back();
                                      },
                                    ));
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
                                color: Colors.black
                                    .withOpacity(0.2), // Shadow color
                                spreadRadius: 0, // Spread radius
                                blurRadius: 2, // Blur radius
                                offset: const Offset(0,
                                    2), // Offset from top to create a shadow from the bottom
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(13.r),
                                bottomRight: Radius.circular(13.r))),
                        height: 360.h,
                        width: ScreenUtil().screenWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: obj.transcriptStatus.value == "run"
                                    ? 20.h
                                    : 50.h,
                              ),
                              Center(
                                child: SizedBox(
                                  width: 294.w,
                                  child: obj.transcriptStatus.value == "run"
                                      ? TextWidget(
                                          textAlign: TextAlign.start,
                                          text: "Running\nTranscription ...",
                                          fontWeight: FontWeight.w600,
                                          color: textgrey,
                                          fontSize: 24.sp,
                                        )
                                      : obj.transcriptStatus.value == "complete"
                                          ? SingleChildScrollView(
                                              child: TextWidget(
                                                textAlign: TextAlign.start,
                                                text:
                                                    "Social Media: Bridging the Gap, Expanding Connections Social media has revolutionized communication, connecting people across borders and cultures. It fosters a sense of unity, allowing individuals to exchange ideas, collaborate, and find like-minded communities. However, its impact extends beyond personal connections. Social media has transformed marketing strategies, political campaigns, and social activism, amplifying voices and sparking global movements. ",
                                                fontWeight: FontWeight.w400,
                                                color: textgrey,
                                                fontSize: 13.sp,
                                              ),
                                            )
                                          : TextWidget(
                                              textAlign: TextAlign.center,
                                              text:
                                                  "Create a transcription from an image or from a URL",
                                              fontWeight: FontWeight.w600,
                                              color: textgrey,
                                              fontSize: 24.sp,
                                            ),
                                ),
                              ),
                              const Spacer(),
                              obj.transcriptStatus.value == "complete"
                                  ? SizedBox(
                                      height: 40.h,
                                      // color: Colors.amber,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text:
                                                      videourlcontroller.text));
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
                                                videourlcontroller.text,
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
                                              videourlcontroller.clear();

                                              obj.updatetranscriptStatus(
                                                  "empty");
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
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 334.w,
                        child: CustomTextFormField(
                          hint: "Enter your image URL",
                          fontFamily: 'Poppins',
                          controller: videourlcontroller,
                          suffixIcon: obj.isEmpty.value
                              ? const SizedBox()
                              : IconButton(
                                  onPressed: () {
                                    videourlcontroller.clear();
                                    obj.updatetranscriptStatus("empty");
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: textgrey,
                                  )),
                          onChanged: (v) {
                            if (v.isNotEmpty) {
                              if (obj.isEmpty.value) {
                                obj.updatetext(false);
                              }
                            } else {
                              obj.updatetext(true);
                            }
                          },
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Please enter image URL";
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Button(
                        onTap: () {},
                        height: 36.h,
                        width: 217.w,
                        text: "Or upload directly",
                        fontWeight: FontWeight.w500,
                        borderRadius: 50.r,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          obj.transcriptStatus.value == "empty" ||
                                  obj.transcriptStatus.value == "run"
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            Get.dialog(EnoughDialogue(
                                              onYesBtnClick: () {
                                                Get.back();
                                              },
                                            ));
                                          }
                                        },
                                        elevation: 0,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.padded,
                                        backgroundColor:
                                            primaryColor.withOpacity(0.2),
                                        shape:
                                            const CircleBorder(), // Set background color to pink
                                        child: SvgPicture.asset(
                                          "images/translation.svg",
                                          height: 25.h,
                                          width: 25.w,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: TextWidget(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        text: "Translate",
                                      ),
                                    ),
                                  ],
                                ),
                          Column(
                            children: [
                              FloatingActionButton.large(
                                onPressed: () {
                                  if (obj.transcriptStatus.value == "empty") {
                                    if (formkey.currentState!.validate()) {
                                      obj.updatetranscriptStatus("run");
                                    }
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
                                child:
                                    // obj.transcriptStatus.value == "empty" ||
                                    //         obj.transcriptStatus.value == "complete"
                                    //     ? Image.asset(
                                    //         "images/youtube_outlined.png",
                                    //         height: 40.h,
                                    //         width: 40.w,
                                    //       )
                                    //     :
                                    SvgPicture.asset(
                                  obj.transcriptStatus.value == "empty" ||
                                          obj.transcriptStatus.value ==
                                              "complete"
                                      ? "images/whitecam.svg"
                                      : "images/stop.svg",
                                  height:
                                      obj.transcriptStatus.value == "empty" ||
                                              obj.transcriptStatus.value ==
                                                  "complete"
                                          ? 30.h
                                          : 25.h,
                                  color:
                                      obj.transcriptStatus.value == "empty" ||
                                              obj.transcriptStatus.value ==
                                                  "complete"
                                          ? Colors.white
                                          : null,
                                  width:
                                      obj.transcriptStatus.value == "empty" ||
                                              obj.transcriptStatus.value ==
                                                  "complete"
                                          ? 30.h
                                          : 25.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: TextWidget(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  text: "Transcribe",
                                ),
                              ),
                            ],
                          ),
                          obj.transcriptStatus.value == "empty" ||
                                  obj.transcriptStatus.value == "run"
                              ? const SizedBox()
                              : SizedBox(
                                  height: 40.h,
                                  width: 55.w,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
      }),
    );
  }
}
