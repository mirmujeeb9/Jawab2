import 'dart:async';

import 'package:alxza/view/auth/forgot_password/change_password/change_password.dart';
import 'package:alxza/view/auth/forgot_password/otp/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  String email;
  OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;
  int timerSeconds = 60;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void sendVerificationCode(
    String email,
  ) async {}

  void resendCode() {
    otpController.clear();
    sendVerificationCode(widget.email);
    showCustomSnackBar("Code resend succesfully !");
    setState(() {
      timerSeconds = 60;
    });
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<OtpController>(
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
                        const CustomAppBar(
                          text: "Reset Password",
                          leading: true,
                        ),
                        SizedBox(
                          height: 100.h,
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
                                      'Please enter the verification code we sent to your email ',
                                  style: TextStyle(
                                    color: textgrey,
                                    fontFamily: "Poppins",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.email,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  // Add onTap handler if needed
                                  // recognizer: TapGestureRecognizer()..onTap = () {},
                                ),
                                // Add more TextSpan for additional text with different styles if needed
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 35.w,
                              right: 35.w,
                              top: 100.h,
                              bottom: 50.h),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 5,
                            animationType: AnimationType.fade,
                            autovalidateMode: AutovalidateMode.disabled,
                            pinTheme: PinTheme(
                              selectedColor: primaryColor,
                              selectedFillColor: Colors.white,
                              errorBorderColor: const Color(0xffE71616),
                              activeBorderWidth: 1.w,
                              inactiveBorderWidth: 1.w,
                              errorBorderWidth: 1.w,
                              inactiveColor: primaryColor.withOpacity(0.3),
                              inactiveFillColor: Colors.white,
                              activeColor: primaryColor,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(6.r),
                              fieldHeight: 50.h,
                              fieldWidth: 40.w,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: primaryColor,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            textStyle: TextStyle(
                              fontSize: 26.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            onChanged: (v) {},
                            onCompleted: (v) {},
                          ),
                        ),
                        // SizedBox(
                        //   height: 140.h,
                        // ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextWidget(
                                text: "Not yet get? ",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(() => const SignUpScreen(),
                                  //     transition: Transition.rightToLeft);
                                },
                                child: TextWidget(
                                  text: "Resend OTP",
                                  color: primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Button(
                          onTap: () {
                            if (otpController.text.length == 5) {
                              Get.to(() => const ChangePasswordScreen(),
                                  transition: Transition.rightToLeft);
                            } else {
                              errorController.add(ErrorAnimationType.shake);
                            }
                          },
                          text: "Verify",
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  // Get.to(() => const ChangePasswordScreen(),
                                  //     transition: Transition.rightToLeft);
                                },
                                child: TextWidget(
                                  text: timerSeconds < 60
                                      ? obj.formatTimer(timerSeconds)
                                      : obj.formatTimer(timerSeconds),
                                  color: primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextWidget(
                                text:
                                    timerSeconds < 60 ? "sec left" : "min left",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ],
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
