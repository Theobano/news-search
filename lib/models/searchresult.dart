import 'package:news_search/models/article.dart';
import 'package:news_search/models/userinput.dart';

class SearchResult {
  // This is a class modelling the search result from the news search API

  final String status;
  final int totalHits;
  final int page;
  final int totalPages;
  final int pageSize;
  final List<Article> articles;
  final UserInput userInput;

  const SearchResult({
    required this.status,
    required this.totalHits,
    required this.page,
    required this.totalPages,
    required this.pageSize,
    required this.articles,
    required this.userInput,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      status: json["status"],
      totalHits: json["total_hits"] ?? 0,
      page: json["page"] ?? 0,
      totalPages: json["total_pages"] ?? 0,
      pageSize: json["page_size"] ?? 0,
      articles: json["articles"] != null
          ? List<Article>.from(
              json["articles"].map((model) => Article.fromJson(model)))
          : <Article>[],
      userInput: UserInput.fromJson(
        json["user_input"],
      ),
    );
  }
}
