import 'package:bloc_example/business/cubit/settings_cubit.dart';
import 'package:bloc_example/presentation/routers/router_3.3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }
}
