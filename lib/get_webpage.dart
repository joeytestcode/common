import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:path_provider/path_provider.dart';

class GetWeb {
  static const _corsProxy = 'https://corsproxy-371208.du.r.appspot.com/';
  static const _maxTry = 4;
  static Future<http.Response> getPage(String page) async {
    http.Response response;
    int nTry = 0;
    do {
      response = await http
          .get(kIsWeb ? Uri.parse(_corsProxy + page) : Uri.parse(page));
      nTry++;
    } while (response.statusCode != 200 && nTry < _maxTry);
    return response;
  }

  static Future<Document> getDocument(String page) async {
    return parse((await getPage(page)).body);
  }

  static Future<File> getFile(String webSite, {String fileName = ''}) async {
    if (fileName.isEmpty) {
      fileName = RegExp(r'([^\/]+$)').firstMatch(webSite)?.group(1) ?? 'temp';
    }
    final request = await HttpClient().getUrl(Uri.parse(webSite));
    final response = await request.close();
    final File file = File('${await _localPath}/$fileName');
    await response.pipe(file.openWrite());
    return file;
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
