
import 'dart:convert';
import 'dart:io';
import 'package:castapp/prayer_entity.dart';
import 'package:path_provider/path_provider.dart';
class FileManager {

  Future<File> savePrayerToFile(Prayer prayer) async {
    String json = jsonEncode(
        prayer); // converts to string that will then be saved into file
    final file = await _localFile;
    return file.writeAsString(json);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<List<Prayer>> readPrayer() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      List<Prayer> prayerList;
      prayerList = (json.decode(contents) as List).map((e) => Prayer.fromJSON(e)).toList();
      return prayerList;
    } catch (e) {
      throw Exception(e);
    }
  }

}