import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_events.dart';
part 'counter_states.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialCounterState(0)) {
    on<IncrementCounterEvent>(_increment);
    on<DecrementCounterEvent>(_decrement);
  }

  void _increment(event, emit) {
    emit(LoadingCounterState(state.counter));
    emit(LoadedCounterState(state.counter + 1));
  }

  void _decrement(event, emit) {
    emit(LoadingCounterState(state.counter));
    emit(LoadedCounterState(state.counter - 1));
  }
}
