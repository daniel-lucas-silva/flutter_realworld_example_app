import 'package:realworld/utils.dart';

class TagsService {
  Request getAll() => request.get('/tags');
}

final TagsService tagsService = TagsService();