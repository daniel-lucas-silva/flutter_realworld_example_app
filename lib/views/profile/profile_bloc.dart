import 'dart:async';

import 'package:dio/dio.dart';
import 'package:realworld/models/article.dart';
import 'package:realworld/models/user.dart';
import 'package:realworld/services/articles.service.dart';
import 'package:realworld/views/root_bloc.dart';
import 'package:rxdart/rxdart.dart';

export 'package:realworld/models/article.dart';

class ProfileBloc {

  User user;
  // controllers
  BehaviorSubject<bool> _loading;
  BehaviorSubject<List<Article>> _myArticles;
  BehaviorSubject<List<Article>> _favoriteArticles;

  // // observables
  Observable<bool> get loading => _loading.stream;
  Observable<List<Article>> get myArticles => _myArticles.stream;
  Observable<List<Article>> get favoriteArticles => _favoriteArticles.stream;

  void init() {
    user = rootBloc.user.value;
    _loading = BehaviorSubject<bool>();
    _myArticles = BehaviorSubject<List<Article>>(seedValue: []);
    _favoriteArticles = BehaviorSubject<List<Article>>(seedValue: []);
  }

  void dispose() {
    _loading.close();
    _myArticles.close();
    _favoriteArticles.close();
  }

  Future<bool> fetchMyArticles() async {
    _loading.sink.add(true);
    try {
      Response result = await ArticlesService.byAuthor(user.username);
      print(result.data["articles"]);
      var articles = result.data["articles"]
          .map((article) => Article.fromJson(article))
          .toList();

      _myArticles.sink.add(List<Article>.from(articles));
      _loading.sink.add(false);
      return true;
    } catch (e) {
      _loading.sink.add(false);
      throw (e);
    }
  }

  Future<bool> fetchFavoriteArticles() async {
    _loading.sink.add(true);
    try {
      Response result = await ArticlesService.favoritedBy(user.username);
      print(result.data["articles"]);
      var articles = result.data["articles"]
          .map((article) => Article.fromJson(article))
          .toList();

      _favoriteArticles.sink.add(List<Article>.from(articles));
      _loading.sink.add(false);
      return true;
    } catch (e) {
      _loading.sink.add(false);
      throw (e);
    }
  }
}

final profileBloc = ProfileBloc();