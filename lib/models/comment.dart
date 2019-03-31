import './author.dart';

class Comment {
  final int id;
  final String body;
  final Author author;
  final String createdAt;
  final String updatedAt;

  Comment({this.id, this.body, this.author, this.createdAt, this.updatedAt});

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        body = json['body'],
        author = Author.fromJson(json['author']),
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'body': body,
        'author': author,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
