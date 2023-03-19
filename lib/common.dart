import 'package:common/initial_consonant.dart';
import 'package:common/web_helper.dart';
import 'search_view.dart';
import 'dart:io';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

class Common {
  /// SearchView
  static SearchView searchView(
      {key, enableSearchOnTextChange = true, onSearch}) {
    return SearchView(
      key: key,
      enableSearchOnTextChange: enableSearchOnTextChange,
      onSearch: onSearch,
    );
  }

  /// WebHelper
  static Future<http.Response> getWebPage(String page) async {
    return WebHelper.getPage(page);
  }

  static Future<Document> getWebDocument(String page) async {
    return WebHelper.getDocument(page);
  }

  static Future<File> getWebFile(String webSite, {String fileName = ''}) async {
    return WebHelper.getFile(webSite);
  }

  /// Initial Consonant contains
  static bool contains(String string, String query) {
    return InitialConsonant.contains(string, query);
  }

  static String cp949toUni(List<int> codeBytes) {
    return cp949toUni(codeBytes);
  }
}
