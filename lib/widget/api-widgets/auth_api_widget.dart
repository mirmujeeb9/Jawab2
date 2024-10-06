import 'package:flutter/material.dart';
import 'package:jawab_io/services/APIs/auth_api.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String surname = '';
  String email = '';
  String password = '';
  String passwordConfirmation = '';
  String? affiliateCode;

  void register() async {
    final authApi = AuthApi('https://localhost/8000');

    if (_formKey.currentState!.validate()) {
      bool success = await authApi.register(
        name: name,
        surname: surname,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        affiliateCode: affiliateCode,
      );

      if (success) {
        // Handle successful registration (e.g., show a success message or navigate to another screen)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );
      } else {
        // Handle registration error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Surname'),
                onChanged: (value) => surname = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your surname' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) =>
                    value!.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)
                        ? 'Please enter a valid email'
                        : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => password = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a password' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (value) => passwordConfirmation = value,
                validator: (value) =>
                    value != password ? 'Passwords do not match' : null,
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Affiliate Code (optional)'),
                onChanged: (value) => affiliateCode = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: register,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
