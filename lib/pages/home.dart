import 'package:flutter/material.dart';
import 'package:flutterapplication/widgets/header.dart';
import 'package:flutterapplication/widgets/row_with_card.dart';
import 'package:flutterapplication/widgets/row.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, index) {
              if (index == 0) {
                return HeaderWidget(index: index);
              } else if (index >= 1 && index <= 3) {
                return RowWithCardWidget(index: index);
              } else {
                return RowWidget(index: index);
              }
            }
            ),
      ),
    );
  }
}
