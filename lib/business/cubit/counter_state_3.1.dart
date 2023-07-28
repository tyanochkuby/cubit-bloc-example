part of 'counter_cubit_3.1.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counterValue;

  CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}
