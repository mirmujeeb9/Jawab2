import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/home/home/home.dart';
import 'package:alxza/view/splash/controller.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "../../../config.dart";

class Signin_page_controller extends GetxController {
  static Signin_page_controller get to => Get.find();

  static final baseUrl = Config.baseUrl;

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;

  Rx<bool> loading = false.obs;

  // GoogleSignIn instance
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'], // Request user email and profile
    clientId: Platform.isIOS
        ? 'YOUR_IOS_CLIENT_ID.apps.googleusercontent.com' // iOS Client ID
        : '861279474684-2u03htd3mkql01mg43rkobm3gs1rlj32.apps.googleusercontent.com', // Android Client ID
  );

  void setloading(bool value) {
    loading.value = value;
  }

  /// Email and Password Sign-In
  void signin({
    required String email,
    required String password,
  }) async {
    setloading(true);
    try {
      // API call for email/password login (replace with your login API logic)
      var response = await http.post(
        Uri.parse("${StaticData.baseURL}${StaticData.login}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      log("Response Status: ${response.statusCode}");
      log("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        saveUserSession(data['access_token']);
        Splash_controller.to.getuser().then((value) {
          showCustomSnackBar("Successfully Signed In", isError: false);
          Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
        });
      } else {
        showCustomSnackBar("Invalid Email or Password", isError: true);
      }
    } catch (e) {
      log("Error during sign-in: $e");
      showCustomSnackBar("An error occurred. Try again.", isError: true);
    } finally {
      setloading(false);
    }
  }

  /// Google Sign-In
  Future<void> signInWithGoogle() async {
    setloading(true);
    try {
      // Trigger the Google Sign-In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User cancelled the sign-in process
        log("Google Sign-In cancelled by user");
        setloading(false);
        return;
      }

      // Get Google authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Retrieve Google ID and token
      final String? googleId = googleUser.id;
      final String? googleToken = googleAuth.accessToken;

      if (googleId != null && googleToken != null) {
        // Call the sociallogin function with Google details
        sociallogin(
            provider: "google", userId: googleId, accessToken: googleToken);
      } else {
        log("Failed to retrieve Google token or ID.");
        showCustomSnackBar("Google Sign-In failed. Try again.", isError: true);
      }
    } catch (e) {
      log("Error during Google Sign-In: $e");
      showCustomSnackBar("Google Sign-In error: $e", isError: true);
    } finally {
      setloading(false);
    }
  }

  /// Social Login for Multiple Providers (Google, Facebook, etc.)
  void sociallogin({
    required String provider, // e.g., "google", "facebook"
    required String userId,
    required String accessToken,
  }) async {
    setloading(true);
    try {
      var response = await http.post(
        Uri.parse(
            "$baseUrl/auth/${provider}-login"), // Dynamic route based on provider
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "${provider}_token": accessToken,
          "${provider}_id": userId,
        }),
      );

      log("Response from $provider login: ${response.statusCode}");
      log("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        saveUserSession(data['access_token']);
        Splash_controller.to.getuser().then((value) {
          showCustomSnackBar("Successfully Signed In with $provider",
              isError: false);
          Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
        });
      } else {
        showCustomSnackBar("Invalid Credentials for $provider login",
            isError: true);
      }
    } catch (e) {
      log("Error during $provider login: $e");
      showCustomSnackBar("An error occurred during $provider login",
          isError: true);
    } finally {
      setloading(false);
    }
  }

  /// Save User Session Locally
  Future<void> saveUserSession(String token) async {
    StaticData.token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
