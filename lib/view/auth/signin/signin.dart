import 'package:alxza/view/auth/forgot_password/forgot/forgot.dart';
import 'package:alxza/view/auth/signin/controller.dart';
import 'package:alxza/view/auth/signup/signup.dart';
import 'package:alxza/view/home/home/home.dart';
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
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: GetBuilder<Signin_page_controller>(initState: (context) {
          Get.put(Signin_page_controller());
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
                        height: 120.h,
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
                    Heading(
                      text: "Sign in\nyour account",
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Subheading(
                      text:
                          "Jawab is an application that leverages\nadvanced natural language processing\ntechniques.",
                      color: textgrey,
                    ),
                    SizedBox(
                      height: 20.h,
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
                      height: 15.h,
                    ),
                    TextWidget(
                        text: "Password",
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
                            return "Please enter password";
                          }
                          if (v.length < 6) {
                            return "Please enter up to 6 digits";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    TextButton(
                      onPressed: () {
                        Get.to(() => const ForgotScreen(),
                            transition: Transition.rightToLeft);
                      },
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
                      height: 5.h,
                    ),
                    Button(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          Get.offAll(() => const HomeScreen(),
                              transition: Transition.rightToLeft);
                        }
                      },
                      width: 335.w,
                      text: "Sign In",
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
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomContainer(
                          height: 35.h,
                          width: 80.w,
                          borderColor: Colors.grey.shade300,
                          borderRadius: 50.r,
                          child: Center(
                            child: Image.asset(
                              "images/google.png",
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                        // CustomContainer(
                        //   height: 45.h,
                        //   width: 90.w,
                        //   borderColor: Colors.grey.shade300,
                        //   borderRadius: 50.r,
                        //   child: Center(
                        //     child: Image.asset(
                        //       "images/apple.png",
                        //       height: 30.h,
                        //       width: 30.w,
                        //     ),
                        //   ),
                        // ),
                        CustomContainer(
                          height: 35.h,
                          width: 80.w,
                          borderColor: Colors.grey.shade300,
                          borderRadius: 50.r,
                          child: Center(
                            child: Image.asset(
                              "images/facebook.png",
                              height: 20.h,
                              width: 20.w,
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
                          const Subheading(
                            text: "Don’t have an account?",
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
                            child: Subheading(
                              text: "Sign Up",
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
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
