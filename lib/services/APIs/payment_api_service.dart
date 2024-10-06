import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentApiService {
  final String baseUrl = "https://localhost/8000";

  // Get Current Plan
  Future<Map<String, dynamic>> getCurrentPlan(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get subscription plan');
    }
  }

  // Cancel Active Subscription
  Future<Map<String, dynamic>> cancelActiveSubscription(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/subscriptions/cancel-current"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 412) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to cancel subscription');
    }
  }

  // Get Plans
  Future<Map<String, dynamic>> getPlans(String token, [String? planId]) async {
    final String url =
        planId != null ? "$baseUrl/plans/$planId" : "$baseUrl/plans";
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
      throw Exception('Failed to get plans');
    }
  }

  // Get Orders
  Future<Map<String, dynamic>> getOrders(String token,
      [String? orderId]) async {
    final String url =
        orderId != null ? "$baseUrl/orders/$orderId" : "$baseUrl/orders";
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
      throw Exception('Failed to get orders');
    }
  }

  // Check RevenueCat Subscription Status
  Future<Map<String, dynamic>> checkRevenueCat(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/check-revenue-cat"),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to check RevenueCat subscription status');
    }
  }
}
