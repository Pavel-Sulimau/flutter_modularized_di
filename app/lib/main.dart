import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modularized_di/app.dart';
import 'package:flutter_modularized_di/get_it_di.dart';
import 'package:presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final di = GetItDI();

  final modules = <ModuleDependencies>[
    DomainModuleDependencies(),
    PresentationModuleDependencies(),
    DataModuleDependencies(),
  ];

  for (final module in modules) {
    await module.register(di);
  }

  for (final module in modules) {
    await module.runPostRegistrationActions(di);
  }

  runApp(App(di: di));
}
