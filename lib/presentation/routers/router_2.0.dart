import 'package:bloc_example/business/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/screens/home_page.dart';
import 'package:bloc_example/presentation/screens/second%20screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit counterCubit = CounterCubit();

  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(
                  value: counterCubit,
                  child: const HomePage(title: 'Home Page', color: Colors.teal),
                ));
        break;
      case '/2':
        return MaterialPageRoute(builder: (_) =>
            BlocProvider.value(
              value: counterCubit,
              child: const SecondScreen(title: "Second Page", color: Colors.lightGreen),
            ));
        break;
      case '/3':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(
                  value: counterCubit,
                  child: const ThirdScreen(title: 'Third Page', color: Colors.amberAccent),
                ));
        break;
      default:
        return null;
    }
  }

  void dispose(){
    counterCubit.close();
  }
}