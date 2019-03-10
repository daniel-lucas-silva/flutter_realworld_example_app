import './author.dart';

class Article {
  final String title;
  final String slug;
  final String description;
  final String body;
  final Author author;
  final bool favorited;
  final int favoritesCount;
  final List<String> tags;
  final String createdAt;
  final String updatedAt;

  Article({
    this.title,
    this.slug,
    this.description,
    this.body,
    this.author,
    this.favorited,
    this.favoritesCount,
    this.tags,
    this.createdAt,
    this.updatedAt,
  });

  Article.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        slug = json['slug'],
        description = json['description'],
        body = json['body'],
        author = json['author'],
        favorited = json['favorited'],
        favoritesCount = json['favoritesCount'],
        tags = json['tagList'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'slug': slug,
        'description': description,
        'body': body,
        'author': author,
        'tagList': tags,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
