import 'package:flutter/material.dart';
import 'package:college_app/login/login_screen.dart'; // Ensure this import is correct

class FacultyRoleSelectionPage extends StatelessWidget {
  const FacultyRoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add image at the top
                    Image.asset(
                      "assets/login/not_exist.png", // Replace with your image asset
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome To SSCET APP',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Select your Faculty Role',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    // Add Faculty role options here
                    _buildFacultyRoleContainer(
                        context, 'Head of Department', Icons.business),
                    _buildFacultyRoleContainer(
                        context, 'Class Advisor', Icons.person),
                    _buildFacultyRoleContainer(
                        context, 'Subject Faculty', Icons.library_books),
                  ],
                ),
              ),
            ),
          ),
          // Back button at the top left corner
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacultyRoleContainer(
      BuildContext context, String role, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Navigate to the login screen with the selected role
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(selectedRole: role),
          ),
        );
      },
      child: Container(
        width: 350,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                role,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
