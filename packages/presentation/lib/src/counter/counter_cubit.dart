import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(CounterRepository counterRepository)
      : _counterRepository = counterRepository,
        super(const CounterLoading()) {
    _initialize();
  }

  final CounterRepository _counterRepository;

  Future<void> increment() async {
    switch (state) {
      case CounterLoading():
        break;
      case CounterSuccess success:
        final newCounterValue = success.value + 1;

        await _counterRepository.saveCounter(CounterEntity(newCounterValue));

        emit(success.copyWith(newCounterValue));
        break;
    }
  }

  void _initialize() async {
    final counterEntity = await _counterRepository.getCounter();
    emit(CounterSuccess(counterEntity.value));
  }
}
