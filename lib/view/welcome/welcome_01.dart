import 'package:alxza/view/auth/signin/signin.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Welcome01Screen extends StatefulWidget {
  const Welcome01Screen({super.key});

  @override
  State<Welcome01Screen> createState() => _Welcome01ScreenState();
}

class _Welcome01ScreenState extends State<Welcome01Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 150.h,
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
                CustomButtonWidget(
                  apple: false,
                  text: "Connect with Google",
                  onTap: () {},
                  imagePath: "images/google.png",
                ),
                SizedBox(
                    height:
                        // Platform.isIOS ?
                        20.h
                    //  : 0,
                    ),
                // !Platform.isIOS
                //     ? const SizedBox()
                //     :
                CustomButtonWidget(
                  apple: true,
                  text: "Connect with Apple",
                  onTap: () {},
                  imagePath: "images/apple.png",
                ),

                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50.h),
                  child: Button(
                    onTap: () {
                      Get.to(() => const Signin_screen(),
                          transition: Transition.rightToLeft);
                    },
                    width: 335.w,
                    text: "Continue with Email",
                    fontWeight: FontWeight.w500,
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
