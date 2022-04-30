class Article {
  // This class models articles from a list of articles returned by the
  // news search API

  final String title;
  final String author;
  final DateTime publishedDate;
  final String publishedDatePricision;
  final String link;
  final String cleanUrl;
  final String summary;
  final String rights;
  final int rank;
  final String topic;
  final String country;
  final String language;
  final List<String> authors;
  final String? media;
  final bool isOpinion;
  final String twitterAccount;
  final double score;
  final String id;

  const Article({
    required this.title,
    required this.author,
    required this.publishedDate,
    required this.publishedDatePricision,
    required this.link,
    required this.cleanUrl,
    required this.summary,
    required this.rights,
    required this.rank,
    required this.topic,
    required this.country,
    required this.language,
    required this.authors,
    required this.media,
    required this.isOpinion,
    required this.twitterAccount,
    required this.score,
    required this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"],
      author: json["author"] ?? "Unknown",
      publishedDate: DateTime.parse(json["published_date"]),
      publishedDatePricision: json["published_date_precision"],
      link: json["link"],
      cleanUrl: json["clean_url"],
      summary: json["summary"] ?? "None",
      rights: json["rights"] ?? "None",
      rank: json["rank"],
      topic: json["topic"],
      country: json["country"],
      language: json["language"],
      authors: List<String>.from(json["authors"]),
      media: json["media"],
      isOpinion: json["is_opinion"],
      twitterAccount: json["twitter_account"] ?? "None",
      score: json["_score"],
      id: json["_id"],
    );
  }
}
