import 'package:realworld/utils/http.dart';

class AuthService {
  static login(data) async => await http.post('/users/login', data: data);

  static register(data) async => await http.post('/users', data: data);

  static update(data) async => await http.put('/users', data: data);

  static current() async => await http.get('/user');
}
