import 'package:flutter/material.dart';
import 'package:flutterapplication/widgets/sliver_app_bar.dart';
import 'package:flutterapplication/widgets/sliver_list.dart';
import 'package:flutterapplication/widgets/sliver_grid.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView - Slivers"),
        elevation: 0.0,
         ),
      body:CustomScrollView(
        slivers: [
          const SliverAppBarWidget(),
          const SliverListWidget(),
          const SliverGridWidget(),
        ],
      )
    );
  }
}
