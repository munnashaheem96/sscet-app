import 'package:flutter/material.dart';

class StudyMaterialsPage extends StatelessWidget {
  const StudyMaterialsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Materials'),
      ),
      body: const Center(
        child: Text('Study Materials Content Here'),
      ),
    );
  }
}
