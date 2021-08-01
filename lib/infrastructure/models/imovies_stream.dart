import 'package:rxdart/subjects.dart';

class IMoviesStream<T> {
  // ignore: close_sinks
  final BehaviorSubject<T> _subject = BehaviorSubject<T>();

  Stream<T> get stream => _subject.stream;

  void add(T value) {
    _subject.add(value);
  }

  void addError(Object? value) {
    if (value != null) {
      _subject.addError(value);
    }
  }
}
