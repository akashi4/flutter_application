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
        bottom: PopupMenuButtonWidget(),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(onPressed: (){}, child: Text('Flag')),
                      Padding(padding: EdgeInsets.all(10),),
                      FlatButton(onPressed: (){}, child: Icon(Icons.flag),color: Colors.lightGreen, textColor: Colors.white,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(onPressed: (){},child: Text('Save'),),
                      Padding(padding: EdgeInsets.all(10)),
                      RaisedButton(onPressed: (){},child: Icon(Icons.save), color: Colors.lightGreen,)
                      //Button()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.flight), onPressed: (){}),
                      Padding(padding: EdgeInsets.all(10),),
                      IconButton(icon: Icon(Icons.flight), onPressed: (){}, iconSize: 42.0,color: Colors.grey, tooltip: 'Flight',),
                    ],
                  ),
                  const PopupMenuButtonWidget(),
                  const ButtonWidget(),
                  const ButtonBarWidget(),
                ],
              ),
            ),
          ),
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

class ButtonBarWidget extends StatelessWidget{
  const ButtonBarWidget({Key key}): super(key: key);

  Widget build(BuildContext context){
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.airport_shuttle), onPressed: (){}),
          IconButton(icon: Icon(Icons.map), onPressed: (){}),
          IconButton(icon: Icon(Icons.brush), onPressed: (){},highlightColor: Colors.purple,)
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget{
  const ButtonWidget({ Key key}): super(key: key);

  // Widget for a set of buttons

  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.all(16)),
            FlatButton(
              onPressed: (){},
              child: Text('Flag'),
            ),
            Padding(padding: EdgeInsets.all(16)),
            FlatButton(
              onPressed: (){},
              child: Icon(Icons.flag),
              color: Colors.lightGreen,
              textColor: Colors.white,
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(16)),
            RaisedButton(
                onPressed: (){},
                child: Text('Save'),
            ),
            Padding(padding: EdgeInsets.all(16)),
            RaisedButton(
                onPressed: (){},
                child: Icon(Icons.save),
                color: Colors.lightGreen,
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Padding(padding: EdgeInsets.all(16)),
            IconButton(icon: Icon(Icons.flight), onPressed: (){}),
            Padding(padding: EdgeInsets.all(16),),
            IconButton(icon: Icon(Icons.flight), onPressed: (){},iconSize: 42,color: Colors.lightGreen, tooltip: 'Flight'),
            Divider(),
          ],
        )
      ],
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

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({this.title, this.icon});

}

class PopupMenuButtonWidget extends StatelessWidget implements PreferredSizeWidget{
  const PopupMenuButtonWidget({ Key key }): super(key: key);

  Widget build(BuildContext context){
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
            icon: Icon(Icons.view_list),
            onSelected: ((valueSelected) { print('valueSelected : ${valueSelected.title}');}),
            itemBuilder: (BuildContext context){
              return foodMenuList.map((TodoMenuItem todoMenuItem){
                return PopupMenuItem<TodoMenuItem>(
                  value: todoMenuItem,
                  child: Row(
                    children: [
                      Icon(todoMenuItem.icon.icon),
                      Padding(padding: EdgeInsets.all(8),),
                      Text(todoMenuItem.title),
                    ],
                  ),
                );
              }).toList();
            }),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(75.0);
}

List <TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: 'Fast Food', icon: Icon(Icons.fastfood)),
  TodoMenuItem(title: 'Remind me', icon: Icon(Icons.add_alarm)),
  TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
  TodoMenuItem(title: 'Music', icon: Icon(Icons.audiotrack)),
];