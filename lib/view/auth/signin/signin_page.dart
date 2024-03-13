import 'package:alxza/view/auth/signin/controller.dart';
import 'package:alxza/view/auth/signup/signup.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Signin_screen extends StatefulWidget {
  const Signin_screen({super.key});

  @override
  State<Signin_screen> createState() => _Signin_screenState();
}

class _Signin_screenState extends State<Signin_screen> {
  bool password = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<signin_page_controller>(initState: (context) {
          Get.put(signin_page_controller());
        }, builder: (obj) {
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
                    Center(
                      child: Container(
                        height: 160.h,
                        width: 200.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'images/logo_yellow.png',
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15.h,
                    ),

                    // !Platform.isIOS
                    //     ? const SizedBox()
                    //     :
                    TextWidget(
                      text: "Sign in\nyour account",
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
                          padding: const EdgeInsets.all(10.0),
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
                            password = !password;
                            setState(() {});
                          },
                          child: Icon(
                            password
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
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                            width: 5.w,
                            height: 5.h,
                            image: const AssetImage("images/Lock.png"),
                          ),
                        ),
                        obsecure: password,
                        hint: "● ● ● ● ● ● ● ●",
                        hintTextSize: 12.sp,
                        fontFamily: 'Poppins',
                        controller: obj.passwordcontroller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please eneter password";
                          }
                          if (v.length < 6) {
                            return "Please enetr up to 6 digits";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Button(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          Get.to(() => const SignUpScreen(),
                              transition: Transition.rightToLeft);
                        }
                      },
                      // width: 335.w,
                      text: "Sign In",
                      fontsize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10.h,
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
                          fontSize: 13.sp,
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
                      height: 15.h,
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
                      height: 15.h,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            text: "Don’t have an account?",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const SignUpScreen(),
                                  transition: Transition.rightToLeft);
                            },
                            child: TextWidget(
                              text: "Sign Up",
                              color: primaryColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
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
