import 'package:flutter/material.dart';
import 'package:flutterapplication/widgets/animated_container.dart';
import 'package:flutterapplication/widgets/animated_cross_fade.dart';
import 'package:flutterapplication/widgets/animated_opacity.dart';
import 'package:flutterapplication/widgets/animated_images.dart';
import 'package:flutterapplication/widgets/animated_image.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AnimatedMoonWidget()
                ],
              ),
            ),
          )
      ),
    );
  }
}
