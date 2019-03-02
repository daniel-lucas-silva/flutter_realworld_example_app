import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:realworld/utils.dart';
import 'package:realworld/services/auth_service.dart';

class AuthBloc {
  // services
  final _authService = AuthService();

  // controllers
  BehaviorSubject<bool> _loading;
  BehaviorSubject<Map<String, dynamic>> _profile;

  // streams
  Observable<bool> get loading => _loading.stream;
  Observable<Map<String, dynamic>> get profile => _profile.stream;

  void initState() {
    _loading = BehaviorSubject<bool>();
    _profile = BehaviorSubject<Map<String, dynamic>>(seedValue: {});
  }

  // dispose
  void dispose() {
    _loading.close();
    _profile.close();
  }

  Future<bool> login(data) async {
    _loading.sink.add(true);

    try {
      var _response = await _authService.login(data.toMap());

      var _data = _response.data;

      var _profileData = {
        "id": _data['data']['user_id'],
        "name": _data['data']['company_name'],
        "email": _data['data']['email'],
        "logo": _data['data']['logo'],
      };

      await storage.write(
        key: "token",
        value: _data['data']['token'],
      );

      print(_data);
      _profile.sink.add(_profileData);

      _loading.sink.add(false);
      return true;
    } catch (e) {
      print(e);
      _loading.sink.add(false);
      throw (e);
    }
  }

  Future<bool> auth() async {
    if (await storage.read(key: "token") != null) {
      try {
        var _response = await _authService.current();

        var _data = _response.data;

        Map<String, dynamic> _profileData = {
          "id": _data['data']['user_id'],
          "name": _data['data']['company_name'],
          "email": _data['data']['email'],
          "logo": _data['data']['logo'],
        };

        _profile.sink.add(_profileData);

        return true;
      } catch (e) {
        print(e);
        return false;
      }
    }
    return false;
  }

  Future<bool> logout() async {
    await storage.delete(key: "token");
    return true;
  }
}

final AuthBloc authBloc = AuthBloc();
