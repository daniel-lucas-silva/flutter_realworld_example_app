import 'package:rxdart/rxdart.dart';
import 'package:realworld/utils.dart';
import 'package:realworld/services.dart';

class AuthBloc {
  // controllers
  BehaviorSubject<bool> _loading;
  BehaviorSubject<Map<String, dynamic>> _user;

  // streams
  Observable<bool> get loading => _loading.stream;
  Observable<Map<String, dynamic>> get user => _user.stream;

  void initState() {
    _loading = BehaviorSubject<bool>();
    _user = BehaviorSubject<Map<String, dynamic>>(seedValue: {});
  }

  void dispose() {
    _loading.close();
    _user.close();
  }
}

final AuthBloc authBloc = AuthBloc();
