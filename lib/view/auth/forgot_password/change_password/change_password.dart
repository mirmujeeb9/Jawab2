import 'package:alxza/view/auth/forgot_password/change_password/controller.dart';
import 'package:alxza/view/auth/forgot_password/verified/verified_screen.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_appbar.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<ChangePasswordController>(
            initState: (context) {},
            builder: (obj) {
              return SingleChildScrollView(
                child: SizedBox(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomAppBar(
                          text: "Create Password",
                          leading: true,
                        ),
                        const Spacer(),
                        Heading(
                          text: "Create your\nnew password",
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextWidget(
                            text: "New Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 335.w,
                          child: CustomTextFormField(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obj.password = !obj.password;
                                setState(() {});
                              },
                              child: Icon(
                                obj.password
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                                size: 20.sp,
                              ),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(128),
                            ],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image(
                                width: 5.w,
                                height: 5.h,
                                image: const AssetImage("images/Lock.png"),
                              ),
                            ),
                            obsecure: obj.password,
                            hint: "● ● ● ● ● ● ● ●",
                            hintTextSize: 12.sp,
                            fontFamily: 'Poppins',
                            controller: obj.passwordcontroller,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please enter new password";
                              }
                              if (v.length < 6) {
                                return "Please enetr up to 6 digits";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextWidget(
                            text: "Confirm Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 335.w,
                          child: CustomTextFormField(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obj.confirmpassword = !obj.confirmpassword;
                                setState(() {});
                              },
                              child: Icon(
                                obj.confirmpassword
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                                size: 20.sp,
                              ),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(128),
                            ],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image(
                                width: 5.w,
                                height: 5.h,
                                image: const AssetImage("images/Unlock.png"),
                              ),
                            ),
                            obsecure: obj.confirmpassword,
                            hint: "● ● ● ● ● ● ● ●",
                            hintTextSize: 12.sp,
                            fontFamily: 'Poppins',
                            controller: obj.confirmpasswordcontroller,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please eneter confirm password";
                              }
                              if (v.length < 6) {
                                return "Please enetr up to 6 digits";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            GetBuilder<ChangePasswordController>(
                                id: 'check',
                                builder: (check) {
                                  return Checkbox(
                                    side: const BorderSide(color: Colors.grey),
                                    activeColor: primaryColor,
                                    value: check.check,
                                    onChanged: (bool? value) {
                                      check.check = value!;
                                      check.update(['check']);
                                    },
                                  );
                                }),
                            Subheading(
                              text: "remember me",
                              color: textgrey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Button(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              Get.to(() => const VerifiedScreen(),
                                  transition: Transition.rightToLeft);
                            }
                          },
                          text: "Change",
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 50.h,
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
