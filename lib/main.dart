import 'package:flutter/material.dart';
import 'package:news_search/pages/homepage.dart';

// Routes

const routeHome = "/";
const routeSearchResultPrefix = "search_result/";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // onGenerateRoute: (settings) {
      //   late Widget page;
      //   if (settings.name == routeHome) {
      //     page = const HomePage();
      //   } else if (settings.name!.startsWith(routeSearchResultPrefix)) {
      //     final subRoute =
      //         settings.name!.substring(routeSearchResultPrefix.length);
      //     page = SearchResultFlow(
      //       searchResultPageRoute: subRoute,

      //     );
      //   } else {
      //     throw Exception("Unknown route: ${settings.name}");
      //   }
      //   return MaterialPageRoute<dynamic>(
      //     builder: (context) {
      //       return page;
      //     },
      //     settings: settings,
      //   );
      // },
      home: const HomePage(),
    );
  }
}
