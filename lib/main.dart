import 'package:flutter/material.dart';
import 'package:news_search/pages/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Routes

const routeHome = "/";
const routeSearchResultPrefix = "search_result/";

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
