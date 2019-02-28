import 'package:realworld/constants.dart';
import 'package:realworld/utils.dart';

class ArticlesService {
  fetch() async {
    try {
      return await dio.get("$APIURL/articles");
    } catch (e) {
      throw (e);
    }
  }
}
