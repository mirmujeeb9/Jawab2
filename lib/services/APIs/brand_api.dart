import 'dart:convert';

import 'package:http/http.dart' as http;

class BrandApi {
  static const baseUrl = 'https://localhost/5500';

  // Fetch companies
  static Future<List<dynamic>> fetchCompanies(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/brandvoice'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load companies');
    }
  }

  // Delete a company
  static Future<void> deleteCompany(String id, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/brandvoice/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete company');
    }
  }

  // Add or Update a company (POST request)
  static Future<void> addOrUpdateCompany(
      Map<String, dynamic> companyData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/brandvoice'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(companyData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save company');
    }
  }
}
