sealed class CounterState {
  const CounterState();
}

final class CounterLoading extends CounterState {
  const CounterLoading() : super();
}

final class CounterSuccess extends CounterState {
  const CounterSuccess(this.value) : super();

  final int value;

  CounterSuccess copyWith(int newValue) => CounterSuccess(newValue);
}
