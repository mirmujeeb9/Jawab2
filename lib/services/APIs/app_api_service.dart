import 'dart:convert';

import 'package:http/http.dart' as http;

class AppApiService {
  final String baseUrl = "https://localhost/8000";

  // Get Email Confirmation Setting
  Future<Map<String, dynamic>> getEmailConfirmationSetting(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/email-confirmation-setting"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get email confirmation setting');
    }
  }

  // Get Application Settings
  Future<Map<String, dynamic>> getAppSettings(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/get-setting"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get app settings');
    }
  }

  // Get Usage Data
  Future<Map<String, dynamic>> getUsageData(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/usage-data"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get usage data');
    }
  }

  // Get Currency
  Future<Map<String, dynamic>> getCurrency(String token, [String? id]) async {
    final String url =
        id != null ? "$baseUrl/currency/$id" : "$baseUrl/currency";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('No currency found');
    } else {
      throw Exception('Failed to get currency');
    }
  }

  // Get Logo
  Future<String> getLogo(String token) async {
    final response = await http.get(
      Uri.parse("https://your-api-url.com/api/auth/logo"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception('No logo found');
    } else {
      throw Exception('Failed to get logo');
    }
  }
}
