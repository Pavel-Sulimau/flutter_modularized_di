import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCounterRepository implements CounterRepository {
  const SharedPreferencesCounterRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _counterKey = 'counter_value_v1';

  @override
  Future<CounterEntity> getCounter() async {
    final counterValue = _sharedPreferences.getInt(_counterKey);

    return counterValue == null
        ? CounterEntity.empty()
        : CounterEntity(counterValue);
  }

  @override
  Future<void> saveCounter(CounterEntity counterEntity) async {
    await _sharedPreferences.setInt(_counterKey, counterEntity.value);
  }
}
