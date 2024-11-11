import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/file_analyzer/controller.dart';
import 'package:alxza/view/home/menue/file_analyzer/message_card/message_card.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/view/home/menue/ai_assistant_/controller.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FileAnalyzer extends StatefulWidget {
  const FileAnalyzer({super.key});

  @override
  State<FileAnalyzer> createState() => _FileAnalyzerState();
}

class _FileAnalyzerState extends State<FileAnalyzer>
// with WidgetsBindingObserver
{
  // final tooltipController = JustTheController();
  // Singleton instance
  static FileAnalyzerController get to => Get.find();

  // Controller for user messages
  TextEditingController messageController = TextEditingController();

  // List of messages
  List<Message> messageList = [];

  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return GetBuilder<FileAnalyzerController>(builder: (obj) {
          return SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
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
                          onTap: () {
                            HomeController.to.selectedItemPosition.value = 0;
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
                            text: "File Analyzer",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                GetBuilder<FileAnalyzerController>(
                    id: 'list',
                    builder: (obj) {
                      return Expanded(
                        child: Center(
                          child: obj.messageList.isEmpty
                              ? Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextWidget(
                                        textAlign: TextAlign.center,
                                        text:
                                            "Hi! I am File Analyzer. I can assist you\nwith PDF, DOC, DOCX or CSV\ninformation or questions",
                                        fontSize: 13.sp,
                                        color: const Color(0xff888888),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: obj.messageList.length,
                                  itemBuilder: (context, index) {
                                    Message model = obj.messageList[index];

                                    return MessageCard(
                                      message: model,
                                    );
                                  },
                                ),
                        ),
                      );
                    }),
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
                        width: 270.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: TextFormField(
                            controller: obj.messageController,
                            maxLines: 5,
                            minLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    obj.pickFile();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    height: 30.h,
                                    width: 30.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                        "images/document.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.mic,
                                size: 35.h,
                                color: const Color(0xff241649),
                              ),
                              contentPadding: EdgeInsets.only(
                                top: 10.h,
                                left: 20.w,
                              ),
                              border: InputBorder.none,
                              hintText: "Ask me anything",
                              hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black45,
                                fontSize: 11.h,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        obj.sendMessage();
                      },
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
          );
        });
      }),
    );
  }
}
