import 'package:bloc_example/business/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/screens/home_page.dart';
import 'package:bloc_example/presentation/screens/second%20screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //MyApp({super.key});
  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (newContext) => BlocProvider.value(
            value: counterCubit,
            child: const HomePage(title: 'Home Page', color: Colors.teal)),
        '/2': (context) => BlocProvider.value(
            value: counterCubit,
            child: const SecondScreen(
                title: 'Second Screen', color: Colors.lightGreen)),
        '/3': (context) => BlocProvider.value(
            value: counterCubit,
            child: const ThirdScreen(
                title: 'Third Screen', color: Colors.amberAccent)),
      },
    );
  }

  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }
}
