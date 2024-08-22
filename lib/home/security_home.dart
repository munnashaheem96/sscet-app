// security_home.dart
import 'package:flutter/material.dart';
import 'package:college_app/home/navbar/settings.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class SecurityHomePage extends StatelessWidget {
  final String personName;

  const SecurityHomePage({
    super.key,
    required this.personName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(context),
      backgroundColor: const Color(0xFFECECEC),
      body: Stack(
        children: [
          buildWelcomeText(),
          buildNotificationIcon(),
          // Implement Security Layout here
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 20,
          onTabChange: (index) {
            switch (index) {
              case 0:
                // Handle Home tab
                break;
              case 1:
                // Handle Favourite tab
                break;
              case 2:
                // Handle Search tab
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
                break;
            }
          },
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.favorite, text: 'Favourite'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.settings, text: 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget buildWelcomeText() {
    return Positioned(
      top: 70,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome,\n$personName',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationIcon() {
    return Positioned(
      top: 70,
      right: 25,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(141, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Icon(Icons.notifications_active, size: 28.0),
      ),
    );
  }
}
