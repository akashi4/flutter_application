import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapplication/classes/Database.dart';
import 'package:intl/intl.dart';

class EditEntry extends StatefulWidget {
  //variables that would come from another pages
  //
  final bool add;
  final int index;
  final JournalEdit journalEdit;

  const EditEntry({Key key, this.add,
    this.index, this.journalEdit}) : super(key: key);

  @override
  _EditEntryState createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {

  JournalEdit _journalEdit;
  String _title;
  DateTime _selectedDate;
  // TextField always need a controller
  TextEditingController _moodController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  FocusNode _moodFocus = FocusNode();
  FocusNode _noteFocus = FocusNode();

  @override
  void initState() {
    //initialisation of data
    //something has to been shown anyway
    super.initState();
    _journalEdit = JournalEdit(action:'cancel',
        journal: widget.journalEdit.journal);
    _title = widget.add? 'Add': 'Edit';
    _journalEdit.journal = widget.journalEdit.journal;
    if(widget.add){
      _selectedDate = DateTime.now();
      _moodController.text = '';
      _noteController.text = '';
    } else{
      _selectedDate = DateTime.parse(_journalEdit.journal.date);
      _moodController.text = _journalEdit.journal.mood;
      _noteController.text = _journalEdit.journal.note;
    }
  }

  @override
  void dispose() {
    _moodController.dispose();
    _noteController.dispose();
    _moodFocus.dispose();
    _noteFocus.dispose();

    super.dispose();
  }
  //the date picker
  Future<DateTime> _selectDate (DateTime selectedDate) async{
    DateTime _initialDate = _selectedDate;
    final DateTime _pickedDate = await showDatePicker(
        context: context,
        initialDate: _initialDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (_pickedDate != null) {
      selectedDate = DateTime(
        _pickedDate.year,
        _pickedDate.month,
        _pickedDate.day,
        _initialDate.hour,
        _initialDate.minute,
        _initialDate.second,
        _initialDate.millisecond,
        _initialDate.microsecond
      );
    }
    return selectedDate;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title Entry'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime _pickerDate = await _selectDate(_selectedDate);
                    setState(() {
                      _selectedDate = _pickerDate;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.black54,
                        size: 22.0,
                      ),
                      SizedBox(width: 16.0,),
                      Text(
                        DateFormat.yMMMEd().format(_selectedDate),
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black54,
                      ),
                    ],
                  )
              ),
              TextField(
                controller: _moodController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                focusNode: _moodFocus,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Mood',
                  icon: Icon(Icons.mood),
                ),
                onSubmitted: (submitted){
                  FocusScope.of(context).requestFocus(_noteFocus);
                },
              ),
              TextField(
                controller: _noteController,
                textInputAction: TextInputAction.newline,
                focusNode: _noteFocus,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Note',
                  icon: Icon(Icons.subject),
                ),
                maxLines: null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: (){
                        _journalEdit.action = 'Cancel';
                        Navigator.pop(context,_journalEdit);
                      },
                      child: Text('Cancel'),
                      color: Colors.grey.shade100,
                  ),
                  SizedBox(width: 8.0,),
                  FlatButton(
                      onPressed: (){
                        _journalEdit.action = 'Save';
                        String _id = widget.add
                            ? Random().nextInt(9999999).toString()
                            : _journalEdit.journal.id;
                        _journalEdit.journal = Journal(
                          id: _id,
                          date: _selectedDate.toString(),
                          mood: _moodController.text,
                          note: _noteController.text,
                        );
                        print(_moodController.text);
                        print(_noteController.text);
                        Navigator.pop(context, _journalEdit);
                      },
                      child: Text('Save'),
                      color: Colors.lightGreen.shade100,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
