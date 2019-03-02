import 'package:dio/dio.dart';
import 'package:realworld/constants.dart';
import 'package:realworld/utils.dart';

class AuthService {
  Dio _dio = Dio();

  Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Map<String, dynamic> body = {
    "client_id": 2,
    "client_secret": "Q9z66dxG140An5h1llVFn8vXuc29ENo43bXZGqol",
  };

  Future login(Map<String, dynamic> data) async {
    data.addAll(body);

    try {
      _dio.options.headers = _headers;
      return await _dio.post("$APIURL/api/store/login", data: data);
    } catch (e) {
      throw (e);
    }
  }

  register(Map<String, dynamic> data, headers) async {
    data.addAll(body);

    try {
      _dio.options.headers = headers;
      return await _dio.post("$APIURL/api/store/register", data: data);
    } catch (e) {
      throw (e);
    }
  }

  current() async {
    await _auth();

    try {
      _dio.options.headers = _headers;
      return await _dio.get("$APIURL/api/store/profile");
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  _auth() async {
    final token = await storage.read(key: "token");
    _headers.addAll({'Authorization': 'Bearer $token'});
  }
}

final authService = new AuthService();
