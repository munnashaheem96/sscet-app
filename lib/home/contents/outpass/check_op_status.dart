import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckOpStatus extends StatelessWidget {
  final String reason;
  final DateTime? date;
  final String? time;
  final String? type;
  final DateTime? returnDate;
  final String? returnTime;

  const CheckOpStatus({
    Key? key,
    required this.reason,
    required this.date,
    required this.time,
    required this.type,
    required this.returnDate,
    required this.returnTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Text(
          'Outpass Status',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Details Containers
            _buildDetailContainer('Reason for Leaving', reason),
            _buildDetailContainer('Date of Leaving',
                date != null ? DateFormat('yyyy-MM-dd').format(date!) : 'N/A'),
            _buildDetailContainer('Time of Leaving', time ?? 'N/A'),
            _buildDetailContainer('Day Scholar or Hosteller', type ?? 'N/A'),
            if (type == 'Hosteller') ...[
              _buildDetailContainer(
                  'Return Date',
                  returnDate != null
                      ? DateFormat('yyyy-MM-dd').format(returnDate!)
                      : 'N/A'),
              _buildDetailContainer('Return Time', returnTime ?? 'N/A'),
            ],
            const SizedBox(height: 16),
            // Status Containers
            _buildStatusContainer('Request Submitted', true),
            _buildStatusContainer('Waiting for Class Advisor Approval', false),
            _buildStatusContainer('Waiting for HOD Approval', false),
            _buildStatusContainer('Waiting for Principal Approval', false),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusContainer(String status, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            status,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailContainer(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
