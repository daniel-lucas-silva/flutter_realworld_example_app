import 'package:realworld/utils/http.dart';

class AuthService {
  login(data) async => await http.post('/users/login', data: data);

  register(data) async => await http.post('/users', data: data);

  update(data) async => await http.put('/users', data: data);

  current() async => await http.get('/user');
}
