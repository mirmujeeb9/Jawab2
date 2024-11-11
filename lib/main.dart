import 'package:alxza/view/splash/splash.dart';
import 'package:alxza/widget/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:alxza/view/home/home/controller.dart';
import 'package:alxza/view/home/menue/ai_assistant_/controller.dart';
import 'package:alxza/view/home/menue/advanced_dictionary/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  Get.put(AdvanceDictionaryController());
  Get.put(HomeController());
  Get.put(AiAssistentController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
          home: const MyCustomSplashScreen(),
        );
      },
    );
  }
}
