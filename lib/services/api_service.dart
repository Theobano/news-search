import 'dart:convert';

import 'package:news_search/models/searchresult.dart';

import '../constants.dart';

import 'package:http/http.dart' as http;

class NewsSearchApiService {
  Future<SearchResult?> getSearchResult(
      {required String searchKey, int page = 1}) async {
    try {
      final response = await http.get(
          Uri.parse(NewsSearchApiConstants.baseUrl).replace(queryParameters: {
            "q": searchKey,
            "lang": "en",
            "page": page.toString()
          }),
          headers: NewsSearchApiConstants.headers);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        return SearchResult.fromJson(responseJson);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
    return null;
  }
}
