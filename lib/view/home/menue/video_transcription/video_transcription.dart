/*import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:alxza/view/home/menue/video_transcription/controller.dart';

class VideoTranscriptionScreen extends StatefulWidget {
  const VideoTranscriptionScreen({super.key});

  @override
  State<VideoTranscriptionScreen> createState() =>
      _VideoTranscriptionScreenState();
}

class _VideoTranscriptionScreenState extends State<VideoTranscriptionScreen>
// with WidgetsBindingObserver
{
  TextEditingController controller.videourlcontroller = TextEditingController();
  final VideoTranscriptionController controller =
      Get.put(VideoTranscriptionController());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);
    VideoTranscriptionController.to.isEmpty.value = true;
    VideoTranscriptionController.to.transcriptStatus.value = "empty";

    super.initState();
  }

  @override
  void dispose() {
    controller.videourlcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Transcription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text field to display transcribed text
            Obx(() => TextField(
                  controller: TextEditingController(
                      text: controller.transcribedText.value),
                  maxLines: 10,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Transcribed Text',
                    border: OutlineInputBorder(),
                    hintText: 'The transcribed text will appear here...',
                  ),
                )),
            SizedBox(height: 20),

            // Upload File button
            ElevatedButton(
              onPressed: () async {
                // Pick a video file
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.video,
                );

                if (result != null && result.files.isNotEmpty) {
                  // Get the selected file
                  File videoFile = File(result.files.single.path!);
                  controller
                      .uploadVideo(videoFile); // Call the uploadVideo method
                }
              },
              child: Text('Upload Video File'),
            ),

            // Display loading or error messages
            SizedBox(height: 20),
            Obx(() {
              if (controller.transcriptStatus.value == "run") {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show loading indicator
              } else if (controller.transcriptStatus.value == "error") {
                return Text(
                  'Error: ${controller.transcribedText.value}',
                  style: TextStyle(color: Colors.red),
                );
              } else if (controller.transcriptStatus.value == "complete") {
                return Text(
                  'Transcription complete!',
                  style: TextStyle(color: Colors.green),
                );
              }
              return SizedBox(); // Empty space if no status
            }),
          ],
        ),
      ),
    );
  }
}*/

import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/view/home/menue/video_transcription/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/confirmation_dialogue.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class VideoTranscriptionScreen extends StatefulWidget {
  const VideoTranscriptionScreen({super.key});

  @override
  State<VideoTranscriptionScreen> createState() =>
      _VideoTranscriptionScreenState();
}

class _VideoTranscriptionScreenState extends State<VideoTranscriptionScreen>
// with WidgetsBindingObserver
{
  TextEditingController videourlcontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final VideoTranscriptionController controller =
      Get.put(VideoTranscriptionController());
  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);
    VideoTranscriptionController.to.isEmpty.value = true;
    VideoTranscriptionController.to.transcriptStatus.value = "empty";
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
        return GetBuilder<VideoTranscriptionController>(builder: (obj) {
          return Obx(() {
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
                                  text: "Video Transcription",
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
                              //       text: "25 min left",
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
                                          fontSize: 20.sp,
                                        )
                                      : obj.transcriptStatus.value == "complete"
                                          ? SingleChildScrollView(
                                              child: TextWidget(
                                                textAlign: TextAlign.start,
                                                text: VideoTranscriptionController
                                                        .to
                                                        .transcribedText
                                                        .value
                                                        .isNotEmpty
                                                    ? VideoTranscriptionController
                                                        .to
                                                        .transcribedText
                                                        .value
                                                    : "No transcription available.",
                                                fontWeight: FontWeight.w400,
                                                color: textgrey,
                                                fontSize: 13.sp,
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                TextWidget(
                                                  textAlign: TextAlign.center,
                                                  text:
                                                      "Create a transcription from a file video",
                                                  fontWeight: FontWeight.w600,
                                                  color: textgrey,
                                                  fontSize: 20.sp,
                                                ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                Subheading(
                                                  text:
                                                      ".mp4, .mpeg allowed. Max files size : 25 MB",
                                                  textAlign: TextAlign.center,
                                                  color: textgrey,
                                                ),
                                              ],
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
                                                controller
                                                    .videourlcontroller.text,
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
                                              controller.videourlcontroller
                                                  .clear();

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
                      /*SizedBox(
                        width: 334.w,
                        child: CustomTextFormField(
                          hint: "Enter your youtube video URL",
                          fontFamily: 'Poppins',
                          controller: controller.videourlcontroller,
                          suffixIcon: obj.isEmpty.value
                              ? const SizedBox()
                              : IconButton(
                                  onPressed: () {
                                    controller.videourlcontroller.clear();
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
                              return "Please enter video URL";
                            }

                            return null;
                          },
                        ),
                      ),*/
                      SizedBox(
                        height: 20.h,
                      ),
                      Button(
                        onTap: () async {
                          // Pick a video file
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.video,
                          );

                          if (result != null && result.files.isNotEmpty) {
                            // Get the selected file
                            File videoFile = File(result.files.single.path!);
                            controller.uploadVideo(
                                videoFile); // Call the uploadVideo method
                          }
                        },
                        height: 36.h,
                        width: 217.w,
                        text: "Upload directly",
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
                                        heroTag: "translation",
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            Get.dialog(EnoughDialogue(
                                                onYesBtnClick: () {
                                              Get.back();
                                              HomeController
                                                  .to
                                                  .selectedItemPosition
                                                  .value = 11;
                                              // Get.to(() => Upgrade_to_pro(),
                                              //     transition:
                                              //         Transition.leftToRight);
                                            }));
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
                              AvatarGlow(
                                glowColor: primaryColor,
                                animate: obj.transcriptStatus.value == "run"
                                    ? true
                                    : false,
                                glowCount: 1,
                                child: FloatingActionButton.large(
                                  heroTag: "youtube_outlined",
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
                                      obj.transcriptStatus.value == "empty" ||
                                              obj.transcriptStatus.value ==
                                                  "complete"
                                          ? Image.asset(
                                              "images/youtube_outlined.png",
                                              height: 40.h,
                                              width: 40.w,
                                            )
                                          : SvgPicture.asset(
                                              "images/stop.svg",
                                              height: 25.h,
                                              width: 25.w,
                                            ),
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
