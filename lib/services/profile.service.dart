import 'package:realworld/utils/http.dart';

class ProfileService {
  follow(String username) async =>
      await http.post('/profiles/$username/follow');

  unfollow(String username) async =>
      await http.delete('/profiles/$username/follow');

  get(String username) async => await http.get('/profiles/$username');
}
