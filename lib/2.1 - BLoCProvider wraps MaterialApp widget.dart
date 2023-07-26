import 'package:bloc_example/business/cubit/counter_1_0_2_1_cubit.dart';
import 'package:bloc_example/presentation/routers/router_2.1.dart';
import 'package:bloc_example/presentation/screens/home_page.dart';
import 'package:bloc_example/presentation/screens/second%20screen.dart';
import 'package:bloc_example/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<Counter1021Cubit>(
      create: (context) => Counter1021Cubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }


}
