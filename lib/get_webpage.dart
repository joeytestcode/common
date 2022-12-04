import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class GetWebpage {
  static const _corsProxy = 'https://cors-anywhere.herokuapp.com/';
  static const _maxTry = 4;
  static Future<http.Response> get(String page) async {
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
    return parse((await get(page)).body);
  }
}
