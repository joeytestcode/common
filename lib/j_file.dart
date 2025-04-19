import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class JFile {
  static Future<String> get _documentFolder async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> getFile(String fileName) async {
    final path = await _documentFolder;
    return File('$path/$fileName');
  }

  static Future<File> writeToFile(String fileName, String data) async {
    final file = await getFile(fileName);
    return file.writeAsString(data);
  }

  static Future<File> AddToFile(String fileName, String data) async {
    final file = await getFile(fileName);
    return file.writeAsString(data, mode: FileMode.append);
  }

  static Future<String> readFromFile(String fileName) async {
    try {
      final file = await getFile(fileName);
      return await file.readAsString();
    } catch (e) {
      return '';
    }
  }
}
