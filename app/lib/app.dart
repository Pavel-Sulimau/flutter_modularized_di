import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key, required this.di});

  final DI di;

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(),
        builder: (context, child) => Provider<DI>.value(
          value: di,
          child: child,
        ),
      );
}
