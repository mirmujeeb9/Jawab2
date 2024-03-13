import 'package:alxza/view/auth/signin/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/customize_textform_feild.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  height: 180.h,
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
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),

                    // !Platform.isIOS
                    //     ? const SizedBox()
                    //     :
                    SizedBox(
                      height: 100.h,
                      width: 335.w,
                      child: Text(
                        "Sign in\nyour account",
                        style: TextStyle(
                            fontSize: 30.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 75.h,
                      width: 335.w,
                      child: Text(
                          "Alxza is an application that leverages\nadvanced natural language processing\ntechniques.",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: textgrey)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 335.w,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 330.w,
                      child: CustomTextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(128),
                        ],
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                          size: 20.sp,
                        ),
                        hint: "example@gmail.com",
                        fontFamily: 'Poppins',
                        controller: obj.emailcontroller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "please enter email";
                          }
                          // if (!obj.emailRegex.hasMatch(v)) {
                          //   return "Enter valid email";
                          // }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 335.w,
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
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(128),
                        ],
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.grey,
                          size: 20.sp,
                        ),
                        obsecure: password,
                        hint: "Enter password",
                        fontFamily: 'Poppins',
                        controller: obj.passwordcontroller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "please_enter_password";
                          }
                          if (v.length < 6) {
                            return "please up to 6 digits";
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 335.w,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
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
                      width: 335.w,
                      text: "Continue with Email",
                      fontsize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
