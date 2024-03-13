import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailController extends GetxController {
  static CheckEmailController get to => Get.find();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  bool password = true;
}
