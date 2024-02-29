class CounterEntity {
  const CounterEntity(this.value);

  const CounterEntity.empty() : this(0);

  final int value;

  CounterEntity copyWith(int newValue) => CounterEntity(newValue);
}
