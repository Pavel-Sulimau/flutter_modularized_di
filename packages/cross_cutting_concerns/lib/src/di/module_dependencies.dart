import 'package:cross_cutting_concerns/src/di/di_registrar.dart';

/// This abstract class must be implemented by all the modules that have
/// dependencies. The modules are supposed to encapsulate the implementation
/// details and expose only what is necessary.
abstract class ModuleDependencies {
  Future<void> register(DIRegistrar di);

  Future<void> runPostRegistrationActions(DIRegistrar di) => Future.value();
}
