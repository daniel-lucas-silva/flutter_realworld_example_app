import 'dart:async';

import 'package:dio/dio.dart';
import 'package:realworld/models/user.dart';
import 'package:realworld/services/auth.service.dart';
import 'package:realworld/utils/http.dart';
import 'package:realworld/utils/storage.dart';
import 'package:realworld/views/root_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
// image
// username
// bio
// email

  BehaviorSubject<bool> _loading;

  Observable<bool> get loading => _loading.stream;

  void initState() {
    _loading = BehaviorSubject<bool>(seedValue: false);
  }

  void dispose() {
    _loading.close();
  }

  Future<bool> login(data) async {
    _loading.sink.add(true);

    try {
      Response response = await AuthService.login(data);

      _loading.sink.add(false);
      return true;
    } catch (e) {
      _loading.sink.add(false);
      throw (e);
    }
  }
}

final LoginBloc loginBloc = new LoginBloc();
