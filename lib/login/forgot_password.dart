// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'package:college_app/login/login_screen.dart'; // Import the LoginScreen

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      // Here you would typically send the email to your backend to process the password reset
      print('Password reset link sent to: $email');
      
      // Show a dialog or snackbar to notify the user that a reset link has been sent
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset link has been sent to $email')),
      );
    }
  }

  void _navigateBack() {
    Navigator.pop(context); // Navigate back to the previous screen (LoginScreen)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 25, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align to the top left
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back), // Use arrow_back icon for consistency
                    onPressed: _navigateBack, // Set onPressed to navigate back
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Adjust the image size to match LoginScreen
                    Image.asset(
                      'assets/login/marketing-badge.png.webp',
                      width: 200, // Set the width of the image
                      height: 200, // Set the height of the image
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Enter your email address to recover your password.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Color(0xFFDBD3D3),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF000000),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _submit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
