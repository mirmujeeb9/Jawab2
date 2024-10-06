import 'package:flutter/material.dart';
import 'package:jawab_io/services/APIs/payment_api_service.dart';

class CurrentPlanScreen extends StatefulWidget {
  final String token;

  const CurrentPlanScreen({Key? key, required this.token}) : super(key: key);

  @override
  _CurrentPlanScreenState createState() => _CurrentPlanScreenState();
}

class _CurrentPlanScreenState extends State<CurrentPlanScreen> {
  late Future<Map<String, dynamic>> _currentPlanFuture;
  final PaymentApiService _paymentApiService = PaymentApiService();

  @override
  void initState() {
    super.initState();
    _currentPlanFuture = _paymentApiService.getCurrentPlan(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Plan"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _currentPlanFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No active subscription found"));
          } else {
            final currentPlan = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Plan ID: ${currentPlan['id']}"),
                  Text("Plan Name: ${currentPlan['name']}"),
                  Text("Price: \$${currentPlan['price']}"),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
