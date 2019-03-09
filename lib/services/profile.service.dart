import 'package:realworld/utils.dart';

class ProfileService {
  Request follow(String username) => request.post('/profiles/$username/follow');

  Request unfollow(String username) => request.delete('/profiles/$username/follow');

  Request get(String username) => request.get('/profiles/$username');
}

final ProfileService profileService = ProfileService();


