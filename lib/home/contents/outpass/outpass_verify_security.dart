import 'package:flutter/material.dart';
import 'qr_scanner.dart';

class OutpassVerificationPage extends StatelessWidget {
  const OutpassVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Outpass Verification'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QRScannerPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Button color
            foregroundColor: Colors.white, // Text color
          ),
          child: const Text('Scan the QR'),
        ),
      ),
    );
  }
}
