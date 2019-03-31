import 'package:realworld/utils/http.dart';

class CommentsService {
  create(String slug, Map<String, dynamic> comment) async =>
      await http.post('/articles/$slug/comments', data: comment);

  delete(String slug, commentId) async =>
      await http.delete('/articles/$slug/comments/$commentId');

  forArticle(String slug) async =>
      await http.get('/articles/$slug/comments');
}
