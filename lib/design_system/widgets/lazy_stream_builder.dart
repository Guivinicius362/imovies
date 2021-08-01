import 'package:flutter/material.dart';

typedef Widget Builder(BuildContext b, AsyncSnapshot snapshot);

class LazyStreamBuilder<T> extends StatelessWidget {
  final Builder sucessBuilder;
  final Builder loadingBuilder;
  final Builder erroBuilder;
  final Stream<T> stream;

  const LazyStreamBuilder({
    Key? key,
    required this.sucessBuilder,
    required this.loadingBuilder,
    required this.erroBuilder,
    required this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      builder: (BuildContext b, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return sucessBuilder(b, snapshot);
        } else if (snapshot.hasError) {
          return erroBuilder(b, snapshot);
        } else {
          return loadingBuilder(b, snapshot);
        }
      },
    );
  }
}
