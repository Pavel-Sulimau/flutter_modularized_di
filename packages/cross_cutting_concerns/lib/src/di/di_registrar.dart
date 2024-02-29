import 'dart:async';

import 'package:cross_cutting_concerns/src/di/di.dart';

typedef FactoryFunc<T> = T Function();
typedef FactoryWithParamFunc<T, P> = T Function(P param);
typedef DisposingFunc<T> = FutureOr<void> Function(T instance);

/// This interface must be exposed only to [ModuleDependencies] and the actual
/// implementation of the DI abstraction, the rest should just use [DI]
/// interface.
abstract interface class DIRegistrar implements DI {
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  });

  void registerFactoryWithParam<T extends Object, P1>(
    FactoryWithParamFunc<T, P1> factoryFunc, {
    String? instanceName,
  });

  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  });

  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  });
}
