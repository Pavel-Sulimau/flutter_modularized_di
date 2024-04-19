import 'package:cross_cutting_concerns/cross_cutting_concerns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/counter/counter_cubit.dart';
import 'package:presentation/src/counter/counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<CounterCubit>(
        create: (_) => context.read<DI>().get()..initialize(),
        child: const CounterView(),
      );
}
