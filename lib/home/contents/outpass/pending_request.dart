import 'package:flutter/material.dart';
import 'check_op_status.dart';

class PendingRequest extends StatelessWidget {
  final String reason;
  final List<Map<String, dynamic>> requests;

  const PendingRequest({Key? key, required this.reason, required this.requests})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Pending Request'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: const Center(child: Text('No pending requests found.')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pending Request'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final data = requests[index];

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(236, 236, 236, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['reason'] ?? 'No Reason',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Date: ${data['date']?.toString() ?? 'N/A'}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      foregroundColor: Colors.white, // Text color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckOpStatus(
                            reason: data['reason'] ?? 'No Reason',
                            date: data['date'],
                            time: data['time'] ?? 'N/A',
                            type: data['type'] ?? 'N/A',
                            returnDate: data['returnDate'],
                            returnTime: data['returnTime'] ?? 'N/A',
                          ),
                        ),
                      );
                    },
                    child: const Text('Check Status'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
