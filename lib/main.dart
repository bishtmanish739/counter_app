import 'package:counter_app/Presentation/Screen/home_screen.dart';
import 'package:counter_app/Presentation/Screen/second_screen.dart';
import 'package:counter_app/Presentation/Screen/third_screen.dart';
import 'package:counter_app/Presentation/router/app_router.dart';
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
  final AppRouter _appRouter = AppRouter();
  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: _appRouter.onGeneratedRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
