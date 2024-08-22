import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'check_op_status.dart'; // Import the new page

class RequestSuccess extends StatelessWidget {
  final String reason;
  final DateTime? date;
  final String? time;
  final String? type;
  final DateTime? returnDate;
  final String? returnTime;

  const RequestSuccess({
    super.key,
    required this.reason,
    required this.date,
    required this.time,
    required this.type,
    required this.returnDate,
    required this.returnTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 16),
            const Text(
              'Your outpass request has been successfully submitted!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: [
                TableRow(
                  children: [
                    _buildTableCell('Reason for Leaving'),
                    _buildTableCell(reason),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('Date of Leaving'),
                    _buildTableCell(date != null
                        ? DateFormat('yyyy-MM-dd').format(date!)
                        : 'N/A'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('Time of Leaving'),
                    _buildTableCell(time ?? 'N/A'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildTableCell('Day Scholar or Hosteller'),
                    _buildTableCell(type ?? 'N/A'),
                  ],
                ),
                if (type == 'Hosteller') ...[
                  TableRow(
                    children: [
                      _buildTableCell('Return Date'),
                      _buildTableCell(returnDate != null
                          ? DateFormat('yyyy-MM-dd').format(returnDate!)
                          : 'N/A'),
                    ],
                  ),
                  TableRow(
                    children: [
                      _buildTableCell('Return Time'),
                      _buildTableCell(returnTime ?? 'N/A'),
                    ],
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOpStatus(
                        reason: reason,
                        date: date,
                        time: time,
                        type: type,
                        returnDate: returnDate,
                        returnTime: returnTime,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor:
                      const Color(0xFFECECEC),
                ),
                child: const Text('Check Status'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
