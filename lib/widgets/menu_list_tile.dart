import 'package:flutter/material.dart';
import 'package:flutterapplication/pages/gratitude.dart';
import 'package:flutterapplication/pages/remiders.dart';
import 'package:flutterapplication/pages/birthdays.dart';

class MenuListTileWidget extends StatefulWidget {
  @override
  _MenuListTileWidgetState createState() => _MenuListTileWidgetState();
}


class _MenuListTileWidgetState extends State<MenuListTileWidget> {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays'),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Birthdays()));
          },
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Gratitude'),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Gratitude()));
          },
        ),
        ListTile(
          leading: Icon(Icons.alarm),
          title: Text('Reminder'),
          onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Reminders()));
          },
        ),
        Divider(color: Colors.grey,),
        ListTile(
        )
      ],
    );
  }
}
