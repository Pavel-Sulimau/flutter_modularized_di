import 'package:domain/src/counter_entity.dart';
import 'package:test/test.dart';

void main() {
  group('CounterEntity', () {
    test('copyWith returns a new entity with the given value', () {
      const newValue = 10;
      final counterEntity = CounterEntity(5);

      final updatedCounterEntity = counterEntity.copyWith(newValue);

      expect(updatedCounterEntity.value, newValue);
    });

    test('empty constructor creates a new entity with 0 value', () {
      final counterEntity = CounterEntity.empty();

      expect(counterEntity.value, 0);
    });
  });
}
