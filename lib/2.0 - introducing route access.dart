import 'package:bloc_example/business/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/routers/router_2.0.dart';
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
  final AppRouter appRouter = AppRouter();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: appRouter.onGeneratedRoute,
    );
  }

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }

}
