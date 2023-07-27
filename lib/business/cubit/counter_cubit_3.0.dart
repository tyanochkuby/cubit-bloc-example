import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/business/cubit/internet_cubit.dart';
import 'package:bloc_example/constanst/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

part 'counter_state_3.0.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;
  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi)
        increment();
      else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) decrement();
    });
  }
}
