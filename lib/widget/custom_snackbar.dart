import 'package:alxza/widget/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  if (message.isNotEmpty) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isError ? Colors.red : primaryColor,
      message: message,
      maxWidth: double.maxFinite,
      duration: const Duration(seconds: 4),
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(15),
      borderRadius: 10,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}
