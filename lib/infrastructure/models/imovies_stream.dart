import 'package:flutter/material.dart';
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

  void handleFuture(Future future) => future
      .then(
        (value) => this.add(value),
      )
      .onError(
        (error, stackTrace) => this.addError(error),
      );

  Widget toBuild<T>({
    required Widget Function(T data) onSuccess,
    required Widget onLoading,
    required Widget onError,
    dynamic data,
  }) {
    return StreamBuilder<T>(
      stream: this.stream as Stream<T>,
      initialData: data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return onSuccess(snapshot.data);
        } else if (snapshot.hasError) {
          return onError;
        } else {
          return onLoading;
        }
      },
    );
  }
}
