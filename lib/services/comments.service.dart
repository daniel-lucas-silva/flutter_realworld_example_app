import 'package:realworld/utils.dart';

class CommentsService {
  Request create(String slug, Map<String, dynamic> comment) => request.post('/articles/$slug/comments', data: comment);

  Request delete(String slug, commentId) => request.delete('/articles/$slug/comments/$commentId');

  Request forArticle(String slug) => request.get('/articles/$slug/comments');
}

final CommentsService commentsService = CommentsService();