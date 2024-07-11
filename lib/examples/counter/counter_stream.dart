import 'dart:async';

class CounterStream {
  final _streamController = StreamController<int>();
  int _counter = 0;

  Stream<int> get counter {
    return _streamController.stream;
  }

  void increment() {
    _streamController.add(_counter++);
  }

  void decrement() {
    _streamController.add(_counter--);
  }
}
