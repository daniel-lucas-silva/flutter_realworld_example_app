import 'package:realworld/utils.dart';

class AuthService {
  Request login(email, password) {

    final Map<String, dynamic> data = {
      "user": {
        "email": email,
        "password": password,
      }
    };

    return request.post('/users/login', data: data);
  }

  Request register(username, email, password) {

    final Map<String, dynamic> data = {
      "user": {
        "username": username,
        "email": email,
        "password": password,
      }
    };

    return request.post('/users', data: data);
  }

  Request update(data) => request.put('/users', data: data);

  Request current() => request.get('/users');
}

final AuthService authService = AuthService();
