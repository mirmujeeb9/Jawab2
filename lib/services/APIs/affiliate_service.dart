import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AffiliateService {
  // Base URL for your Laravel API
  final String baseUrl = 'https://localhost/8000';

  // Get affiliate info
  Future<Map<String, dynamic>> getAffiliateInfo(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/affiliates'),
      headers: {
        'Authorization':
            'Bearer $token', // Add the token to the Authorization header
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch affiliate info');
    }
  }

  // Login to get a token
  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['access_token']; // Return the token
    } else {
      throw Exception('Failed to log in');
    }
  }

  // Store the token
  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'auth_token', token); // Store the token in SharedPreferences
  }

  // Logout and remove token
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token'); // Remove the token from SharedPreferences
  }
}
