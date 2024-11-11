import 'package:alxza/view/auth/signin/controller.dart';
import 'package:alxza/view/auth/signup/signup.dart';
import 'package:alxza/view/welcome/welcome_01.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/custom_container.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 150.h,
            ),
            Container(
              height: 157.h,
              width: 142.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'images/logo_yellow.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Heading(
                text: 'Welcome\non Jawab',
              ),
            ),
            Column(
              children: [
                Button(
                  onTap: () {
                    Get.to(
                      () => const Welcome01Screen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  width: 335.w,
                  text: "Sign In",
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Button(
                  color: primaryColor.withOpacity(0.2),
                  onTap: () {
                    Get.to(
                      () => const SignUpScreen(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  width: 335.w,
                  textColor: primaryColor,
                  text: "Sign Up",
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 1.h,
                  width: 100.w,
                  color: Colors.grey.shade300,
                ),
                const Subheading(
                  text: "Or continue with",
                ),
                Container(
                  height: 1.h,
                  width: 100.w,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainer(
                  onTap: () {
                    Signin_page_controller.to.signInWithGoogle(context);
                  },
                  height: 35.h,
                  width: 80.w,
                  borderColor: Colors.grey.shade300,
                  borderRadius: 50.r,
                  child: Center(
                    child: Image.asset(
                      "images/google.png",
                      height: 25.h,
                      width: 25.w,
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
                  onTap: () {
                    Signin_page_controller.to.signInWithFacebook();
                  },
                  height: 35.h,
                  width: 80.w,
                  borderColor: Colors.grey.shade300,
                  borderRadius: 50.r,
                  child: Center(
                    child: Image.asset(
                      "images/facebook.png",
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
