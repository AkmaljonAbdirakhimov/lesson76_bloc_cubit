//! InitialState - boshlang'ich holat
//! LoadingState - yuklanish holati
//! LoadedState - yuklanib bo'lgan holati
//! ErrorState - xatolik holati

import '../../data/models/todo.dart';

sealed class TodoState {}

final class InitialState extends TodoState {}

final class LoadingState extends TodoState {}

final class LoadedState extends TodoState {
  List<Todo> todos = [];

  LoadedState(this.todos);
}

final class ErrorState extends TodoState {
  String message;

  ErrorState(this.message);
}
