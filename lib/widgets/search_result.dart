import 'package:flutter/material.dart';
import 'package:news_search/models/article.dart';
import 'package:news_search/models/searchresult.dart';
import 'package:news_search/services/api_service.dart';
import 'package:news_search/widgets/news_article.dart';

class SearchResultWidget extends StatefulWidget {
  final NewsSearchApiService newsSearchApi;
  final String searchKey;
  final int page;
  const SearchResultWidget({
    Key? key,
    required this.newsSearchApi,
    required this.searchKey,
    required this.page,
  }) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late Future<SearchResult?> _searchResult;

  @override
  void initState() {
    super.initState();
    _searchResult = widget.newsSearchApi.getSearchResult(
      searchKey: widget.searchKey,
      page: widget.page,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResult?>(
      future: _searchResult,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            SearchResult? result = snapshot.data;
            if (result != null) {
              if (result.status != "No matches for your search.") {
                List<Article> articles = result.articles;

                return SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (BuildContext context, int index) {
                          Article article = articles[index];
                          return NewsArticleWidget(article: article);
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            result.page > 1
                                ? ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SearchResultWidget(
                                            newsSearchApi: widget.newsSearchApi,
                                            searchKey: result.userInput.q,
                                            page: result.page - 1,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("Prev"))
                                : Container(),
                            Expanded(
                                child: Center(
                                    child: Text(
                                        "Page ${result.page} of ${result.totalPages}"))),
                            result.page < result.totalPages
                                ? ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SearchResultWidget(
                                            newsSearchApi: widget.newsSearchApi,
                                            searchKey: result.userInput.q,
                                            page: result.page + 1,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Text("Next"))
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    result.status,
                  ),
                );
              }
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Text("Error"),
                  ],
                ),
              );
            }
          } else if (snapshot.hasError) {
            return const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Text("Error"),
                  Text("Could not connect"),
                ],
              ),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
