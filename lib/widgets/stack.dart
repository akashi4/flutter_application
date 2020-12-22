import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage("assets/images/moon.png")),
        Positioned(
            bottom: 10.0,
            left: 10.0,
            child: CircleAvatar(
              radius: 48.0,
              backgroundImage: AssetImage("assets/images/naruto_kick.png"),
            )
        ),
        Positioned(
          bottom: 0.0,
            right: 0.0,
            child: Text(
                'Naruto',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white30,
                  fontWeight:FontWeight.bold
              ),
            )
        )
      ],
    );
  }
}
