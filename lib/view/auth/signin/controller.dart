import 'dart:convert';
import 'dart:developer';
import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/home/home/home.dart';
import 'package:alxza/view/splash/controller.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Signin_page_controller extends GetxController {
  static Signin_page_controller get to => Get.find();

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;

  Rx<bool> loading = false.obs;
  void setloading(bool value) {
    loading.value = value;
  }

  void signin({
    required String email,
    required String password,
  }) async {
    setloading(true);
    // Simulate a successful sign-in for now
    await Future.delayed(Duration(seconds: 2));
    setloading(false);
    Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
  }

  Future<void> saveUserSession(String token) async {
    StaticData.token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // Google Sign-In placeholder function
  Future<void> signInWithGoogle(context) async {
    setloading(true);
    try {
      // Placeholder for Google sign-in logic
      log("Google sign-in logic would go here.");
      setloading(false);
    } catch (e) {
      setloading(false);
      log("Error during Google sign-in: $e");
    }
  }

  // Facebook Sign-In placeholder function
  Future<void> signInWithFacebook() async {
    setloading(true);
    try {
      // Placeholder for Facebook sign-in logic
      log("Facebook sign-in logic would go here.");
      setloading(false);
    } catch (e) {
      setloading(false);
      log("Error during Facebook sign-in: $e");
    }
  }

  // Placeholder function for social login
  void sociallogin(String userId, String accessToken) async {
    var response = await http.post(
      Uri.parse("${StaticData.baseURL}${StaticData.googlelogin}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "google_token": accessToken,
        "google_id": userId,
      }),
    );
    log("response ${response.statusCode}");
    log("response ${response.body}");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      saveUserSession(data['access_token']);
      Splash_controller.to.getuser().then((value) {
        showCustomSnackBar("Successfully Signed In", isError: false);
        setloading(false);
        Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
      });
    } else {
      setloading(false);
      showCustomSnackBar("Invalid Credential", isError: true);
    }
  }
}
