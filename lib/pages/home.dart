import 'package:flutter/material.dart';
import 'about.dart';
import 'gratitude.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//initialisation de _howAreYou
  String _howAreYou = '...';

  void _openPageAbout({BuildContext context, bool fullscreenDialog = true}) {
    //direction vers la page About
    Navigator.push(context, MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      )
    );
  }

  void _openPageGratitude(
      //direction la page Gratitude en attente du retour d'une valeur en async
      //tout en transmettant la valeur dans le constructeur
      {BuildContext context, bool fullscreenDialog = true}) async {
    final String _gratitudeResponse = await Navigator.push(context,

        MaterialPageRoute(
            fullscreenDialog: fullscreenDialog,
            builder: (context) =>
                Gratitude(
                  radioGroupValue: -1,
                )
        )
    );
    setState(() {
      _howAreYou = _gratitudeResponse ?? '';//verifie que le retour n'est pas vide
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => _openPageAbout(
                context: context,
                fullscreenDialog: true,
              ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              'Grateful for $_howAreYou',
              style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}
