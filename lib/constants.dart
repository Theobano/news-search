import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsSearchApiConstants {
  static String baseUrl = "https://free-news.p.rapidapi.com/v1/search";
  static var headers = {
    'X-RapidAPI-Host': "free-news.p.rapidapi.com",
    'X-RapidAPI-Key': dotenv.env["X_RapidAPI_Key"]!,
  };
}
