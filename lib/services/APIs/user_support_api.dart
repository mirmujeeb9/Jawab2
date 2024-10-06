// lib/api/support_api.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

class SupportApi {
  static const String baseUrl = 'https://localhost/5500';

  // Fetch all support requests
  static Future<List<dynamic>> fetchSupportRequests(String token,
      {int perPage = 10}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/support/?per_page=$perPage'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load support requests');
    }
  }

  // Fetch messages for a specific ticket
  static Future<List<dynamic>> fetchTicketMessages(
      String token, String ticketId,
      {int perPage = 10}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/support/ticket/$ticketId?per_page=$perPage'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load ticket messages');
    }
  }

  // Create a new support request
  static Future<void> createNewTicket(String token, String priority,
      String category, String subject, String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/support/new-ticket'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {
        'priority': priority,
        'category': category,
        'subject': subject,
        'message': message,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create new support request');
    }
  }

  // Send a message to a specific ticket
  static Future<void> sendMessageToTicket(
      String token, String ticketId, String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/support/send-message'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: {
        'ticket_id': ticketId,
        'message': message,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send message');
    }
  }
}
