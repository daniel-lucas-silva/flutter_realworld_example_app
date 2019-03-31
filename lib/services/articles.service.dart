import 'package:realworld/utils/http.dart';

class ArticlesService {
  all({int page, int lim: 10}) async =>
      await http.get('/articles?${_limit(lim, page)}');

  byAuthor(String author, {int page}) async =>
      await http.get('/articles?author=$author&${_limit(5, page)}');

  byTag(String tag, {int page, int lim: 10}) async =>
      await http.get('/articles?tag=$tag&${_limit(lim, page)}');

  del(String slug) async => await http.delete('/articles/$slug');

  favorite(String slug) async => await http.post('/articles/$slug/favorite');

  favoritedBy(String author, {int page}) async =>
      await http.get('/articles?favorited=$author&${_limit(5, page)}');

  feed() async => await http.get('/articles/feed?limit=10&offset=0');

  get(slug) async => await http.get('/articles/$slug');

  unfavorite(String slug) async =>
      await http.delete('/articles/$slug/favorite');

  update(String slug, Map<String, dynamic> data) async =>
      await http.put('/articles/$slug', data: data);

  create(Map<String, dynamic> data) async =>
      await http.post('/articles', data: data);

  String _limit(count, p) => 'limit=$count&offset=${p != null ? p * count : 0}';
}
