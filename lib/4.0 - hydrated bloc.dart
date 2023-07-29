import 'package:bloc_example/presentation/routers/router_4.0.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(
    appRouter: AppRouter4(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter4 appRouter;
  MyApp({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hydratedBloc',
      onGenerateRoute: appRouter.onGeneratedRoute,
    );
  }
}
