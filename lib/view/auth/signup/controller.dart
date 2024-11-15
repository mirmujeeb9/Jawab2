import 'dart:convert';
import 'dart:developer';

import 'package:alxza/utilis/static_data.dart';
import 'package:alxza/view/auth/signin/signin.dart';
import 'package:alxza/view/auth/signup/model.dart';
import 'package:alxza/widget/custom_snackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpContoller extends GetxController {
  static SignUpContoller get to => Get.find();

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;
  bool confirmpassword = true;
  Rx<bool> loading = false.obs;

  void setloading(bool value) {
    loading.value = value;
  }

  void signup(SignupModel model) async {
    setloading(true);
    var response = await http.post(
      Uri.parse("${StaticData.mainURL}createUser"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(model.toJson()),
    );
    log("response of signup ${response.statusCode}");

    if (response.statusCode == 201) {
      setloading(false);
      Get.offAll(() => Signin_screen(), transition: Transition.leftToRight);
    } else if (response.statusCode == 422) {
      setloading(false);
      var errorData = jsonDecode(response.body);
      showCustomSnackBar(errorData.toString(), isError: true);
    } else {
      setloading(false);
      showCustomSnackBar("An unexpected error occurred", isError: true);
    }
  }
}
