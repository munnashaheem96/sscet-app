import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'security/security_approved.dart'; // Import the SecurityApprovedPage

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String scanResult = "";

  Future<void> scanQRCode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      scanResult = result.rawContent;
    });

    // Check if the scanned result matches OP00001
    if (scanResult == 'OP00001') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecurityApprovedPage(),
        ),
      );
      // Display a tick mark when allowed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Row(
              children: const [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text('Access Granted'),
              ],
            ),
            content: const Text('You are allowed to leave.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Show denial message with an X mark
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              children: const [
                Icon(Icons.cancel, color: Colors.red),
                SizedBox(width: 8),
                Text('Access Denied'),
              ],
            ),
            content: const Text('You are not allowed to leave.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(scanResult.isNotEmpty ? scanResult : 'Scan a QR code'),
            ElevatedButton(
              onPressed: scanQRCode,
              child: const Text('Scan the QR'),
            ),
          ],
        ),
      ),
    );
  }
}
