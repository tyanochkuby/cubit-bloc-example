part of 'counter_cubit_3.0.dart';

class CounterState extends Equatable{
  int counterValue;

  CounterState({required this.counterValue});


  @override
  List<Object> get props => [counterValue];
}
