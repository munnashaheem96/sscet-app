import 'package:flutter/material.dart';

class AssignmentUploadPage extends StatelessWidget {
  const AssignmentUploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment Upload'),
      ),
      body: const Center(
        child: Text('Assignment Upload Content Here'),
      ),
    );
  }
}
