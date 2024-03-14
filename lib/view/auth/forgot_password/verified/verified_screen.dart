import 'package:alxza/view/auth/forgot_password/otp/controller.dart';
import 'package:alxza/widget/button.dart';
import 'package:alxza/widget/colors.dart';
import 'package:alxza/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifiedScreen extends StatefulWidget {
  const VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<OtpController>(
          initState: (context) {},
          builder: (obj) {
            return SizedBox(
              height: ScreenUtil().screenHeight,
              width: ScreenUtil().screenWidth,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Center(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r)),
                      child: Container(
                        height: 460.h,
                        width: 335.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 213.h,
                                  width: 213.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        'images/robotchai.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 10.h,
                                  width: 213.w,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        'images/elipse.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextWidget(
                              text: "Congratulation",
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            TextWidget(
                                text:
                                    'Your account is reedy to use. You will be\n redirected to the home page in a\n few seconds',
                                fontSize: 14.sp,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w400,
                                color: textgrey),
                            Button(
                              onTap: () {},
                              text: "Back to Home",
                              width: 240.w,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
