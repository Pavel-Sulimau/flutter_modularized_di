import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/src/counter/counter_cubit.dart';
import 'package:presentation/src/counter/counter_state.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() => counterCubit = CounterCubit(FakeCounterRepository(23)));

    tearDown(() => counterCubit.close());

    blocTest<CounterCubit, CounterState>(
      'has CounterLoading initial value',
      build: () => counterCubit,
      verify: (bloc) => bloc.state is CounterLoading,
    );

    blocTest<CounterCubit, CounterState>(
      'emits nothing when increment is not called',
      build: () => CounterCubit(FakeCounterRepository(1)),
      expect: () => const <CounterState>[],
    );

    blocTest<CounterCubit, CounterState>(
      'emits CounterSuccess with incremented value when increment is called',
      build: () => counterCubit,
      setUp: () => counterCubit.initialize(),
      act: (cubit) async => cubit.increment(),
      expect: () => const <CounterState>[
        CounterSuccess(24),
      ],
    );
  });
}

class FakeCounterRepository extends Fake implements CounterRepository {
  FakeCounterRepository(this._counterValue);

  int _counterValue;

  @override
  Future<CounterEntity> getCounter() async => CounterEntity(_counterValue);

  @override
  Future<void> saveCounter(CounterEntity counterEntity) async {
    _counterValue = counterEntity.value;
  }
}
