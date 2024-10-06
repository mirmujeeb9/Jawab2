import 'package:http/http.dart' as http;
import 'dart:convert';

class SocialLoginApi {
  // Base API URL
  static const String baseUrl = 'https://localhost/8000';

  // Google Login API
  Future<Map<String, dynamic>> googleLogin(
      String googleToken, String googleId) async {
    final url = Uri.parse('${baseUrl}google-login');

    // Create request body
    var requestBody = {
      'google_token': googleToken,
      'google_id': googleId,
    };

    // Make POST request
    var response = await http.post(url, body: requestBody);

    // Check response status
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login with Google');
    }
  }

  // Apple Login API
  Future<Map<String, dynamic>> appleLogin(
      String appleToken, String appleId) async {
    final url = Uri.parse('${baseUrl}apple-login');

    // Create request body
    var requestBody = {
      'apple_token': appleToken,
      'apple_id': appleId,
    };

    // Make POST request
    var response = await http.post(url, body: requestBody);

    // Check response status
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login with Apple');
    }
  }
}
