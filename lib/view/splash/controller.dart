import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/auth/signin/model.dart';
import 'package:alxza/view/home/home/home.dart';
import 'package:alxza/view/launch_screens/launch_pageview.dart';
import 'package:alxza/view/welcome/welcome.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class Splash_controller extends GetxController {
  static Splash_controller get to => Get.find();
  bool callfunction = false;
  Future splashgetintrovideo() async {
    videoPlayerController = VideoPlayerController.asset("images/IMG_3861.mp4")
      ..initialize().then(
        (_) {
          update();
          videoPlayerController!.setVolume(0.0);
          videoPlayerController!.play();
        },
      );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    videoPlayerController?.addListener(
      () async {
        if (videoPlayerController!.value.position >=
            videoPlayerController!.value.duration) {
          if (!callfunction) {
            callfunction = true;
            videoPlayerController!.pause();
            String? value = prefs.getString('token');
            if (value != null) {
              StaticData.token = value;
              getuser().then((value) {
                Get.offAll(() => const HomeScreen());
              });
            } else {
              if (prefs.getBool('firsttime') == null) {
                prefs.setBool('firsttime', true);
                Get.offAll(() => const LaunchPageView());
              } else {
                Get.offAll(() => const WelcomeScreen());
              }
            }
          }
        }
      },
    );
  }

  VideoPlayerController? videoPlayerController;

  Future getuser() async {
    var response = await http.get(
      Uri.parse("${StaticData.baseURL}${StaticData.profile}"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${StaticData.token}",
      },
    );
    log("get user respose is ${response.statusCode}");
    if (response.statusCode == 200) {
      StaticData.userModel = UserModel.fromJson(jsonDecode(response.body));
    }
  }
}
