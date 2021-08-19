part of 'counter_bloc.dart';

@immutable
class CounterState {
  final int value;
  final int hits;
  const CounterState(this.value, this.hits);
}

class CounterInitial extends CounterState {
  CounterInitial(int valueNew, int hitsNew) : super(valueNew, hitsNew);
  @override
  String toString() => 'Current Value $value { total hits: $hits }';
}
