import 'dart:async';

import 'package:dio/dio.dart' show Response;
import 'package:realworld/models/comment.dart';
import 'package:realworld/services/comments.service.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject, Observable;

class CommentBloc {
  String _slug;
  // controllers
  BehaviorSubject<bool> _loading;
  BehaviorSubject<List<Comment>> _items;
  // observables
  Observable<bool> get loading => _loading.stream;
  Observable<List<Comment>> get items => _items.stream;
  // services
  final CommentsService _service = CommentsService();

  void init({String slug}) {
    _slug = slug;
    _loading = BehaviorSubject<bool>();
    _items = BehaviorSubject<List<Comment>>();
  }

  void dispose() {
    _loading.close();
    _items.close();
  }

  Future<Response<dynamic>> load() async {
    try {
      Response result = await _service.forArticle(_slug);
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

  Future<Response<dynamic>> create(String comment) async {
    Map<String, dynamic> body = {
      "comment": {"body": comment}
    };

    try {
      Response result = await _service.create(_slug, body);
      return Future.value(result);
    } catch (e) {
      return Future.error(e);
    }
  }

  delete(String slug) {}
}
