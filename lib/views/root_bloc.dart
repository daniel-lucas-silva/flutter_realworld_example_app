import 'dart:async';

import 'package:dio/dio.dart';
import 'package:realworld/models/user.dart';
import 'package:realworld/services/auth.service.dart';
import 'package:rxdart/rxdart.dart';

class RootBloc {

  BehaviorSubject<bool> _loading;
  BehaviorSubject<bool> _authenticated;
  BehaviorSubject<User> _user;

  Observable<bool> get loading => _loading.stream;
  Observable<bool> get authenticated => _authenticated.stream;
  Observable<User> get user => _user.stream;

  void initState() {
    _loading = BehaviorSubject<bool>(seedValue: false);
    _authenticated = BehaviorSubject<bool>(seedValue: false);
    _user = BehaviorSubject<User>(seedValue: User());
  }

  void dispose() {
    _loading.close();
    _authenticated.close();
    _user.close();
  }

  void setLoading(bool value) {
    _loading.sink.add(value);
  }

  void setAuthenticated(bool value) {
    _authenticated.sink.add(value);
  }

  void setUser(User value) {
    _user.sink.add(value);
  }
  

  Future<bool> loadUser() async {
    _loading.sink.add(true);

    print("logged");

    try {
        Response response = await AuthService.current();

        _user.sink.add(User.fromJson(response.data['user']));
        _authenticated.sink.add(true);
        _loading.sink.add(false);
        
        return true;
      } catch (e) {
        _loading.sink.add(false);
        _user.sink.addError("Some Error");
        throw (e);
      }
  }
}

final RootBloc rootBloc = new RootBloc();