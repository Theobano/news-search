import 'package:flutter/material.dart';
import 'package:news_search/models/search_arguments.dart';
import 'package:news_search/pages/search_result_page.dart';
import 'package:news_search/widgets/searchbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isButtonActive = false;
  final searchBoxController = TextEditingController();

  void _search() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchResultFlow(
          searchArguments:
              SearchArguments(searchKey: searchBoxController.text, page: 1),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isButtonActive = searchBoxController.text.isNotEmpty;
    searchBoxController.addListener(() {
      final isButtonActive = searchBoxController.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    searchBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Search",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchBox(
              controller: searchBoxController,
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: isButtonActive ? _search : null,
              child: const Text(
                "Search",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
