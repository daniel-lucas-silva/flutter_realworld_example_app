import 'package:realworld/utils.dart';

class ProfileService {
  follow(String username) async =>
      await request.post('/profiles/$username/follow');

  unfollow(String username) async =>
      await request.delete('/profiles/$username/follow');

  get(String username) async => await request.get('/profiles/$username');
}

final ProfileService profileService = ProfileService();
