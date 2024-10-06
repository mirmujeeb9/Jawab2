import 'package:alxza/services/APIs/app_api_service.dart';
import 'package:flutter/material.dart';
//import 'package:jawab_io/services/APIs/app_api_service.dart';

class EmailConfirmationSettingScreen extends StatefulWidget {
  final String token;

  const EmailConfirmationSettingScreen({Key? key, required this.token})
      : super(key: key);

  @override
  _EmailConfirmationSettingScreenState createState() =>
      _EmailConfirmationSettingScreenState();
}

class _EmailConfirmationSettingScreenState
    extends State<EmailConfirmationSettingScreen> {
  late Future<Map<String, dynamic>> _emailConfirmationFuture;
  final AppApiService _appApiService = AppApiService();

  @override
  void initState() {
    super.initState();
    _emailConfirmationFuture =
        _appApiService.getEmailConfirmationSetting(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Confirmation Setting"),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _emailConfirmationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No setting found"));
          } else {
            final emailConfirmation = snapshot.data!['emailconfirmation'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Email Confirmation Required: ${emailConfirmation ? 'Yes' : 'No'}"),
            );
          }
        },
      ),
    );
  }
}
