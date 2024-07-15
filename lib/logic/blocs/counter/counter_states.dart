part of 'counter_bloc.dart';

// sealed - bu abstract class faqat shu fayl ichida ishlaydi
sealed class CounterStates {
  final int counter;

  CounterStates(this.counter);
}

final class InitialCounterState extends CounterStates {
  InitialCounterState(super.counter);
}

final class LoadingCounterState extends CounterStates {
  LoadingCounterState(super.counter);
}

final class LoadedCounterState extends CounterStates {
  LoadedCounterState(super.counter);
}

final class ErrorCounterState extends CounterStates {
  final String message;

  ErrorCounterState(super.counter, this.message);
}
