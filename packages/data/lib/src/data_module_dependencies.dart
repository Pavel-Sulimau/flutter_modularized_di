import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:data/src/shared_preferences_counter_repository.dart';
import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataModuleDependencies extends ModuleDependencies {
  @override
  Future<void> register(DIRegistrar di) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    di.registerFactory<CounterRepository>(
      () => SharedPreferencesCounterRepository(sharedPreferences),
    );
  }
}
