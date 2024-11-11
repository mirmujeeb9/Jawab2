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

class _AiassistentScreenState extends State<AiassistentScreen> {
  final AiAssistentController aiController = Get.put(AiAssistentController());

  @override
  void initState() {
    super.initState();
    aiController.messageController = TextEditingController();
    aiController.messageList.clear();
  }

  @override
  void dispose() {
    aiController.messageController.dispose();
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
                  SizedBox(height: 50.h),
                  Padding(
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
                  GetBuilder<AiAssistentController>(
                      id: 'list',
                      builder: (obj) {
                        return Expanded(
                          child: Center(
                            child: obj.messageList.isEmpty
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.h),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextWidget(
                                          text: "Type something like:",
                                          fontSize: 14.sp,
                                          color: const Color(0xff888888),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        _buildExampleCard(
                                          "Write an article on the benefits of mindfulness",
                                        ),
                                        _buildExampleCard(
                                          "Discuss the impact of climate change",
                                        ),
                                        _buildExampleCard(
                                          "Importance of work-life balance",
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: obj.messageList.length,
                                    itemBuilder: (context, index) {
                                      Message model = obj.messageList[index];
                                      return MessageCard(message: model);
                                    },
                                  ),
                          ),
                        );
                      }),
                  _buildInputRow(obj), // Updated input row here
                ],
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildExampleCard(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.r),
        ),
        child: Container(
          height: 80.h,
          width: 335.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.r),
            color: Colors.white,
          ),
          child: Center(
            child: TextWidget(
              text: text,
              fontSize: 13.sp,
              color: const Color(0xffAAAAAA),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputRow(AiAssistentController obj) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Container(
              width: 270.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: TextFormField(
                  controller: obj.messageController,
                  maxLines: 5,
                  minLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => obj.pickPDF(),
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
          FloatingActionButton(
            onPressed: () => obj.sendMessage(),
            backgroundColor: primaryColor,
            shape: const CircleBorder(),
            child: SvgPicture.asset(
              "images/Send.svg",
              height: 17.h,
              width: 17.w,
            ),
          ),
        ],
      ),
    );
  }
}
