// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
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
                    children: const [
                      Text('Munna Shaheem P',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        'BE CSE 2023-27',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Reason : Going To Native',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Date of Leaving : 2024-08-22',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Time of Leaving : 13:10',
                        style: TextStyle(
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
                            // Add your onPressed logic here
                          },
                          child: const Text('View Request'),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'ID: OP000001',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
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
                    children: const [
                      Text('Muhammed Zidan VK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        'BE CSE 2023-27',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Reason : Fever',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Date of Leaving : 2024-08-22',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Time of Leaving : 13:20',
                        style: TextStyle(
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
                            // Add your onPressed logic here
                          },
                          child: const Text('View Request'),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'ID: OP000002',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
