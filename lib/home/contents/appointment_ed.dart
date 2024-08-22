import 'package:flutter/material.dart';

class AppointmentEDPage extends StatelessWidget {
  const AppointmentEDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment to ED'),
      ),
      body: const Center(
        child: Text('Appointment to ED Content Here'),
      ),
    );
  }
}
