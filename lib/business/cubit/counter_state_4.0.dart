// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit_4.0.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counterValue;

  CounterState({required this.counterValue});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
    );
  }

  @override
  List<Object> get props => [counterValue];

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CounterState(counterValue: $counterValue)';
}
