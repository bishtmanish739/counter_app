import 'package:counter_app/Presentation/Screen/home_screen.dart';
import 'package:counter_app/Presentation/Screen/second_screen.dart';
import 'package:counter_app/Presentation/Screen/third_screen.dart';
import 'package:counter_app/businesslogic/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: MyHomePage(title: 'Counter App')));
        break;
      case '/SecondPage':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: SecondPage(title: 'Counter App')));
        break;
      case '/ThirdPage':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: _counterCubit, child: ThirdPage(title: 'Counter App')));
        break;

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
