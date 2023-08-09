import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state_4.0.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));

  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}
