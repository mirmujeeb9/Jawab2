import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityController extends GetxController {
  static SecurityController get to => Get.find();
  TextEditingController oldPasswordcontroller = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmnewPasswordcontroller = TextEditingController();
}
