import 'package:flutter/material.dart';

class VirtualIDCardPage extends StatelessWidget {
  const VirtualIDCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual ID Card'),
      ),
      body: const Center(
        child: Text('Virtual ID Card Content Here'),
      ),
    );
  }
}
