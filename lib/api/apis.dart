import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MovieAPI {
  static Future<Map<String, dynamic>> listMovies(
      {@required int limit, @required int page}) async {
    String url =
        "https://yts.mx/api/v2/list_movies.json?limit=$limit&page=$page";
    Map<String, dynamic> returnBody = Map();

    http.Response response = await http.get(url);
    returnBody['statusCode'] = response.statusCode;
    returnBody['response'] = _decodeJson(response);

    return returnBody;
  }

  static Map<String, dynamic> _decodeJson(http.Response rs) {
    return convert.jsonDecode(rs.body);
  }

  // static String encodeJson(Map<String, dynamic> map) {
  //   return convert.jsonEncode(map);
  // }
}
