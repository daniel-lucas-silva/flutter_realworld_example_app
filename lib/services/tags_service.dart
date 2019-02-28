import 'package:realworld/constants.dart';
import 'package:realworld/utils.dart';

class TagsService {
  fetch() async {
    try {
      return await dio.get("$APIURL/tags");
    } catch (e) {
      throw (e);
    }
  }
}
