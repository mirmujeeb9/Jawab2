import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api';

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token']; // assuming the token is returned as `token`
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<Map<String, dynamic>> getUserData(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<Map<String, dynamic>> createUser(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(
          '$baseUrl/createUser'), // Replace with the actual signup endpoint
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Parsing JSON response
      return json.decode(response.body);
    } else if (response.statusCode == 422) {
      // Handling validation errors
      throw Exception('Validation Error: ${response.body}');
    } else {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }
}
