import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cloud_queue),onPressed: (){},),
        ],
         ),
      body: _buildBody(),
    );
  }

  _buildBody(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildJournalHeaderImage(),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    _buildJournalEntry(),
                    Divider(),
                    _buildJournalWeather(),
                    Divider(),
                    _buildJournalTags(),
                    Divider(),
                    _buildJournalFooterImages()
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  _buildJournalHeaderImage(){
    return Image(
      fit: BoxFit.cover,
      image: AssetImage('assets/images/moon.png'),
    );
  }

  _buildJournalEntry(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My BirthDay',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(" It's going to be a great birthday. We are going out for dinner at my "
            " favorite place, then watch a movie after we go to the gelateria for ice cream"
            "and espresso",
        style: TextStyle(color: Colors.black54),
        )
      ],
    );
  }

  _buildJournalWeather(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.wb_sunny,color: Colors.orange,),
          ],
        ),
        SizedBox(width: 16.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '81º clear',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '4500, San Alpho Drive, Dallas, TX United States',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        )
      ],
    );
  }

  _buildJournalTags(){
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: TextStyle(fontSize: 10.0),
          ),
          avatar: Icon(Icons.card_giftcard, color: Colors.blue.shade300,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  _buildJournalFooterImages(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage("assets/images/hands.png"),
        ),
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage("assets/images/SNK.png"),
        ),
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage("assets/images/Naruto.png"),
        ),
        SizedBox(
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
            ],
          ),
        )
      ],
    );
  }
}
