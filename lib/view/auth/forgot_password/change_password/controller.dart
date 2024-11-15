import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get to => Get.find();

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool password = true;
  bool confirmpassword = true;
  bool check = false;
}
