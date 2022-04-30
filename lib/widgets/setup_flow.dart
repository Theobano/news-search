// // Creating a SetupFlow widget for the subroutes

// import 'package:flutter/material.dart';
// import 'package:news_search/services/api_service.dart';
// import 'package:news_search/widgets/search_result.dart';

// import '../pages/search_result_page.dart';

// class SetupFlow extends StatefulWidget {
//   final String searchResultPageRoute;
//    final String searchParameter;

//   const SetupFlow({Key? key, required this.searchResultPageRoute, required this.searchParameter,})
//       : super(key: key);

//   @override
//   SetupFlowState createState() => SetupFlowState();
// }

// class SetupFlowState extends State<SetupFlow> {
//   final _navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Search Result",
//           ),
//         ),
//         body: Navigator(
//           key: _navigatorKey,
//           initialRoute: widget.searchResultPageRoute,
//           onGenerateRoute: _onGenerateRoute,
//         )
//         // SearchResultWidget(
//         //   newsSearchApi: _newsSearchApiService,
//         //   searchParameter: widget.searchParameter,
//         //   page: widget.page,
//         // ),
//         );
//   }

//   // final _navigatorKey = GlobalKey<NavigatorState>();
//   final NewsSearchApiService _newsSearchApiService = NewsSearchApiService();

//   Route _onGenerateRoute(RouteSettings settings) {
    
//     return MaterialPageRoute<dynamic>(
//       builder: (context) {
        
//             return SearchResultWidget(
//           newsSearchApi: _newsSearchApiService,
//           searchParameter: widget.searchParameter,
//           page: int.parse(settings.name!),
//         );
//           },
//           settings: settings,
//         );
//       }
    
  
// }
