import 'package:flutter/material.dart';
import 'package:flutterapplication/widgets/stack.dart';
import 'package:flutterapplication/widgets/stack_favorite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
         ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 7,
            itemBuilder: (BuildContext context, int index){
              if (index.isEven){
                return const StackWidget();
              }
              else{
                return const StackFavoriteWidget();
              }
            }
        ),
      ),
    );
  }
}
