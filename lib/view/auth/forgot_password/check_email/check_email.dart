import 'package:alxza/view/auth/forgot_password/check_email/controller.dart';
import 'package:alxza/view/auth/forgot_password/otp/otp.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckEmailScreen extends StatefulWidget {
  String email;
  CheckEmailScreen({super.key, required this.email});

  @override
  State<CheckEmailScreen> createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  bool password = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<CheckEmailController>(
            initState: (context) {},
            builder: (obj) {
              return SizedBox(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80.h,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: 296.h,
                                width: 254.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      'images/robotthink.png',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 10.h,
                                width: 254.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      'images/elipse.png',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Heading(
                          text: "Check your email",
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Subheading(
                            text:
                                "We have sent a password recover instructions to your email.",
                            color: textgrey),
                        SizedBox(
                          height: 50.h,
                        ),
                        Button(
                          onTap: () {
                            
                            /*Get.to(
                              
                                () => OtpScreen(
                                      email: widget.email,
                                    ),
                                transition: Transition.rightToLeft);*/
                          },
                          text: "Open Email App",
                          fontWeight: FontWeight.w500,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Subheading(
                              text: "Skip, I’ll confirm later",
                              textAlign: TextAlign.center,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Did not receive the email? Check your Spam folder or ',
                                  style: TextStyle(
                                    color: textgrey,
                                    fontFamily: "Poppins",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                TextSpan(
                                  text: 'try another email address',
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  // Add onTap handler if needed
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.back();
                                    },
                                ),
                                // Add more TextSpan for additional text with different styles if needed
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
