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
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
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
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(onPressed: null, child: Text('Flag')),
                      FlatButton(onPressed: null, child: Icon(Icons.flag),color: Colors.lightGreen, textColor: Colors.white,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(onPressed: null,child: Text('Save'),),
                      Padding(padding: EdgeInsets.all(10)),
                      RaisedButton(onPressed: null,child: Icon(Icons.save), color: Colors.lightGreen,)
                      //Button()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.flight), onPressed: null),
                      Padding(padding: EdgeInsets.all(10),),
                      IconButton(icon: Icon(Icons.flight), onPressed: null, iconSize: 42.0,color: Colors.white, tooltip: 'Flight',),
                    ],
                  )
                ],
              ),
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,
      ),
      bottomNavigationBar: const bottomNavBarWidget(),
    );
  }
}

class bottomNavBarWidget extends StatelessWidget{
  const bottomNavBarWidget({
    Key key,
}): super(key: key);

  Widget build(BuildContext context){
    return BottomAppBar(
     // hasNotch: true,
      color: Colors.lightGreen.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.pause),
          Icon(Icons.stop),
          Icon(Icons.access_time),
          Padding(padding: EdgeInsets.all(35))
        ],
      ),
    );
  }
}

