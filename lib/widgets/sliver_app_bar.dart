import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {

  const SliverAppBarWidget({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      forceElevated: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Parallax Effect',
        ),
        background: Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/moon.png"),
        ),
      ),
    );
  }
}
