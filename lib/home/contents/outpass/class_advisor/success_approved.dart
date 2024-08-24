import 'package:flutter/material.dart';
import 'package:college_app/home/faculty_home.dart';

class SuccessApprovedPage extends StatelessWidget {
  final String personName;
  final String facultyRole;

  const SuccessApprovedPage({
    Key? key,
    required this.personName,
    required this.facultyRole,
  }) : super(key: key);

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
                    builder: (context) => FacultyHomePage(
                      personName: personName,
                      facultyRole: facultyRole,
                    ),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Back to Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
