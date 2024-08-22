import 'package:flutter/material.dart';
import 'package:college_app/home/contents/outpass.dart';
import 'package:college_app/home/navbar/settings.dart';
import 'contents/attendance/attendance_details.dart';
import 'package:college_app/home/contents/announcements.dart';
import 'contents/appointment_ed.dart';
import 'contents/assignment_upload.dart';
import 'contents/leave_letter.dart';
import 'contents/study_materials.dart';
import 'contents/virtual_id_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class StudentHomePage extends StatelessWidget {
  final String personName;

  const StudentHomePage({
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
          buildStudentLayout(context),
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

  Widget buildStudentLayout(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContainerWithIconAndText(
                        'Study Materials',
                        'assets/icons/study.png',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StudyMaterialsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      _buildContainerWithIconAndText(
                        'Announcements',
                        'assets/icons/announcement.png',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnnouncementsPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContainerWithIconAndText(
                        'Attendance Details',
                        'assets/icons/attendance.png',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AttendanceDetailsPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      _buildContainerWithIconAndText(
                        'Assignment Upload',
                        'assets/icons/others.png',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AssignmentUploadPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContainerWithIconAndText(
                        'Outpass',
                        'assets/icons/outpass.webp',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Outpass()),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      _buildContainerWithIconAndText(
                        'Leave Letter',
                        'assets/icons/letter.webp',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LeaveLetterPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildContainerWithIconAndText(
                        'Appointment to ED',
                        'assets/icons/ed.webp',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AppointmentEDPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      _buildContainerWithIconAndText(
                        'Virtual ID Card',
                        'assets/icons/letter.webp',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VirtualIDCardPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainerWithIconAndText(
      String title, String iconPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
