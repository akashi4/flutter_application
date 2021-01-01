import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplication/classes/Trip.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List _trips = List<Trip>();

  @override
  void initState() {
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cacun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
    super.initState();
  }

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
      body: ListView.builder(
          itemCount: _trips.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(_trips[index].id),
              child: _buildListTile(index),
              background: _buildCompleteTrip(),
              secondaryBackground: _buildRemoveTrip(),
              onDismissed: (DismissDirection direction){
                direction == DismissDirection.startToEnd
                    ? _markTripCompleted() : _deletedTrip();
                setState(() {
                  _trips.removeAt(index);
                });
              },
            );
          }),
    );
  }

  void _markTripCompleted() {
    //mark trip compeleted in database or web service
  }

  void _deletedTrip() {
    //delete trip from database or webservice
  }

  ListTile _buildListTile(int index){
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text(_trips[index].tripLocation),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip(){
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.done,
              color: Colors.white
            )
          ],
        ),
      ),
    );

  }

  Container _buildRemoveTrip(){
    return Container(
      color: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
