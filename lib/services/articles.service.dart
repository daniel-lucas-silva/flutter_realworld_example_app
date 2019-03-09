import 'package:realworld/utils.dart';

class ArticlesService {
  Request all(int page, {int lim: 10}) => request.get('/articles?${_limit(lim, page)}');

  Request byAuthor(String author, int page) => request.get('/articles?author=$author&${_limit(5, page)}');

  Request byTag(String tag, int page, { int lim: 10}) => request.get('/articles?tag=$tag&${_limit(lim, page)}');

  Request del(String slug) => request.delete('/articles/$slug');

  Request favorite(String slug) => request.post('/articles/$slug/favorite');

  Request favoritedBy(String author, int page) => request.get('/articles?favorited=$author&${_limit(5, page)}');

  Request feed() => request.get('/articles/feed?limit=10&offset=0');

  Request get(slug) => request.get('/articles/$slug');

  Request unfavorite(String slug) => request.delete('/articles/$slug/favorite');

  Request update(String slug, Map<String, dynamic> data) => request.put('/articles/$slug', data: data);

  Request create(Map<String, dynamic> data) => request.post('/articles', data: data);

  String _limit(count, p) => 'limit=$count&offset=${p ? p * count : 0}';
}

final ArticlesService articlesService = ArticlesService();