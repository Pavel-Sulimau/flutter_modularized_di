import 'package:equatable/equatable.dart';

sealed class CounterState extends Equatable {
  const CounterState();
}

final class CounterLoading extends CounterState {
  const CounterLoading() : super();

  @override
  List<Object?> get props => [];
}

final class CounterSuccess extends CounterState {
  const CounterSuccess(this.value) : super();

  final int value;

  CounterSuccess copyWith(int newValue) => CounterSuccess(newValue);

  @override
  List<Object?> get props => [value];
}
