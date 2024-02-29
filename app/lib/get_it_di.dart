import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:get_it/get_it.dart' hide FactoryFunc, DisposingFunc;

class GetItDI implements DIRegistrar {
  final GetIt _getIt = GetIt.instance;

  @override
  T call<T extends Object>({String? instanceName}) =>
      get(instanceName: instanceName);

  @override
  T get<T extends Object>({String? instanceName}) =>
      _getIt.get(instanceName: instanceName);

  @override
  T getWithParam<T extends Object, P>(
    P param, {
    String? instanceName,
  }) =>
      _getIt.get(instanceName: instanceName, param1: param);

  @override
  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerFactoryWithParam<T extends Object, P>(
    FactoryWithParamFunc<T, P> factoryWithParamFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactoryParam<T, P, void>(
      (p, _) => factoryWithParamFunc(p),
      instanceName: instanceName,
    );
  }

  @override
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  }) {
    _getIt.registerSingleton(
      instance,
      instanceName: instanceName,
      dispose: disposingFunc,
    );
  }

  @override
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  }) {
    _getIt.registerLazySingleton(
      factoryFunc,
      instanceName: instanceName,
      dispose: disposingFunc,
    );
  }
}
