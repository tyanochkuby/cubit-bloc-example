import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_1.0-2.1_state.dart';

class Counter1021Cubit extends Cubit<Counter1021State> {
  Counter1021Cubit() : super(Counter1021State(counterValue: 0));

  void increment() => emit(
      Counter1021State(counterValue: state.counterValue + 1));

  void decrement() => emit(Counter1021State(
      counterValue: state.counterValue - 1));
}
