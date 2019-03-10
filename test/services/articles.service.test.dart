import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:realworld/services.dart';

void main() {
  final ArticlesService articlesService = ArticlesService();
  // test('feed', () async {
  //   Response response;
  //   response = await articlesService.feed();
  //   expect(response.statusCode, 200);
  //   expect(response.headers != null, true);
  // });

  test('all', () async {
    Response response;
    response = await articlesService.all();
    // print(response);
    expect(response.statusCode, 200);
    expect(response.headers != null, true);
  });

  test('byAuthor', () async {
    Response response;
    response = await articlesService.byAuthor('dannlks');
    // print(response);
    expect(response.statusCode, 200);
    expect(response.headers != null, true);
  });

  test('byTag', () async {
    Response response;
    response = await articlesService.byTag('test');
    // print(response);
    expect(response.statusCode, 200);
    expect(response.headers != null, true);
  });
}
