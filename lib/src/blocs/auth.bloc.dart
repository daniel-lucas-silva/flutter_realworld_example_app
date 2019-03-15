import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:realworld/models.dart';
import 'package:realworld/utils.dart';
import 'package:realworld/services.dart';
import 'app.bloc.dart';

class AuthBloc {
  // controllers
  BehaviorSubject<bool> _loggedIn;
  BehaviorSubject<bool> _loading;
  BehaviorSubject<User> _user;
  // streams
  Observable<bool> get loggedIn => _loggedIn.stream;
  Observable<bool> get loading => _loading.stream;
  Observable<User> get user => _user.stream;
  // service
  final AuthService _service = AuthService();

  void initState() {
    _loggedIn = BehaviorSubject<bool>(seedValue: false);
    _loading = BehaviorSubject<bool>();
    _user = BehaviorSubject<User>(seedValue: User());
  }

  void dispose() {
    _loggedIn.close();
    _loading.close();
    _user.close();
  }

  Future<bool> loadUser() async {
    appBloc.setLoading(true);

    try {
        Response response = await _service.current();

        _user.sink.add(User.fromJson(response.data['user']));
        _loggedIn.sink.add(true);
        
        appBloc.setLoading(false);
        
        return true;
      } catch (e) {
        appBloc.setLoading(false);
        
        _user.sink.addError("Some Error");
        
        throw (e);
      }
  }

  Future<bool> login(credentials) async {
    _loading.sink.add(true);

    try {
      Response response = await _service.login(credentials);

      final String token = response.data['user']['token'];

      request.dio.options.headers = {'Authorization': 'Token $token'};

      await storage.write(
        key: "token",
        value: token,
      );

      _user.sink.add(User.fromJson(response.data['user']));

      _loggedIn.sink.add(true);
      _loading.sink.add(false);
      return true;
    } catch (e) {
      _loading.sink.add(false);
      throw (e);
    }
  }

  Future<bool> register(credentials) async {
    _loading.sink.add(true);

    try {
      Response response = await _service.register(credentials);

      final String token = response.data['user']['token'];

      request.dio.options.headers = {'Authorization': 'Token $token'};

      await storage.write(
        key: "token",
        value: token,
      );

      _user.sink.add(User.fromJson(response.data['user']));

      _loggedIn.sink.add(true);
      _loading.sink.add(false);
      return true;
    } catch (e) {
      _loading.sink.add(false);
      throw (e);
    }
  }

  Future<bool> logout() async {
    _user.sink.add(User());
    await storage.delete(key: "token");
    _loggedIn.sink.add(false);
    return true;
  }
}

final AuthBloc authBloc = AuthBloc();
