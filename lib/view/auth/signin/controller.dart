import 'dart:convert';
import 'dart:developer';

import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/home/home/home.dart';
import 'package:alxza/view/splash/controller.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    var response = await http.post(
        Uri.parse("${StaticData.baseURL}${StaticData.login}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}));
    log("response of login ${response.body}");
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      saveUserSession(data["token"]);
      Splash_controller.to.getuser().then((value) {
        showCustomSnackBar("Succesfully Sign In", isError: false);
        setloading(false);
        Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
      });
    } else {
      setloading(false);
      showCustomSnackBar("Invalid Credentials", isError: true);
    }
  }

  Future<void> saveUserSession(String token) async {
    StaticData.token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  GoogleSignIn googleSignIn = GoogleSignIn();

  Future signInWithGoogle(
    context,
  ) async {
    setloading(true);
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount == null) {
      googleSignIn.signOut();
      setloading(false);
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? loginUser = authResult.user;
        if (loginUser != null) {
          UserInfo? userInfo = loginUser.providerData.isNotEmpty
              ? loginUser.providerData[0]
              : null;

          if (userInfo != null) {
            String? displayName = userInfo.displayName;
            String? email = userInfo.email;

            log("Display Name: $displayName");
            log("Email: $email");
            log("accessToken: ${credential.accessToken!}");

            sociallogin(
              loginUser.uid,
              credential.accessToken!,
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        setloading(false);
        if (e.code == 'account-exists-with-different-credential') {
        } else if (e.code == 'invalid-credential') {}
      }
    }
  }

// facebook

  Future signInWithFacebook() async {
    setloading(true);

    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ["email", "public_profile"]);
      if (loginResult.status == LoginStatus.success) {
        final AccessToken accessToken = loginResult.accessToken!;

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        log("accessToken ${accessToken.token}");

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          log("displayName ${userCredential.user!.displayName}");
          log("email ${userCredential.user?.providerData[0].email}");
          log("phoneNumber ${userCredential.user?.providerData[0].phoneNumber}");

          String? email = userCredential.user?.providerData[0].email;
          String? username = userCredential.user!.displayName;

          sociallogin(
            userCredential.user!.uid,
            accessToken.token,
          );
        } else {
          setloading(false);
        }
      } else {
        setloading(false);
      }
    } on FirebaseAuthException catch (e) {
      setloading(false);
      print('Firebase Auth Exception: ${e.message}');
    } catch (e) {
      setloading(false);
      print('Other Exception: $e');
    }
  }

  void sociallogin(
    String userId,
    String accesTokan,
  ) async {
    var response = await http.post(
      Uri.parse("${StaticData.baseURL}${StaticData.googlelogin}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        {
          "google_token": accesTokan,
          "google_id": userId,
        },
      ),
    );
    log("response  ${response.statusCode}");
    log("response  ${response.body}");
    if (response.statusCode == 200) {
      googleSignIn.signOut();

      var data = jsonDecode(response.body);

      saveUserSession(data['access_token']);
      Splash_controller.to.getuser().then((value) {
        showCustomSnackBar("Succesfully Sign In", isError: false);
        setloading(false);
        Get.offAll(() => HomeScreen(), transition: Transition.leftToRight);
      });
    } else {
      setloading(false);
      showCustomSnackBar("Invalid Credential", isError: true);
    }
  }
}
