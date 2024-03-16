import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Edit_profile_controller extends GetxController {
  static Edit_profile_controller get to => Get.find();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController locationconotroller = TextEditingController();
  TextEditingController boicontroller = TextEditingController();
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  File? image;
  void getImage({
    required ImageSource source,
  }) async {
    XFile? picker = await ImagePicker().pickImage(source: source);
    if (picker != null) {
      image = File(picker.path);
      update(['image']);
    }
  }
}
