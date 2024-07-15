part of 'counter_bloc.dart';

sealed class CounterEvents {}

final class IncrementCounterEvent extends CounterEvents {}

final class DecrementCounterEvent extends CounterEvents {}
