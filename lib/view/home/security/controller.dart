import 'package:alxza/utilis/static_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecurityController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> updatePassword(String oldPassword, String newPassword, String confirmNewPassword) async {
    isLoading.value = true;

    try {
      final response = await http.put(
        Uri.parse("${StaticData.mainURL}user/password"),
        headers: {
          "Authorization": "Bearer ${StaticData.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          'current_password': oldPassword,
          'new_password': newPassword,
          'new_password_confirmation': confirmNewPassword,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password updated successfully', snackPosition: SnackPosition.BOTTOM);
      } else {
        final errorData = jsonDecode(response.body);
        Get.snackbar('Error', errorData['message'] ?? 'Failed to update password', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
