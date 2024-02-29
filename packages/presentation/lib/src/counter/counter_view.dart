import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/counter/counter_cubit.dart';
import 'package:presentation/src/counter/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Modularized DI Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('The counter value is:'),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) => switch (state) {
                final CounterLoading _ => const CircularProgressIndicator(),
                final CounterSuccess success => Text(
                    success.value.toString(),
                    style: textTheme.headlineMedium,
                  ),
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
        ],
      ),
    );
  }
}
