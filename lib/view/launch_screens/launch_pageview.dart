import 'package:alxza/view/launch_screens/onboarding_10.dart';
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
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Column(
          children: [
            Container(
              height: ScreenUtil().screenHeight * 0.8,
              width: ScreenUtil().screenWidth,
              child: Stack(
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
                              text:
                                  'Welcome on Jawab\nLet me show you what\nwe can do for you !',
                              textAlign: TextAlign.center,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        LaunchingWidget(
                          index: i,
                          title: "AI Translator",
                          subtitle:
                              "Accurate and contextual translations in Arabic\n for a deep and nuanced understanding.",
                          image: "images/langues.png",
                        ),
                        LaunchingWidget(
                          index: i,
                          title: "Advanced\nDictionary",
                          subtitle:
                              "Decrypts each word or term in a sentence for a\n detailed understanding of the Arabic language.",
                          image: "images/dictionnaire.png",
                        ),
                        LaunchingWidget(
                          index: i,
                          title: "Audio / Video\n Transcription",
                          subtitle:
                              "Transcribe audio and video content, including\n YouTube links, into Arabic text.",
                          image: "images/youtube.png",
                        ),
                        LaunchingWidget(
                          index: i,
                          title: "Advanced\nDictionary",
                          subtitle:
                              "Decrypts each word or term in a sentence for a\n detailed understanding of the Arabic language.",
                          image: "images/dictionnaire.png",
                        ),
                        LaunchingWidget(
                          index: i,
                          title: "Analyze\nPDF files",
                          subtitle:
                              "Analyze your PDFs in-depth to quickly extract\nand understand key information.",
                          image: "images/pdf.png",
                        ),
                        LaunchingWidget(
                          index: i,
                          title: "AI Assistant that will\nallow you to make :",
                          subtitle: "",
                          image: "images/robot_hello.png",
                        ),
                        Stack(
                          children: [
                            LaunchingWidget(
                              index: i,
                              title: "Image\nTranscription",
                              subtitle:
                                  "Effortlessly convert image text into editable\nformat with the AI Assistant.",
                              image: "images/camera.png",
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 50.h),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  'images/robot_hi.png',
                                  width: 180.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            LaunchingWidget(
                              index: i,
                              title: "Add the\nVoyels",
                              subtitle:
                                  "Auto-enhance Arabic texts with vowels\nfor easier reading and pronunciation.",
                              image: "images/vowel.png",
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 50.h),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  'images/robot_hi.png',
                                  width: 180.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            LaunchingWidget(
                              index: i,
                              title: "Conjugate\nVerbs",
                              subtitle:
                                  "Instantly conjugate Arabic verbs with ease,\nsimplifying the mastery of different tenses.",
                              image: "images/conjugate.png",
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 50.h),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  'images/robot_hi.png',
                                  width: 180.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
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
            ),
            Button(
              onTap: () {
                if (i < 9) {
                  controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear);
                } else {
                  Get.to(
                    () => const OnBoarding10(),
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
                10,
                (index) => AnimatedContainer(
                  height: index == i ? 8.w : 7.w,
                  width: index == i ? 8.w : 7.w,
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
      ),
    );
  }
}

class LaunchingWidget extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  int index;

  LaunchingWidget({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      child: Column(
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
            textAlign: TextAlign.center,
            text: title,
          ),
          Subheading(
            textAlign: TextAlign.center,
            text: subtitle,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
