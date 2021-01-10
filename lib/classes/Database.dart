import 'package:path_provider/path_provider.dart'; //File system location
import 'dart:io'; //used by the File
import 'dart:convert';

class DatabaseFileRoutines {
//handles locating device's local document directory

  Future<String> get _localPath async {
    //getting the document directory path
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    //getting the json file
    final path = await _localPath;
    print("$path/local_persistence.json");
    return File("$path/local_persistence.json");
  }

  Future<File> writeJournals(String json) async {
    //to save the json objects to file
    final file = await _localFile;
    print("$file");
    return file.writeAsString("$json");
  }

  Future<String> readJournals() async {
    //trying to read the data in the json file

    try {
      final file = await _localFile;
      //check whether the file exits
      if (!file.existsSync()) {
        print("File does not Exist: ${file.absolute}");
        await writeJournals('{"journals: []"}');
      }
      //read the file
      String contents = await file.readAsString();
    } catch (e) {
      print("error readJournals: $e");
      return "";
    }
  }

  Database databaseFromJson(String str) {
    // to read and parse data from json data
    //databaseFromJson(jsonString)
    final databaseFromJson = json.decode(str);
    return Database.fromJson(databaseFromJson);
  }

  String databaseToJson(Database data) {
    //to save and parse to JSON Data
    //databaseToJson(jsonString)
    final dataToJson = data.toJson();
    return json.encode(dataToJson);
  }
}

class Database {
  List<Journal> journal;

  Database({
    this.journal,
  });

  //parse Json to journal list
  factory Database.fromJson(Map<String, dynamic> json) => Database(
      journal:
          List<Journal>.from(json["journals"].map((x) => Journal.fromJson(x))));

  Map<String, dynamic> toJson() => {
        //parse from journal list to Json objects
        "journals": List<dynamic>.from(journal.map((x) => x.toJson())),
      };
}

class Journal {
  String id;
  String date;
  String mood;
  String note;

  Journal({this.id, this.date, this.mood, this.note});

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
      //retrieve and convert the json object to journal object
      id: json["id"],
      date: json["date"],
      mood: json["mood"],
      note: json["note"]);

  Map<String, dynamic> toJson() => {
        //to convert from journal object to Json object
        "id": id,
        "date": date,
        "mood": mood,
        "note": note,
      };
}

class JournalEdit {
  String action;
  Journal journal;

  JournalEdit({this.action, this.journal});
}
