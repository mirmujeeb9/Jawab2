import 'dart:async';

import 'package:alxza/view/auth/forgot_password/change_password/controller.dart';
import 'package:alxza/view/auth/forgot_password/check_email/controller.dart';
import 'package:alxza/view/auth/forgot_password/forgot/controller.dart';
import 'package:alxza/view/auth/forgot_password/otp/controller.dart';
import 'package:alxza/view/auth/signup/controller.dart';
import 'package:alxza/view/launch_screens/launch_pageview.dart';
import 'package:alxza/view/splash/controller.dart';
import 'package:alxza/view/welcome/welcome.dart';
import 'package:alxza/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({super.key});

  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;
  bool notificationinfo = false;
  AnimationController? _controller;
  Animation<double>? animation1;

  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _scaleAnimation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    Get.put(Splash_controller());
    Get.put(SignUpContoller());
    Get.put(ForgotController());
    Get.put(CheckEmailController());
    Get.put(OtpController());
    Get.put(ChangePasswordController());

    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller!.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration.zero, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString('token');
      prefs.clear();
      if (value != null) {
        // StaticData.token = value;
        // getuser();
        Future.delayed(
          const Duration(seconds: 5),
          () {
            // Get.offAll(() => const HomeScreen());
          },
        );
      } else {
        Future.delayed(
          const Duration(seconds: 5),
          () {
            if (prefs.getBool('firsttime') == null) {
              prefs.setBool('firsttime', true);
              Get.offAll(() => const LaunchPageView());
            } else {
              Get.offAll(() => const WelcomeScreen());
            }
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SizedBox(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  opacity: _containerOpacity,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: ScreenUtil().screenHeight * 0.8 / _containerSize,
                    width: ScreenUtil().screenWidth * 0.8 / _containerSize,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/logo.png'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
