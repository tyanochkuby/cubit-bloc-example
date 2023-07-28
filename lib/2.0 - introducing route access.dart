import 'package:bloc_example/presentation/routers/router_2.0.dart';
import 'package:flutter/material.dart';

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
