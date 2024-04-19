import 'package:alchemist/alchemist.dart';
import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

GoldenTestGroup createGoldenTestGroup({
  required Widget child,
  required DI di,
  double minWidth = 300,
  double maxWidth = 600,
  double minHeight = 400,
  double maxHeight = 800,
}) {
  final themes = {
    'light theme': ThemeData.light(),
    'dark theme': ThemeData.dark(),
  };

  return GoldenTestGroup(
    scenarioConstraints: BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    ),
    children: [
      for (final theme in themes.entries)
        GoldenTestScenario(
          name: theme.key,
          child: Provider<DI>.value(
            value: di,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme.value,
              home: child,
            ),
          ),
        ),
    ],
  );
}
