import 'package:alxza/view/home/security/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController oldPasswordcontroller = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmnewPasswordcontroller = TextEditingController();

  @override
  void dispose() {
    oldPasswordcontroller.dispose();
    newPasswordcontroller.dispose();
    confirmnewPasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<SecurityController>(builder: (obj) {
        return Form(
          key: formkey,
          child: SizedBox(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const CustomAppBar(
                      text: "Security",
                      leading: true,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        TextWidget(
                            text: "Change Password",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomContainer(
                      borderRadius: 20.r,
                      // height: 58.h,
                      width: 335.w,
                      color: primaryColor.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: SvgPicture.asset("images/info.svg"),
                            ),
                            Expanded(
                              child: TextWidget(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                text:
                                    "Leave empty if you don’t want to change your password.",
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                            text: "Old Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 335.w,
                      child: CustomTextFormField(
                        hintTextSize: 12.sp,
                        fontFamily: 'Poppins',
                        controller: oldPasswordcontroller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter old password";
                          }
                          if (v.length < 6) {
                            return "Please enter up to 6 digits";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                            text: "New Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 335.w,
                      child: CustomTextFormField(
                        hintTextSize: 12.sp,
                        fontFamily: 'Poppins',
                        controller: newPasswordcontroller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter new password";
                          }
                          if (v.length < 6) {
                            return "Please enter up to 6 digits";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        TextWidget(
                            text: "Confirm Your New Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 335.w,
                      child: CustomTextFormField(
                        hintTextSize: 12.sp,
                        fontFamily: 'Poppins',
                        controller: confirmnewPasswordcontroller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter confirm password";
                          }
                          if (v.length < 6) {
                            return "Please enter up to 6 digits";
                          }
                          if (newPasswordcontroller.text != v) {
                            return "Confirm password not match";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Button(
                      onTap: () {
                        if (formkey.currentState!.validate()) {}
                      },
                      width: 301.w,
                      text: "Save",
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
