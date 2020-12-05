import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: null)
        ],
        flexibleSpace: SafeArea(
          child: Container(
            child: IconButton(
              icon: Icon(Icons.photo_camera),
              iconSize: 75.0,
              color: Colors.white70,
              onPressed: null,
            ),
            margin: EdgeInsets.fromLTRB(0 , 0, 0, 20.0),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
          preferredSize: Size.fromHeight(75.0),
        ),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ContainerWithBoxDecorationWidget(),
            ],
          ),
        ),
      )
      ),
    );
  }
}
class ContainerWithBoxDecorationWidget extends StatelessWidget{
  const ContainerWithBoxDecorationWidget({
    Key key,
}): super(key: key);

  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
          gradient : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.lightGreen.shade500,
            ]
          ),
            boxShadow: [
              BoxShadow(
                color:  Colors.grey,
                blurRadius: 10,
                offset: Offset(0,10)
              )
            ]
          ),
          child: Center(
            child: RichText(
                text: TextSpan(
                    text: 'Flutter World',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.deepPurple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.deepPurpleAccent,
                    decorationStyle: TextDecorationStyle.dotted,
                    fontWeight: FontWeight.normal,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' for',
                    ),
                    TextSpan(
                      text: ' Mobile',
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ]
                ),
            ),
          ),
        ),
      ],
    );
  }
}
