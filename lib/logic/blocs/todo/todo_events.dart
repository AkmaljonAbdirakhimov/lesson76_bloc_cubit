part of 'todo_bloc.dart';

sealed class TodoEvents {}

final class AddTodoEvent extends TodoEvents {
  final String title;
  final bool isDone;

  AddTodoEvent(this.title, this.isDone);
}

final class EditTodoEvent extends TodoEvents {
  final String id;
  final String title;
  final bool isDone;

  EditTodoEvent(this.id, this.title, this.isDone);
}

final class GetTodosEvent extends TodoEvents {}

final class DeleteTodoEvent extends TodoEvents {
  final String id;

  DeleteTodoEvent(this.id);
}
