import 'package:flutter/material.dart';

class Reminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: SafeArea(
        child: Center(
          child: Icon(
              Icons.access_alarm,
            size: 120.0,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
