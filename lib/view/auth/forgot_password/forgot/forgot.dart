import 'package:alxza/view/auth/forgot_password/check_email/check_email.dart';
import 'package:alxza/view/auth/forgot_password/forgot/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<ForgotController>(
            initState: (context) {},
            builder: (obj) {
              return SizedBox(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomAppBar(
                          text: "Forgot Password",
                          leading: true,
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Subheading(
                            text:
                                "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                            color: textgrey),
                        SizedBox(
                          height: 100.h,
                        ),
                        TextWidget(
                            text: "Email",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 335.w,
                          child: CustomTextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(128),
                            ],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image(
                                width: 5.w,
                                height: 5.h,
                                image: const AssetImage("images/email.png"),
                              ),
                            ),
                            hint: "example@gmail.com",
                            fontFamily: 'Poppins',
                            controller: obj.emailcontroller,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please enter email";
                              }
                              if (!obj.emailRegex.hasMatch(v)) {
                                return "Please enter valid email";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Button(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              Get.to(
                                  () => CheckEmailScreen(
                                        email: obj.emailcontroller.text,
                                      ),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          text: "Send",
                          fontWeight: FontWeight.w500,
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
