import 'package:flutter/material.dart';

class SecurityApprovedPage extends StatelessWidget {
  const SecurityApprovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Access Granted'),
      ),
      body: Center(
        child: const Text(
          'You are allowed to leave.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
