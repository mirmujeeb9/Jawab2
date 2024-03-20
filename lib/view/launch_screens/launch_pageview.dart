import 'package:alxza/view/welcome/welcome.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LaunchPageView extends StatefulWidget {
  const LaunchPageView({super.key});

  @override
  State<LaunchPageView> createState() => _LaunchPageViewState();
}

class _LaunchPageViewState extends State<LaunchPageView> {
  PageController controller = PageController(initialPage: 0);
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: ScreenUtil().screenHeight * 0.8,
                width: ScreenUtil().screenWidth,
                child: PageView(
                  controller: controller,
                  onPageChanged: (val) {
                    setState(() {
                      i = val;
                    });
                  },
                  children: [
                    // 1
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          height: 329.h,
                          width: 329.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'images/lauch_bg.png',
                              ),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'images/ai.png',
                              height: 200.h,
                              width: 203.w,
                            ),
                          ),
                        ),
                        TextWidget(
                          text: '''Welcome on Jawab
Let me show you what
we can do for you !''',
                          textAlign: TextAlign.center,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    //2
                    LaunchingWidget(
                      title: "AI Translator",
                      subtitle:
                          "Accurate and contextual translations in Arabic\n for a deep and nuanced understanding.",
                      image: "images/langues.png",
                    ),
                    // 3
                    LaunchingWidget(
                      title: "Audio / Video\n Transcription",
                      subtitle:
                          "Transcribe audio and video content, including\n YouTube links, into Arabic text.",
                      image: "images/youtube.png",
                    ),
                    // 4
                    LaunchingWidget(
                      title: "Image\nTranscription",
                      subtitle:
                          "Convert images into editable Arabic text for\n easy and quick access to content.",
                      image: "images/camera.png",
                    ),

                    // 5
                    LaunchingWidget(
                      title: "Advanced\nDictionary",
                      subtitle:
                          "Decrypts each word or term in a sentence for a\n detailed understanding of the Arabic language.",
                      image: "images/dictionnaire.png",
                    ), // 6
                    LaunchingWidget(
                      title: "Arabic\nConjugation",
                      subtitle:
                          "Provides the complete sarf for each verb,\n simplifying the learning of conjugation.",
                      image: "images/livre.png",
                    ), // 7
                    LaunchingWidget(
                      title: "AI Assistant ",
                      subtitle:
                          "Ask your questions in Arabic and receive\n  answers from our intelligent assistant.",
                      image: "images/ai.png",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21.r),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.offAll(
                          () => const WelcomeScreen(),
                          transition: Transition.leftToRight,
                        );
                      },
                      child: Container(
                        width: 50.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: primaryColor,
                        ),
                        child: Center(
                          child: TextWidget(
                            text: "Skip",
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Button(
            onTap: () {
              if (i < 6) {
                controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              } else {
                Get.offAll(
                  () => const WelcomeScreen(),
                  transition: Transition.rightToLeft,
                );
              }
            },
            width: 335.w,
            text: i == 0 ? "Let’s go !" : "Next",
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 35.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              7,
              (index) => AnimatedContainer(
                height: index == i ? 5.w : 7.w,
                width: index == i ? 12.w : 7.w,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(index == i ? 10.r : 100.r),
                  color: index == i ? null : whiteColor,
                  border: Border.all(
                      color:
                          index == i ? primaryColor : const Color(0xffC8C8C8),
                      width: 2.w),
                ),
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LaunchingWidget extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  LaunchingWidget({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 50.h,
        ),
        Container(
          height: 329.h,
          width: 329.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                'images/lauch_bg.png',
              ),
            ),
          ),
          child: Center(
            child: Image.asset(
              image,
              height: 180.h,
              width: 203.w,
            ),
          ),
        ),
        Heading(
          text: title,
        ),
        Subheading(
          textAlign: TextAlign.center,
          text: subtitle,
          color: Colors.grey,
        ),
      ],
    );
  }
}
