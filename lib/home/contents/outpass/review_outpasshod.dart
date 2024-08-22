import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'approval_page_hod.dart';

class ReviewOutpassHODPage extends StatelessWidget {
  final String? reason;
  final DateTime date;
  final String time;
  final String type;
  final DateTime? returnDate;
  final String? returnTime;

  const ReviewOutpassHODPage({
    Key? key,
    required this.reason,
    required this.date,
    required this.time,
    required this.type,
    this.returnDate,
    this.returnTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Approve Outpasses'),
        automaticallyImplyLeading: true, // Remove the back arrow
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            buildOutpassCard(
              context,
              'Munna Shaheem P',
              'BE CSE 2023-27',
              reason!,
              DateFormat('yyyy-MM-dd').format(date),
              time,
              'OP000001',
            ),
            const SizedBox(height: 16),
            buildOutpassCard(
              context,
              'Muhammed Zidan VK',
              'BE CSE 2023-27',
              'Fever',
              '2024-08-22',
              '13:20',
              'OP000002',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOutpassCard(
    BuildContext context,
    String name,
    String course,
    String reason,
    String date,
    String time,
    String id,
  ) {
    return Container(
      width: 350,
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                course,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Reason : $reason',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Date of Leaving : $date',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Time of Leaving : $time',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // Background color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApprovalPageHOD(
                          id: id,
                          name: name,
                          course: course,
                          reason: reason,
                          date: date,
                          time: time,
                        ),
                      ),
                    );
                  },
                  child: const Text('View Request'),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: $id',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
