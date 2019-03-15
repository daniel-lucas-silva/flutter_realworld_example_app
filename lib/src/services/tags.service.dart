import 'package:realworld/utils.dart' show request;

class TagsService {
  getAll() async => await request.get('/tags');
}
