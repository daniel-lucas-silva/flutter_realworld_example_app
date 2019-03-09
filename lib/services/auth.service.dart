import 'package:realworld/utils.dart';

class AuthService {
  login(email, password) async {
    final Map<String, dynamic> data = {
      "user": {
        "email": email,
        "password": password,
      }
    };

    return await request.post('/users/login', data: data);
  }

  register(username, email, password) async {
    final Map<String, dynamic> data = {
      "user": {
        "username": username,
        "email": email,
        "password": password,
      }
    };

    return await request.post('/users', data: data);
  }

  update(data) async => await request.put('/users', data: data);

  current() async => await request.get('/user');
}

final AuthService authService = AuthService();
