class Article {
  final String title;
  final String description;
  final String body;
  final List<String> tags;

  Article({this.title, this.description, this.body, this.tags});

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        body = json['body'],
        tags = json['tagList'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'body': body,
        'tagList': tags,
      };
}
