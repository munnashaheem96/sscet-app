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
      appBar: AppBar(
        title: const Text('Approve Outpasses'),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 150,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Munna Shaheem',
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
                'Date of Leavng : 2024-08-22',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Time of Leavng : 13:10',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
