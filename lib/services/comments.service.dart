import 'package:realworld/utils.dart';

class CommentsService {
  create(String slug, Map<String, dynamic> comment) async =>
      await request.post('/articles/$slug/comments', data: comment);

  delete(String slug, commentId) async =>
      await request.delete('/articles/$slug/comments/$commentId');

  forArticle(String slug) async =>
      await request.get('/articles/$slug/comments');
}
