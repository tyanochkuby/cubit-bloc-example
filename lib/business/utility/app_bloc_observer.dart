import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    print('${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onClose(BlocBase cubit) {
    print('${cubit.runtimeType} closed');
    super.onClose(cubit);
  }

  void onCreate(BlocBase cubit) {
    print('${cubit.runtimeType} created');
    super.onCreate(cubit);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
