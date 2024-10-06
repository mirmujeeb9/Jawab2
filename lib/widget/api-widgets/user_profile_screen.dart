import 'package:Jawab2/lib/services/APIs/user_service.dart';
import 'package:flutter/material.dart';
import 'package:jawab_io/services/APIs/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserService userService = UserService();
  String token = '';
  Map<String, dynamic> userProfile = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadToken();
  }

  // Load token from SharedPreferences
  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('auth_token') ?? '';
    });
    fetchUserProfile();
  }

  // Fetch user profile
  Future<void> fetchUserProfile() async {
    try {
      var data = await userService.getUserProfile(token);
      setState(() {
        userProfile = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching profile: $error');
    }
  }

  // Update user profile
  Future<void> updateUserProfile(Map<String, String> updatedData) async {
    try {
      var data = await userService.updateUserProfile(token, updatedData);
      setState(() {
        userProfile = data;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')));
    } catch (error) {
      print('Error updating profile: $error');
    }
  }

  // Delete user account
  Future<void> deleteUserAccount() async {
    try {
      await userService.deleteUserAccount(token);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account deleted successfully!')));
    } catch (error) {
      print('Error deleting account: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${userProfile['name'] ?? ''}'),
                  Text('Surname: ${userProfile['surname'] ?? ''}'),
                  Text('Phone: ${userProfile['phone'] ?? ''}'),
                  Text('Country: ${userProfile['country'] ?? ''}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      updateUserProfile({
                        'name': 'Updated Name',
                        'surname': 'Updated Surname',
                        'phone': '123456789',
                        'country': 'Updated Country',
                      });
                    },
                    child: Text('Update Profile'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: deleteUserAccount,
                    child: Text('Delete Account'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ),
    );
  }
}
