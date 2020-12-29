import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

 String _gestureDetected;
 Color _paintedColor;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gesture Detector',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(color: Colors.black, height: 44.0),
             _buildDraggable(),
              Divider(
                height: 44.0,
              ),
              _buildDragTarget(),
              Divider(
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        print('OnTap');
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        print('OnLongPress');
        _displayGestureDetected('onLongPress');
      },
      /*onPanUpdate: (DragUpdateDetails details) {
        print('OnPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },*/
      onVerticalDragUpdate: ((DragUpdateDetails details) {
        print('onVerticalDragUpdate: $details');
        _displayGestureDetected('onVerticalDragUpdate:\n$details');
      }),
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        print('onHorizontalDragUpdate: $details');
        _displayGestureDetected('onHorizontalDragUpdate:\n$details');
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        print('onHorizontalDragEnd: $details');
        if (details.primaryVelocity < 0) {
          print('Dragging right to Left: ${details.velocity}');
        } else if (details.primaryVelocity > 0) {
          print('Dragging Left to right: ${details.velocity}');
        }
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.access_alarm,size: 98.0,),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildDraggable(){
    return Draggable(
        child: Column(
          children: <Widget>[
            Icon(Icons.palette, color: Colors.deepOrange, size: 48.0,),
            Text('Drag Me below to change color')
          ],
        ),
        childWhenDragging: Icon(
          Icons.palette,
          color: Colors.grey,
          size: 48.0,
        ),
        feedback: Icon(
          Icons.brush,
          color: Colors.deepOrange,
          size: 80.0,
        ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget(){
   return DragTarget<int>(
       onAccept: (colorValue) {
         _paintedColor = Color(colorValue);
       },
       builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> rejectable) => acceptedData.isEmpty
       ?Text(
         'Drag To see color change',
         style: TextStyle(color: _paintedColor),
       )
           :Text(
         'painting Color: $acceptedData',
         style: TextStyle(color: Color(acceptedData[0]),
         fontWeight: FontWeight.bold
         ),
       )
   );
  }
}
