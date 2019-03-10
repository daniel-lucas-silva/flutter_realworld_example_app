import 'package:realworld/utils.dart';

class TagsService {
  getAll() async => await request.get('/tags');
}
