import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://localhost/8000';

  Future<Map<String, dynamic>> getUserProfile(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/auth/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }

  Future<Map<String, dynamic>> updateUserProfile(
      String token, Map<String, String> updatedData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        ...updatedData,
        '_method': 'PATCH',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update profile');
    }
  }

  Future<void> deleteUserAccount(String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/auth/profile'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete account');
    }
  }
}
