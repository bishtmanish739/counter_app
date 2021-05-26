import 'package:counter_app/businesslogic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed('/SecondPage');
                },
                child: Text('Third Screen')),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.hasIncrement == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Increment'),
                    duration: Duration(microseconds: 300),
                  ));
                }
                if (state.hasIncrement == false) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('decrement'),
                    duration: Duration(microseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
              //counterBloc.eventSink.add(CounterAction.Inrement);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
              //counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: 'Decrement',
            child: Icon(Icons.exposure_minus_1),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).reset();
            },
            tooltip: 'reset',
            child: Icon(Icons.delete),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
