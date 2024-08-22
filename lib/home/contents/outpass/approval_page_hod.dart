import 'package:flutter/material.dart';
import 'package:college_app/home/contents/outpass/hod/success_approved.dart';
import 'package:college_app/home/contents/outpass/hod/success_declined.dart';

class ApprovalPageHOD extends StatelessWidget {
  final String id;
  final String name;
  final String course;
  final String reason;
  final String date;
  final String time;

  const ApprovalPageHOD({
    Key? key,
    required this.id,
    required this.name,
    required this.course,
    required this.reason,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Outpass Details: $id'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 570,
          decoration: BoxDecoration(
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Column(
              children: [
                buildDetailContainer('Student Name', name),
                buildDetailContainer('Course', course),
                buildDetailContainer('Reason', reason),
                buildDetailContainer('Date of Leaving', date),
                buildDetailContainer('Time of Leaving', time),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showApprovalDialog(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      child: const Text("Approve"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showApprovalDialog(context, false);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("Decline"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailContainer(String title, String detail) {
    return Center(
      child: Container(
        width: 350,
        height: 70,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              detail,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showApprovalDialog(BuildContext context, bool isApprove) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            isApprove ? "Confirm Approval" : "Confirm Decline",
            style: const TextStyle(color: Colors.black),
          ),
          content: Text(
            isApprove
                ? "Are you sure you want to approve this outpass?"
                : "Are you sure you want to decline this outpass?",
            style: const TextStyle(color: Colors.black87),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => isApprove
                        ? const SuccessApprovedPage()
                        : const SuccessDeclinedPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isApprove ? Colors.black : Colors.red,
              ),
              child: Text(isApprove ? "Approve" : "Decline"),
            ),
          ],
        );
      },
    );
  }
}
