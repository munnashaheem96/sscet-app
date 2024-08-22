// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:college_app/home/contents/outpass/requested_success.dart';
import 'review_outpasshod.dart';
import 'package:college_app/models/outpass_request_model.dart';

class RequestNewOutpass extends StatefulWidget {
  const RequestNewOutpass({super.key});

  @override
  _RequestNewOutpassState createState() => _RequestNewOutpassState();
}

class _RequestNewOutpassState extends State<RequestNewOutpass> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();
  final TextEditingController _returnTimeController = TextEditingController();

  String? _selectedType;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  DateTime? _selectedReturnDate;
  TimeOfDay? _selectedReturnTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Request New Outpass'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
        child: Column(
          children: [
            Image.asset(
              'assets/icons/outpasssend.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _reasonController,
                      decoration: const InputDecoration(
                        labelText: 'Reason For Leaving',
                        border: OutlineInputBorder(),
                      ),
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a reason for leaving';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Date of Leaving',
                        border: OutlineInputBorder(),
                      ),
                      cursorColor: Colors.black,
                      onTap: _selectDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _timeController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Time of Leaving',
                        border: OutlineInputBorder(),
                      ),
                      cursorColor: Colors.black,
                      onTap: _selectTime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a time';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Day Scholar or Hosteller',
                        border: OutlineInputBorder(),
                      ),
                      value: _selectedType,
                      items: const [
                        DropdownMenuItem(
                          value: 'Day Scholar',
                          child: Text('Day Scholar'),
                        ),
                        DropdownMenuItem(
                          value: 'Hosteller',
                          child: Text('Hosteller'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Day Scholar or Hosteller';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    if (_selectedType == 'Hosteller') ...[
                      TextFormField(
                        controller: _returnDateController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Return Date',
                          border: OutlineInputBorder(),
                        ),
                        cursorColor: Colors.black,
                        onTap: _selectReturnDate,
                        validator: (value) {
                          if (_selectedType == 'Hosteller' &&
                              (value == null || value.isEmpty)) {
                            return 'Please select a return date';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _returnTimeController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Return Time',
                          border: OutlineInputBorder(),
                        ),
                        cursorColor: Colors.black,
                        onTap: _selectReturnTime,
                        validator: (value) {
                          if (_selectedType == 'Hosteller' &&
                              (value == null || value.isEmpty)) {
                            return 'Please select a return time';
                          }
                          return null;
                        },
                      ),
                    ],
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      onPressed: _submitForm,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            hintColor: Colors.black,
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            hintColor: Colors.black,
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> _selectReturnDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            hintColor: Colors.black,
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedReturnDate = pickedDate;
        _returnDateController.text =
            DateFormat('yyyy-MM-dd').format(_selectedReturnDate!);
      });
    }
  }

  Future<void> _selectReturnTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            hintColor: Colors.black,
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        _selectedReturnTime = pickedTime;
        _returnTimeController.text = pickedTime.format(context);
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final request = OutpassRequest(
        reason: _reasonController.text,
        date: _selectedDate,
        time: _selectedTime != null ? _selectedTime!.format(context) : null,
        type: _selectedType,
        returnDate: _selectedReturnDate != null ? _selectedReturnDate : null,
        returnTime: _selectedReturnTime != null
            ? _selectedReturnTime!.format(context)
            : null,
        submittedAt: DateTime.now(),
      );

      // Navigate to ReviewOutpassHODPage with the input data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewOutpassHODPage(
            reason: request.reason,
            date: request.date!,
            time: request.time!,
            type: request.type!,
            returnDate: request.returnDate,
            returnTime: request.returnTime,
          ),
        ),
      );
    }
  }
}
