import 'package:flutter/material.dart';
import 'package:college_app/utils/credentials.dart'; // Ensure the path is correct
import 'package:shared_preferences/shared_preferences.dart';
import 'package:college_app/home/student_home.dart'; // Adjust path as needed
import 'package:college_app/home/faculty_home.dart'; // Adjust path as needed
import 'package:college_app/home/security_home.dart'; // Adjust path as needed
import 'package:college_app/home/staff_home.dart'; // Adjust path as needed

class LoginScreen extends StatefulWidget {
  final String selectedRole;

  const LoginScreen({super.key, required this.selectedRole});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // State to toggle password visibility

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      Map<String, Map<String, String>>? credentialsMap;

      // Select the appropriate credentials map based on the role
      switch (widget.selectedRole) {
        case 'Head of Department':
          credentialsMap = Credentials.headOfDepartmentCredentials;
          break;
        case 'Class Advisor':
          credentialsMap = Credentials.classAdvisorCredentials;
          break;
        case 'Subject Faculty':
          credentialsMap = Credentials.subjectFacultyCredentials;
          break;
        case 'Student':
          credentialsMap = Credentials.studentCredentials;
          break;
        case 'Security':
          credentialsMap = Credentials.securityCredentials;
          break;
        case 'Staff':
          credentialsMap = Credentials.staffCredentials;
          break;
        default:
          credentialsMap = null;
      }

      // Validate login credentials
      if (credentialsMap != null && credentialsMap.containsKey(email)) {
        final credentials = credentialsMap[email];
        if (credentials != null && credentials['password'] == password) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('personName', credentials['name']!);
          await prefs.setString('userRole', widget.selectedRole);

          // Navigate to the appropriate home page based on role
          Widget homePage;
          switch (widget.selectedRole) {
            case 'Head of Department':
              homePage = FacultyHomePage(
                personName: credentials['name']!,
                facultyRole: 'HOD',
              );
              break;
            case 'Class Advisor':
              homePage = FacultyHomePage(
                personName: credentials['name']!,
                facultyRole: 'Class Advisor',
              );
              break;
            case 'Subject Faculty':
              homePage = FacultyHomePage(
                personName: credentials['name']!,
                facultyRole: 'Subject Faculty',
              );
              break;
            case 'Student':
              homePage = StudentHomePage(
                personName: credentials['name']!,
              );
              break;
            case 'Security':
              homePage = SecurityHomePage(
                personName: credentials['name']!,
              );
              break;
            case 'Staff':
              homePage = StaffHomePage(
                personName: credentials['name']!,
              );
              break;
            default:
              throw Exception('Unknown role');
          }

          // Replace the current route instead of pushing a new one
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => homePage),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid email or password')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No account found for this email')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid details')),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: MediaQuery.of(context).viewInsets.bottom + 50,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Go Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Image.asset(
                  "assets/login/not_exist.png",
                  height: 150,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Welcome to SSCET APP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Login with your College Email and Password",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'College Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Please enter a password with at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
