import 'package:flutter/material.dart';

class AnimatedMoonWidget extends StatefulWidget {
  @override
  _AnimatedMoonWidgetState createState() => _AnimatedMoonWidgetState();
}

class _AnimatedMoonWidgetState extends State<AnimatedMoonWidget>
with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState(){
    _controller = AnimationController(duration: Duration(seconds: 4), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double _moonHeight = MediaQuery.of(context).size.height / 2;
    double _moonWidth = MediaQuery.of(context).size.width / 3;
    double _moonBottomLocation = MediaQuery.of(context).size.height -  _moonHeight;

    _animationFloatUp = Tween(begin: _moonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
     _animationGrowSize = Tween(begin: 50.0, end: _moonWidth).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(0.0, 0.5, curve: Curves.elasticInOut),
        )
    );

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child){
        return Container(
          child: child,
          margin: EdgeInsets.only(top: _animationFloatUp.value,),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: (){if (_controller.isCompleted) {
          _controller.reverse();
    }else{
          _controller.forward();
        }
        },
        child: Image.asset('assets/images/moon.png',height: _moonHeight,width: _moonWidth,),

      ),
    );
  }
}


