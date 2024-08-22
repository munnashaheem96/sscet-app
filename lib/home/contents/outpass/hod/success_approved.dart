import 'package:flutter/material.dart';
import 'package:college_app/home/contents/outpass/review_outpasshod.dart';

class SuccessApprovedPage extends StatelessWidget {
  const SuccessApprovedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Outpass Successfully Approved',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ReviewOutpassHODPage(
                      reason: "Reason", // Placeholder or use actual data
                      date: DateTime.now(), // Placeholder or use actual data
                      time: "Time", // Placeholder or use actual data
                      type: "Type", // Placeholder or use actual data
                    ),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
