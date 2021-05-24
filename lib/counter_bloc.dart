import 'dart:async';

class CounterBloc {
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get conterStream => _stateStreamController.stream;

  void dispose() {
    _stateStreamController.close();
  }
}
