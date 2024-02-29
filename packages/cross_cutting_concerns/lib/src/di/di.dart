abstract interface class DI {
  T call<T extends Object>({String? instanceName});

  T get<T extends Object>({String? instanceName});

  T getWithParam<T extends Object, P>(
    P param, {
    String? instanceName,
  });
}
