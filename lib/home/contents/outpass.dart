import 'package:flutter/material.dart';
import 'package:college_app/home/contents/outpass/request_new_op.dart';
import 'package:college_app/home/contents/outpass/pending_request.dart';
import 'package:college_app/home/contents/outpass/approved_request.dart'; // Import ApprovedRequest

class Outpass extends StatelessWidget {
  const Outpass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Request Outpass',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildContainerWithImage(
                  context, 'Request New Outpass', const RequestNewOutpass()),
              const SizedBox(height: 10),
              buildContainerWithImage(
                context,
                'Pending Request',
                const PendingRequest(
                  reason: '', requests: [], // No need to pass sample data
                ),
              ),
              const SizedBox(height: 10),
              buildContainerWithImage(
                context,
                'Approved Request',
                ApprovedRequest(
                  reason: 'Outpass reason', // Example placeholder data
                  date: DateTime.now(), // Example placeholder data
                  time: '10:00 AM', // Example placeholder data
                  type: 'Hosteller', // Example placeholder data
                  returnDate: DateTime.now()
                      .add(Duration(days: 1)), // Example placeholder data
                  returnTime: '6:00 PM', // Example placeholder data
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainerWithImage(BuildContext context, String text,
      [Widget? targetPage]) {
    return GestureDetector(
      onTap: targetPage != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetPage),
              );
            }
          : null,
      child: Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(236, 236, 236, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/icons/outpasscontent.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 150,
              top: 75,
              right: 10,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
