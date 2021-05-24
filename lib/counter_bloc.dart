import 'dart:async';

enum CounterAction { Inrement, Decrement, Reset }

class CounterBloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get conterStream => _stateStreamController.stream;
  final _eventstateStreamController = StreamController<CounterAction>();
  //final _eventStreamController = StreamController<int>();
  StreamSink<CounterAction> get eventSink => _eventstateStreamController.sink;
  Stream<CounterAction> get eventStream => _eventstateStreamController.stream;
  CounterBloc() {
    counter = 0;
    eventStream.listen((event) {
      if (event == CounterAction.Inrement) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reset) {
        counter = 0;
      } else {
        counter = 0;
      }
      counterSink.add(counter);
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventstateStreamController.close();
  }
}
