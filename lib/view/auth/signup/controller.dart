import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpContoller extends GetxController {
  static SignUpContoller get to => Get.find();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;
  bool confirmpassword = true;
}
