import 'package:flutter/material.dart';
import 'menu_list_tile.dart';

class RightDrawerWidget extends StatefulWidget {
  @override
  _RightDrawerWidgetState createState() => _RightDrawerWidgetState();
}

class _RightDrawerWidgetState extends State<RightDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.face,
                size: 128.0,
                color: Colors.white54,
              ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          MenuListTileWidget()
        ],
      ),
    );
  }
}
