import 'dart:async';

import 'package:dio/dio.dart' show Response;
import 'package:realworld/models/comment.dart';
import 'package:realworld/services/comments.service.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject, Observable;

class CommentBloc {

  // controllers
  BehaviorSubject<bool> _loading;
  BehaviorSubject<List<Comment>> _items;
  // observables
  Observable<bool> get loading => _loading.stream;
  Observable<List<Comment>> get items => _items.stream;
  // services
  final CommentsService _service = CommentsService();

  void init() {
    _loading = BehaviorSubject<bool>();
    _items = BehaviorSubject<List<Comment>>();
  }

  void dispose() {
    _loading.close();
    _items.close();
  }

  Future<Response<dynamic>> load(String slug) async {
    try {
      Response result = await _service.forArticle(slug);
      print(result.data);
      var comments = result.data["comments"]
          .map((comment) => Comment.fromJson(comment))
          .toList();

      _items.sink.add(List<Comment>.from(comments));

      return Future.value(result);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }

  loadMore(String slug) {}

  create(String slug, commentId) {}

  delete(String slug) {}

}