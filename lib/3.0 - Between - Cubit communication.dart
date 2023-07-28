import 'package:bloc_example/business/cubit/counter_cubit_3.0.dart';
import 'package:bloc_example/business/cubit/internet_cubit.dart';
import 'package:bloc_example/presentation/routers/router_3.0.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_example/business/cubit/counter_cubit_3.0.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({super.key, required this.appRouter, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.onGeneratedRoute,
      ),
    );
  }


}
