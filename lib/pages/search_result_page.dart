import 'package:flutter/material.dart';
import 'package:news_search/models/search_arguments.dart';
import 'package:news_search/services/api_service.dart';
import 'package:news_search/widgets/search_result.dart';

class SearchResultFlow extends StatefulWidget {
  //final String searchResultPageRoute;
  final SearchArguments searchArguments;

  const SearchResultFlow({
    Key? key,
    // required this.searchResultPageRoute,
    required this.searchArguments,
  }) : super(key: key);

  @override
  SearchResultFlowState createState() => SearchResultFlowState();

  static SearchResultFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<SearchResultFlowState>()!;
  }
}

class SearchResultFlowState extends State<SearchResultFlow> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final popped = await _navigatorKey.currentState!.maybePop();
        if (popped) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: Navigator.of(context).pop,
            ),
            title: const Text(
              "Search Result",
            ),
          ),
          body: Navigator(
            key: _navigatorKey,
            initialRoute: widget.searchArguments.searchKey,
            onGenerateRoute: _onGenerateRoute,
          )
          // SearchResultWidget(
          //   newsSearchApi: _newsSearchApiService,
          //   searchParameter: widget.searchParameter,
          //   page: widget.page,
          // ),
          ),
    );
  }

  // final _navigatorKey = GlobalKey<NavigatorState>();
  final NewsSearchApiService _newsSearchApiService = NewsSearchApiService();

  Route _onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments as SearchArguments;

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return SearchResultWidget(
          newsSearchApi: _newsSearchApiService,
          searchKey: widget.searchArguments.searchKey,
          page: widget.searchArguments.page,
        );
      },
      settings: settings,
    );
  }
}

// class SearchResultPage extends StatefulWidget {
//   final GlobalKey<NavigatorState> navigatorKey;
//   final String searchParameter;
//   final int page;
//   const SearchResultPage({
//     Key? key,
//     required this.navigatorKey,
//     required this.searchParameter,
//     this.page = 1,
//   }) : super(key: key);

//   @override
//   State<SearchResultPage> createState() => _SearchResultPageState();
// }

// class _SearchResultPageState extends State<SearchResultPage> {
//   final _navigatorKey = GlobalKey<NavigatorState>();
//   final NewsSearchApiService _newsSearchApiService = NewsSearchApiService();

//   Widget _resultPage(BuildContext context){
//     return SearchResultWidget(
//           newsSearchApi: _newsSearchApiService,
//           searchParameter: widget.searchParameter,
//           page: widget.page,
//         );
//   }

// Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
//   return {
//     "/": (context) => _resultPage(context)};
//   }

//   @override
//   Widget build(BuildContext context) {
//     var routeBuilders = _routeBuilders(context)
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Search Result",
//           ),
//         ),
//         body: Navigator(
//           key: _navigatorKey,
//           initialRoute:  SearchResultPage,
//           onGenerateRoute: _onGenerateRoute,
//         )
//         // SearchResultWidget(
//         //   newsSearchApi: _newsSearchApiService,
//         //   searchParameter: widget.searchParameter,
//         //   page: widget.page,
//         // ),
//         );
//   }
