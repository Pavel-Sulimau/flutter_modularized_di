import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';

class DomainModuleDependencies extends ModuleDependencies {
  @override
  Future<void> register(DIRegistrar di) {
    // Nothing to register as for now.
    return Future.value();
  }
}
