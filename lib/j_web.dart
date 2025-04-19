import 'dart:io';

import 'package:common/j_file.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class JWeb {
  static Future<http.Response> _fetch(String url) async {
    const corsProxy = 'https://corsproxy.io/?url=';

    final actualPage = kIsWeb ? corsProxy + url : url;

    try {
      return http.get(Uri.parse(actualPage));
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<Document> getPage(String url) async {
    http.Response? response = await _fetch(url);

    if (response.statusCode == 200) {
      return parse(response.body);
    } else {
      return Document();
    }
  }

  static Future<File> getFile(String webSite, {String fileName = ''}) async {
    if (fileName.isEmpty) {
      fileName = RegExp(r'([^\/]+$)').firstMatch(webSite)?.group(1) ?? 'temp';
    }
    final request = await HttpClient().getUrl(Uri.parse(webSite));
    final response = await request.close();
    final File file = File('${await JFile.getFile(fileName)}');
    await response.pipe(file.openWrite());
    return file;
  }
}
