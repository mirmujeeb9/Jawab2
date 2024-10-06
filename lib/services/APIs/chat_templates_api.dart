// lib/api/chat_templates_api.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatTemplatesApi {
  static const String baseUrl = 'https://localhost/5500';

  // Fetch chat templates
  static Future<List<dynamic>> fetchChatTemplates(String token,
      {String? id}) async {
    final String url =
        id == null ? '$baseUrl/chat-templates' : '$baseUrl/chat-templates/$id';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load chat templates');
    }
  }

  // Update or create chat templates (PATCH request with form data)
  static Future<void> updateChatTemplate(
      Map<String, dynamic> templateData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chat-templates'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      },
      body: {
        ...templateData,
        '_method': 'PATCH', // Patch request method hidden in body
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update chat template');
    }
  }

  // Delete chat template by ID
  static Future<void> deleteChatTemplate(String id, String token) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/chat-templates/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete chat template');
    }
  }
}
