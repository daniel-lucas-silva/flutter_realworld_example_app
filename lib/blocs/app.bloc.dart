import 'package:rxdart/rxdart.dart';

class AppBloc {
  // controllers
  BehaviorSubject<bool> _loading;
  // streams
  Observable<bool> get loading => _loading.stream;

  void initState() {
    _loading = BehaviorSubject<bool>(seedValue: false);
  }

  void dispose() {
    _loading.close();
  }

  void setLoading(bool value) {
    _loading.sink.add(value);
  }
}

final AppBloc appBloc = AppBloc();
