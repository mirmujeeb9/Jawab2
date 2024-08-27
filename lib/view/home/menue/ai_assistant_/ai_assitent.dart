import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/ai_assistant_/controller.dart';
import 'package:alxza/view/home/menue/file_analyzer/message_card/message_card.dart';
import 'package:alxza/view/home/menue/file_analyzer/model/model.dart';
import 'package:alxza/view/home/menue/translator/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AiassistentScreen extends StatefulWidget {
  const AiassistentScreen({super.key});

  @override
  State<AiassistentScreen> createState() => _AiassistentScreenState();
}

class _AiassistentScreenState extends State<AiassistentScreen>
// with WidgetsBindingObserver
{
  // final tooltipController = JustTheController();
  @override
  void initState() {
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   tooltipController.showTooltip();
    // });
    // WidgetsBinding.instance.addObserver(this);
    AiAssistentController.to.messagecontropller = TextEditingController();
    AiAssistentController.to.messagellist.clear();
    super.initState();
  }

  @override
  void dispose() {
    AiAssistentController.to.messagecontropller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: KeyboardVisibilityBuilder(
          builder: (context, child, isKeyboardVisible) {
        return GetBuilder<AiAssistentController>(builder: (obj) {
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
                            text: "AI Assistant",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                GetBuilder<AiAssistentController>(
                    id: 'list',
                    builder: (obj) {
                      return Expanded(
                        child: Center(
                          child: obj.messagellist.isEmpty
                              ? Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextWidget(
                                        text: "Type something like:",
                                        fontSize: 14.sp,
                                        color: const Color(0xff888888),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.r),
                                        ),
                                        child: Container(
                                          height: 80.h,
                                          width: 335.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.r),
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                                width: 289.w,
                                                child: Center(
                                                  child: TextWidget(
                                                    text:
                                                        "Write an art article discussing the benefits of\npracticing mindfulness in daily life ",
                                                    fontSize: 13.sp,
                                                    color:
                                                        const Color(0xffAAAAAA),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.r),
                                        ),
                                        child: Container(
                                          height: 80.h,
                                          width: 335.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.r),
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                                width: 284.w,
                                                child: Center(
                                                  child: TextWidget(
                                                    text:
                                                        "Write an art article discussing the impact of\nelate change on the pointe",
                                                    fontSize: 13.sp,
                                                    color:
                                                        const Color(0xffAAAAAA),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.r),
                                        ),
                                        child: Container(
                                          height: 80.h,
                                          width: 335.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13.r),
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                                width: 313.w,
                                                child: Center(
                                                  child: TextWidget(
                                                    text:
                                                        "Write an art article discussing the importance of\nmaintaining a healthy work life balance",
                                                    fontSize: 13.sp,
                                                    color:
                                                        const Color(0xffAAAAAA),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: obj.messagellist.length,
                                  itemBuilder: (context, index) {
                                    Message model = obj.messagellist[index];

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
                            controller: obj.messagecontropller,
                            maxLines: 5,
                            minLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                        obj.addmessage();
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
