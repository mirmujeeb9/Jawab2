import 'dart:convert';
import 'dart:developer';

import 'package:alxza/view/auth/signin/signin.dart';
import 'package:alxza/view/auth/signup/model.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import "../../../config.dart";

class SignUpContoller extends GetxController {
  static SignUpContoller get to => Get.find();
  final String baseUrl = Config.baseUrl;

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;
  bool confirmpassword = true;
  Rx<bool> loading = false.obs;
  void setloading(bool value) {
    loading.value = value;
  }

  void signup(SignupModel model) async {
    setloading(true);
    try {
      var response = await http.post(
        Uri.parse("${baseUrl}/auth/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model.toJson()),
      );
      log("Response status: ${response.statusCode}");
      log("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        setloading(false);
        Get.offAll(() => Signin_screen(), transition: Transition.leftToRight);
        showCustomSnackBar("Signup Successful!", isError: false);
      } else {
        setloading(false);
        print("Error Response: ${response.body}");
        showCustomSnackBar("Invalid Input: ${response.body}", isError: true);
      }
    } catch (e) {
      setloading(false);
      log("Signup Error: $e");
      showCustomSnackBar("An error occurred. Please try again later.",
          isError: true);
    }
  }
}
