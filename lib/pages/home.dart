import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'remiders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex;
  List _listPages = List();
  Widget _currentPage;

  _changePage (int index){
    setState(() {
      _currentIndex = index;
      _currentPage = _listPages[index];
    });
  }

  @override
  void initState(){
    super.initState();
    _listPages..add(Birthdays())..add(Gratitude())..add(Reminders());
    _currentPage = Birthdays();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: SafeArea(
       child: Padding(
         padding: EdgeInsets.all(16.0),
         child: _currentPage,
       )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.cake,),
              label: 'Birtdays'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sentiment_satisfied,),
              label: 'Gratitude'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm,),
              label: 'Reminders'
          )
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pause),
        onPressed: () => {print('nothing')},
      ),
    );
  }
}
