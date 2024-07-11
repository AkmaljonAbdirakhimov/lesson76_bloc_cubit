import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    // int newValue = state + 1;
    // streamController.add(state+1)
    emit(state + 1);
  }

  void decrement() {
    // int newValue = state + 1;
    // streamController.add(state-1)
    emit(state - 1);
  }
}
