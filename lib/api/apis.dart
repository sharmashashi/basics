import 'package:firstproject/screens/home/moviedetails/moviedetails.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:math';

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

  static Future<Map<String, dynamic>> movieBySort(
      {@required int page, @required String sortBy}) async {
    String url =
        "https://yts.mx/api/v2/list_movies.json?limit=50&page=$page&sort_by=$sortBy";
    Map<String, dynamic> returnBody = Map();

    http.Response response = await http.get(url);
    returnBody['statusCode'] = response.statusCode;
    returnBody['response'] = _decodeJson(response);

    return returnBody;
  }

  static Future<Map<String, dynamic>> movieByGenre(String genre) async {
    String url = "https://yts.mx/api/v2/list_movies.json?limit=50&genre=$genre";
    Map<String, dynamic> returnBody = Map();

    http.Response response = await http.get(url);
    returnBody['statusCode'] = response.statusCode;
    returnBody['response'] = _decodeJson(response);

    return returnBody;
  }

  static Future<Map<String, dynamic>> movieDetail(int movieId) async {
    String url =
        "https://yts.mx/api/v2/movie_details.json?movie_id=$movieId&with_cast=true";
    Map<String, dynamic> returnBody = Map();

    http.Response response = await http.get(url);
    returnBody['statusCode'] = response.statusCode;
    returnBody['response'] = _decodeJson(response);

    return returnBody;
  }

  static Future<Map<String, dynamic>> movieSerch(String queryterm) async {
    String url = "https://yts.mx/api/v2/list_movies.json?query_term=$queryterm";
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
