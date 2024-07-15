part of 'todo_bloc.dart';

// sealed - bu abstract class faqat shu fayl ichida ishlaydi
sealed class TodoStates {}

final class InitialTodoState extends TodoStates {}

final class LoadingTodoState extends TodoStates {}

final class LoadedTodoState extends TodoStates {}

final class ErrorTodoState extends TodoStates {
  final String message;

  ErrorTodoState(this.message);
}
