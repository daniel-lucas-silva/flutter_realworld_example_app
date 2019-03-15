import 'package:realworld/utils.dart' show request;

class AuthService {
  login(data) async => await request.post('/users/login', data: data);

  register(data) async => await request.post('/users', data: data);

  update(data) async => await request.put('/users', data: data);

  current() async => await request.get('/user');
}
