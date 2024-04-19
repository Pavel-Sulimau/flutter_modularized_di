import 'package:alchemist/alchemist.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/src/counter/counter_cubit.dart';
import 'package:presentation/src/counter/counter_page.dart';
import 'package:presentation/src/counter/counter_state.dart';

import '../golden_test_group.dart';

void main() {
  group('CounterPage Golden', () {
    DI fakeDI = FakeDI();

    setUp(() {
      CounterCubit fakeCounterCubit = FakeCounterCubit();
      when(() => fakeCounterCubit.state)
          .thenAnswer((_) => const CounterSuccess(42));
      when(() => fakeCounterCubit.initialize())
          .thenAnswer((_) => Future.value());
      when(() => fakeDI.get<CounterCubit>()).thenReturn(fakeCounterCubit);
    });

    tearDown(() {
      reset(fakeDI);
    });

    goldenTest(
      'renders everything correctly',
      fileName: 'counter_page',
      builder: () => createGoldenTestGroup(
        child: const CounterPage(),
        di: fakeDI,
      ),
    );
  });
}

class FakeDI extends Mock implements DI {}

class FakeCounterCubit extends MockCubit<CounterState>
    implements CounterCubit {}
