import 'package:domain/src/counter_entity.dart';

abstract interface class CounterRepository {
  Future<CounterEntity> getCounter();

  Future<void> saveCounter(CounterEntity counterEntity);
}
