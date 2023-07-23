import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:test_core/test_core.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit!.close();
    });
    
    test('the initstate for CounterCubit is CounterState(counterValue: 0)', () {
      expect(counterCubit!.state.counterValue, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'this cubit should emit a CounterState when cubit.increment() function is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => <CounterState>[
        CounterState(counterValue: 1)
      ],
    );

    blocTest<CounterCubit, CounterState>(
      'this cubit should emit a CounterState when cubit.increment() function is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => <CounterState>[
        CounterState(counterValue: -1)
      ],
    );
  });
}