import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  final String baseUrl;

  AuthApi(this.baseUrl);

  Future<bool> register({
    required String name,
    required String surname,
    required String email,
    required String password,
    required String passwordConfirmation,
    String? affiliateCode,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'surname': surname,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'affiliate_code': affiliateCode,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true; // Registration successful
    } else {
      // Handle error
      print('Error: ${response.body}');
      return false; // Registration failed
    }
  }

  //further methods.

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['access_token']; // Return the token
    } else {
      throw Exception('Failed to log in');
    }
  }
}
