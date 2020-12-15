import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key key}): super(key: key);

  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {

  double _height = 100.0;
  double _width = 100.0;
  Color _color;

  _increseWidth(){
    setState(() {
      _width = _width >= 350.0? 100.0 :  _width += 30.0;
      if (_width < 150.0){ _color = Colors.green;}
      else
        if(_width < 200.0 && _width > 150.0) { _color = Colors.amber;}
      else
        if( _width > 200.0 && _width < 250.0){ _color = Colors.yellowAccent;}
      else
        if(_width < 300 && _width > 250){ _color = Colors.orange;}
        else
        if (_width > 300.0){ _color = Colors.redAccent;}

    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          color: _color,
          height: _height,
          width: _width,
          child: FlatButton(
            child: Text('Tap to \nGrow wight\n$_width'),
            onPressed: () {_increseWidth();},
          ),
        )
      ],
    );
  }
}
