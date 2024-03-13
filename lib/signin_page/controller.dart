import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signin_page_controller extends GetxController {
  static signin_page_controller get to => Get.find();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool password = true;
}
