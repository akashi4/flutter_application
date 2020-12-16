import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  Gratitude({Key key, @required this.radioGroupValue}): super(key: key);

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String>_gratitudeList = List();
  String _selectedGratitude;
  int _radioGroupValue;

  _radioOnChanged(int index){
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('_selectedRadioValue $_selectedGratitude');
    });
  }

  @override
  void initState(){
    //fonction comprise dans le cycle de vie du widget
    super.initState();
    _gratitudeList..add('Family')..add('Friends')..add('Coffee');// rempli la liste a chaque demarrage
    _radioGroupValue = widget.radioGroupValue;// recupere la valeur venu de home.dart lors du changement de page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio(
                  value: 0,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index)
              ),
              Text('Family'),
              Radio(
                  value: 1,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index)
              ),
              Text('Friends'),
              Radio(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text('Coffee')
            ],
          ),
        ),
      ),
    );
  }
}
