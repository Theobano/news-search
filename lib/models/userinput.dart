class UserInput {
  final String q; // The search query
  final String lang;
  final DateTime from;
  final String sortBy;
  final int page;
  final int size;

  const UserInput({
    required this.q,
    required this.lang,
    required this.from,
    required this.sortBy,
    required this.page,
    required this.size,
  });

  factory UserInput.fromJson(Map<String, dynamic> json) {
    return UserInput(
        q: json["q"],
        lang: json["lang"],
        from: DateTime.parse(json["from"]),
        sortBy: json["sort_by"],
        page: json["page"],
        size: json["size"]);
  }
}
