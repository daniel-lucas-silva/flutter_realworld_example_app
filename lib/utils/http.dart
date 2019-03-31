import 'package:dio/dio.dart' show Dio, DioError;
import 'package:realworld/constants.dart' show APIURL;

class Http {
  final Dio dio = Dio();

  auth(token) {
    if (token != null)
    http.dio.options.headers = {'Authorization': 'Token $token'};
  }

  get(String url) async {
    try {
      return await dio.get("$APIURL/$url");
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
      throw (e);
    }
  }

  post(String url, {data}) async {
    try {
      return await dio.post("$APIURL/$url", data: data);
    } catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
      throw (e);
    }
  }

  put(String url, {data}) async {
    try {
      return await dio.put("$APIURL/$url", data: data);
    } catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
      throw (e);
    }
  }

  delete(String url) async {
    try {
      return await dio.delete("$APIURL/$url");
    } catch (e) {
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        print(e.request);
        print(e.message);
      }
      throw (e);
    }
  }
}

final Http http = Http();
