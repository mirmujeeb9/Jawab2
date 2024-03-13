import 'package:alxza/view/auth/signin/signin.dart';
import 'package:alxza/view/auth/signup/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<SignUpContoller>(
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
                          height: 50.h,
                        ),
                        TextWidget(
                          text: "Sign up\nyour account",
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextWidget(
                            text:
                                "Alxza is an application that leverages\nadvanced natural language processing\ntechniques.",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: textgrey),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextWidget(
                            text: "Full Name",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          // width: 335.w,
                          child: CustomTextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(128),
                            ],
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image(
                                width: 5.w,
                                height: 5.h,
                                image: const AssetImage("images/person.png"),
                              ),
                            ),
                            hint: "Hasan Mahmud",
                            fontFamily: 'Poppins',
                            controller: obj.fullnamecontroller,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "Please enter Full Name";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextWidget(
                            text: "Email",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          // width: 335.w,
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
                          height: 20.h,
                        ),
                        TextWidget(
                            text: "Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          // width: 335.w,
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
                                return "Please enter password";
                              }
                              if (v.length < 6) {
                                return "Please enetr up to 6 digits";
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextWidget(
                            text: "Confirm Password",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          // width: 335.w,
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
                                return "Please enter confirm password";
                              }
                              if (v.length < 6) {
                                return "Please enetr up to 6 digits";
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
                            if (formkey.currentState!.validate()) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => HomePage(
                              //       ),
                              //     ));
                            }
                          },
                          // width: 335.w,
                          text: "Sign Up",
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1.h,
                              width: 100.w,
                              color: Colors.grey.shade300,
                            ),
                            TextWidget(
                              text: "Or continue with",
                              textAlign: TextAlign.center,
                              fontSize: 14.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                            Container(
                              height: 1.h,
                              width: 100.w,
                              color: Colors.grey.shade300,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomContainer(
                              height: 45.h,
                              width: 90.w,
                              borderColor: Colors.grey.shade300,
                              borderRadius: 50.r,
                              child: Center(
                                child: Image.asset(
                                  "images/google.png",
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ),
                            CustomContainer(
                              height: 45.h,
                              width: 90.w,
                              borderColor: Colors.grey.shade300,
                              borderRadius: 50.r,
                              child: Center(
                                child: Image.asset(
                                  "images/apple.png",
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ),
                            CustomContainer(
                              height: 45.h,
                              width: 90.w,
                              borderColor: Colors.grey.shade300,
                              borderRadius: 50.r,
                              child: Center(
                                child: Image.asset(
                                  "images/facebook.png",
                                  height: 30.h,
                                  width: 30.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextWidget(
                                text: "Already have an account?",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const Signin_screen(),
                                      transition: Transition.rightToLeft);
                                },
                                child: TextWidget(
                                  text: "Sign In",
                                  color: primaryColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
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
