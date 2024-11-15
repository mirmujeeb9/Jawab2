import 'dart:convert';

import 'package:http/http.dart' as http;

class ExtensionsApi {
  static const String baseUrl = 'https://localhost/5500';

  // Fetch installed extensions
  static Future<List<dynamic>> fetchInstalledExtensions(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/extensions'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load installed extensions');
    }
  }
}
