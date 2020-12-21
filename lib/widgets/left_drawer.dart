import 'package:flutter/material.dart';
import 'menu_list_tile.dart';


class LeftDrawerWidget extends StatelessWidget {

  const LeftDrawerWidget({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.face,
              size: 48.0,
              color: Colors.white,
            ),
              accountName: Text('ADD Akashi'),
              accountEmail: Text('akashi4@mail.com'),
            otherAccountsPictures: [
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Naruto kick.png'),
                fit: BoxFit.cover
              )
            ),
          ),
          MenuListTileWidget(),
        ],
      ),
    );
  }
}
