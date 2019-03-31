import 'package:realworld/utils/http.dart';

class TagsService {
  getAll() async => await http.get('/tags');
}
