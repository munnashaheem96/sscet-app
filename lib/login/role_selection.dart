import 'package:flutter/material.dart';
import 'package:college_app/login/login_screen.dart';
import 'package:college_app/login/roleselection/faculty_role_selection_page.dart'; // Import the new FacultyRoleSelectionPage
import 'package:college_app/Components/color.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  void _navigateToLogin(BuildContext context, String role) {
    if (role == 'Faculty') {
      // Navigate to the FacultyRoleSelectionPage if Faculty is selected
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FacultyRoleSelectionPage(),
        ),
      );
    } else {
      // For other roles, navigate to the LoginScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(
            selectedRole: role,
          ),
        ),
      );
    }
  }

  Widget _buildRoleContainer(BuildContext context, String role, IconData icon) {
    return GestureDetector(
      onTap: () => _navigateToLogin(context, role),
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
              color: primaryColor,
              size: 30,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                role,
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                  'Select your Role',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildRoleContainer(context, 'Student', Icons.school),
                _buildRoleContainer(context, 'Faculty', Icons.person),
                _buildRoleContainer(context, 'Security', Icons.security),
                _buildRoleContainer(context, 'Staff', Icons.work),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
