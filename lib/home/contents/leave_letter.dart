import 'package:flutter/material.dart';

class LeaveLetterPage extends StatelessWidget {
  const LeaveLetterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Letter'),
      ),
      body: const Center(
        child: Text('Leave Letter Content Here'),
      ),
    );
  }
}
