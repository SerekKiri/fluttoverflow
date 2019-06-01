import 'package:flutter/material.dart';

typedef Widget Builder<T>(BuildContext context, T data);

class FutureLoader<T> extends StatelessWidget {
  final Future<T> future;
  final Builder<T> builder;

  FutureLoader({this.future, this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(child: Text('Waiting to start'));
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            return builder(context, snapshot.data);
        }
      },
    );
  }
}
