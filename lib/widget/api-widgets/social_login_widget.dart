import 'package:flutter/material.dart';
import 'package:jawab_io/services/APIs/social_login_api.dart';

class SocialLoginWidget extends StatefulWidget {
  @override
  _SocialLoginWidgetState createState() => _SocialLoginWidgetState();
}

class _SocialLoginWidgetState extends State<SocialLoginWidget> {
  final SocialLoginApi _socialLoginApi = SocialLoginApi();

  Future<void> _handleGoogleLogin() async {
    String googleToken = 'YOUR_GOOGLE_TOKEN';
    String googleId = 'YOUR_GOOGLE_ID';

    try {
      var response = await _socialLoginApi.googleLogin(googleToken, googleId);
      // Handle successful response
      print('Login Successful: $response');
    } catch (e) {
      // Handle error
      print('Login Failed: $e');
    }
  }

  Future<void> _handleAppleLogin() async {
    String appleToken = 'YOUR_APPLE_TOKEN';
    String appleId = 'YOUR_APPLE_ID';

    try {
      var response = await _socialLoginApi.appleLogin(appleToken, appleId);
      // Handle successful response
      print('Login Successful: $response');
    } catch (e) {
      // Handle error
      print('Login Failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _handleGoogleLogin,
          child: Text('Login with Google'),
        ),
        ElevatedButton(
          onPressed: _handleAppleLogin,
          child: Text('Login with Apple'),
        ),
      ],
    );
  }
}
