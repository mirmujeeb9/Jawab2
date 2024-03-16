import 'package:alxza/view/auth/forgot_password/change_password/controller.dart';
import 'package:alxza/view/auth/forgot_password/check_email/controller.dart';
import 'package:alxza/view/auth/forgot_password/forgot/controller.dart';
import 'package:alxza/view/auth/forgot_password/otp/controller.dart';
import 'package:alxza/view/auth/signup/controller.dart';
import 'package:alxza/view/home/edit_profile/controller.dart';
import 'package:alxza/view/home/folder/controller.dart';
import 'package:alxza/view/home/history/controller.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/payment_method/controller.dart';
import 'package:alxza/view/home/profile.dart/controller.dart';
import 'package:alxza/view/home/upgrade_to_pro/controller.dart';
import 'package:alxza/view/splash/controller.dart';
import 'package:alxza/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({super.key});

  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen> {
  @override
  void initState() {
    Get.put(Splash_controller());
    Get.put(SignUpContoller());
    Get.put(ForgotController());
    Get.put(CheckEmailController());
    Get.put(OtpController());
    Get.put(HomeController());
    Get.put(Upgrade_to_pro_Controller());
    Get.put(ChangePasswordController());
    Get.put(PaymentController());
    Get.put(HistoryController());
    Get.put(FolderController());
    Get.put(ProfileController());
    Get.put(Edit_profile_controller());
    Splash_controller.to.splashgetintrovideo();

    super.initState();
  }

  @override
  void dispose() {
    Splash_controller.to.videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Splash_controller.to.videoPlayerController == null
            ? const SizedBox()
            // Center(
            //     child: CircularProgressIndicator(
            //       color: primaryColor,
            //     ),
            //   )
            : VideoPlayer(Splash_controller.to.videoPlayerController!),
      ),
    );
  }
}
