import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;


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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //_transformScaleAndTranslate(),
          _transformMatrix4(),
          _positionedInkWellAndInkResponse(context),
          _positionedStatusBar(context),
        ],
      ),
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
    );
  }

  Transform _transformScaleAndTranslate() {
    return Transform.scale(
        child: Transform.translate(
          offset: _currentOffset,
          child: Image(
            image: AssetImage('assets/images/moon.png'),
          ),
        ),
        scale: _currentScale
    );
  }

  Transform _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image(
        image: AssetImage('assets/images/Naruto.png'),
      ),
    );
  }

  Positioned _positionedStatusBar(BuildContext context) {
    return Positioned(
      top: 0.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Container(
        color: Colors.white54,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Scale: ${_currentScale.toStringAsFixed(4)}'),
            Text('Current: $_currentOffset')
          ],
        ),
      ),
    );
  }

  _positionedInkWellAndInkResponse(BuildContext context){
    return Positioned(
      top:50.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(
                  Icons.touch_app,
                  size: 32.0,
                ),
              ),
              splashColor: Colors.lightGreenAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            ),
            InkResponse(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(Icons.touch_app,size: 32.0,),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            )
          ],
        ),
      ),
    );
  }

  void _setScaleSmall(){
    setState(() {
      _currentScale = 0.5;
    });
  }

  void _setScaleBig(){
    setState(() {
      _currentScale = 16.0;
    });
  }
  //TODO translation isn't working
  void _onScaleStart(ScaleStartDetails details) {
    print('ScaleStartDetails: $details');

    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print('ScaleUpdateDetails: $details - Scale: ${details.scale}');

    if (details.scale != 1.0) {
      //Scalling
      double currentScale = _lastScale * details.scale;
      if (currentScale < 0.5) {
        _currentScale = 0.5;
      }
      setState(() {
        _currentScale = currentScale;
      });
      print('_scale: $_currentScale -  _lastScale: $_lastScale');
    } else if (details.scale == 1.0) {
      //We are not scalling but dragging around screen
      //Calculate offset depending on current Image Scaling.

      Offset offsetAdjustedForScale = (_startLastOffset - _lastOffset) /
          _lastScale;
      Offset currentOffset = details.focalPoint - (offsetAdjustedForScale *
          _currentScale);
      setState(() {
        _currentOffset = _currentOffset;
      });
      print(
          'offsetAjustedForscale: $offsetAdjustedForScale - _currentOffset:'
              ' $_currentOffset');
    }
  }

  void _onDoubleTap() {
    print('onDoubleTap');
    //Calculate current scale and populate the _lastScale with currentScale
    // if currentScale is greater than 16 times the original image, reset scale to default, 1.0
    //TODO voir pourquoi il faut deux onTap avant changement
    double currentScale = _lastScale * 2.0;
    if (_currentScale > 16.0) {
      currentScale = 1.0;
      _resetToDefaultValues();
    }
    setState(() {
      _currentScale = currentScale;
    });
    _lastScale = _currentScale;

    print('$_currentScale');
    print('$currentScale');
  }

  void _onLongPress() {
    print('onLongPressed');

    setState(() {
      _resetToDefaultValues();
    });
  }

  void _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }

}

