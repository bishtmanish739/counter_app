import 'package:counter_app/Presentation/Screen/home_screen.dart';
import 'package:counter_app/Presentation/Screen/second_screen.dart';
import 'package:counter_app/Presentation/Screen/third_screen.dart';
import 'package:counter_app/businesslogic/cubit/counter_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
              value: _counterCubit, child: MyHomePage(title: 'Counter App')),
          '/SecondPage': (context) => BlocProvider.value(
              value: _counterCubit, child: SecondPage(title: 'Counter App')),
          '/ThirdPage': (context) => BlocProvider.value(
              value: _counterCubit, child: ThirdPage(title: 'Counter App')),
        },
      ),
    );
  }
}
