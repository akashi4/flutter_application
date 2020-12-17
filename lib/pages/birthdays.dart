import 'package:flutter/material.dart';

class Birthdays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(
            Icons.cake,
            size: 120.0,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
