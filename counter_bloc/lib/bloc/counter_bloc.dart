import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0, 0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {  
    switch (event) {
      case CounterEvent.increment:
        yield CounterState(state.value + 1, state.hits + 1);
        break;
      case CounterEvent.decrement:
        yield CounterState(state.value - 1, state.hits + 1);
        break;
      case CounterEvent.reset:
        yield CounterState(0, 0);
        break;
      default:
    }
  }
}
