import 'dart:convert';
import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ForgotController extends GetxController {
  static ForgotController get to => Get.find();

  TextEditingController emailController = TextEditingController();
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  // Method to send password reset email
  Future<void> sendResetLinkEmail() async {
    final email = emailController.text.trim();
    // Validate the email format before sending
    if (!emailRegex.hasMatch(email)) {
      Get.snackbar('Error', 'Please enter a valid email address.',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Send a POST request to Laravel API for sending password reset link
    try {
      print(email);
      final response = await http.post(
        Uri.parse(
            '${StaticData.mainURL}password/email'), // Replace with your API URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        // Display success message
        Get.snackbar('Success', 'Reset link sent to your email.',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        // Display error message from the backend
        final responseData = jsonDecode(response.body);
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Failed to send reset link.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Handle network or parsing errors
      Get.snackbar('Error', 'An error occurred. Please try again later.',
          snackPosition: SnackPosition.BOTTOM);
      print("Error: $e");
    }
  }
}
