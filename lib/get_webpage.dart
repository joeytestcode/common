import 'package:dio/dio.dart';

class GetWebpage {
  static const _maxTry = 4;
  static Future<Response> get(String page) async {
    Response response;
    int nTry = 0;
    do {
      response = await get(page);
      nTry++;
    } while (response.statusCode != 200 && nTry < _maxTry);
    return response;
  }
}
