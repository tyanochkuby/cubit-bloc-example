import 'package:bloc_example/business/cubit/counter_1_0_2_1_cubit.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CounterCubit', () {
    Counter1021Cubit? counterCubit;
    setUp(() {
      counterCubit = Counter1021Cubit();
    });
    tearDown(() {
      counterCubit!.close();
    });
    
    test('the initstate for Counter1021Cubit is CounterState(counterValue: 0)', () {
      expect(counterCubit!.state.counterValue, Counter1021State(counterValue: 0));
    });

    blocTest<Counter1021Cubit, Counter1021State>(
      'this cubit should emit a Counter1021State when cubit.increment() function is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => <Counter1021State>[
        Counter1021State(counterValue: 1)
      ],
    );

    blocTest<Counter1021Cubit, Counter1021State>(
      'this cubit should emit a Counter1021State when cubit.increment() function is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => <Counter1021State>[
        Counter1021State(counterValue: -1)
      ],
    );
  });
}