import 'package:flutter/cupertino.dart';
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
        title: Text('Images'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const OrientationLayoutIconsWidget(),
                      Divider(),
                      const GridViewWidget(),
                      Divider(),
                      const OrientationBuilderWidget(),
                    ]
                  )
              )
          )
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Container(
      alignment: Alignment.center,
      color: Colors.yellow,
      width: 100.0,
      height: 100.0,
      child: Text('Portrait'),
    ) : Container(
      alignment: Alignment.center,
      color: Colors.lightGreen,
      height: 100.0,
      width: 200.0,
      child: Text('Landscape'),
    ) ;
  }
}

class GridViewWidget extends StatelessWidget{
  const GridViewWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;

    return GridView.count(
      crossAxisCount: _orientation == Orientation.portrait ? 2 : 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 5.0,
      children: List.generate(8, (int index) {
        return Text(
          "Grid $index",
          textAlign: TextAlign.center,
        );
      }),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget{
  const OrientationBuilderWidget({Key key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation){
        return orientation == Orientation.portrait ?
            Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              height: 100.0,
              width: 100.0,
              child: Text('Portrait'),
            )
            : Container(
              alignment: Alignment.center,
              color: Colors.lightGreen,
              height: 100.0,
              width: 200.0,
              child: Text('LandScape'),
            );
      },
    );

  }
}