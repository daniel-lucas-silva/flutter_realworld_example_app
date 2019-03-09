import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:realworld/utils.dart';
import 'package:realworld/services.dart';

void main() {
  test('login and current', () async {
    Response response;
    response = await authService.login("jake@jake.jake", "jakejake");
    // print(response.data);
    expect(response.statusCode, 200);
    expect(response.headers != null, true);

    request.dio.options.headers = {
      'Authorization': 'Token ${response.data['user']['token']}'
    };

    response = await authService.current();
    // print(response);
    expect(response.statusCode, 200);
    expect(response.headers != null, true);
  });
}
