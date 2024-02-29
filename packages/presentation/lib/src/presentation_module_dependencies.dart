import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:presentation/src/counter/counter_cubit.dart';

class PresentationModuleDependencies extends ModuleDependencies {
  @override
  Future<void> register(DIRegistrar di) async {
    di.registerFactory<CounterCubit>(
      () => CounterCubit(di()),
    );
  }
}
