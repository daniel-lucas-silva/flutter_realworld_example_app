import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'package:realworld/models.dart';
import 'package:realworld/services.dart';

class ArticlesBloc {
  // table name
  final String table;
  // controllers
  BehaviorSubject<bool> _loading;
  BehaviorSubject<List<Article>> _items;
  // streams
  Observable<bool> get loading => _loading.stream;
  Observable<List<Article>> get items => _items.stream;
  // services
  final ArticlesService _service = ArticlesService();

  ArticlesBloc(this.table) {
    // TODO: init sqflite
    _loading = BehaviorSubject<bool>();
    _items = BehaviorSubject<List<Article>>(seedValue: []);
  }

  Future<Response> load() async {
    try {
      Response result = await _service.all();

      var articles = result.data["articles"]
          .map((article) => Article.fromJson(article))
          .toList();

      _items.sink.add(List<Article>.from(articles));

      return result;
    } catch (e) {
      if (e?.response?.statusCode == 404) _items.sink.addError("No records");
      throw (e);
    }
  }

  void dispose() {
    _loading.close();
    _items.close();
  }
}
