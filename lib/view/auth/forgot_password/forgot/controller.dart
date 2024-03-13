import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  static ForgotController get to => Get.find();

  TextEditingController emailcontroller = TextEditingController();
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
}
