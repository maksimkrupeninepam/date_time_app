import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date and Time App',
      home: DateTimeDisplay(),
    );
  }
}

class DateTimeDisplay extends StatefulWidget {
  @override
  _DateTimeDisplayState createState() => _DateTimeDisplayState();
}

class _DateTimeDisplayState extends State<DateTimeDisplay> {
  String _dateTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _updateDateTime() {
    final String formattedDateTime =
        DateTime.now().toLocal().toString().split('.').first;
    setState(() {
      _dateTime = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Date and Time'),
      ),
      body: Center(
        child: Text(
          _dateTime,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
