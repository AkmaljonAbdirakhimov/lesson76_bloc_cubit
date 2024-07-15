import 'package:lesson76_bloc_cubit/services/todo_http_service.dart';

abstract class InterfaceTodoRepository {
  Future<void> getTodo();
  Future<void> addTodo(String title, bool isDone);
  Future<void> editTodo(String id, String newTitle, bool isDone);
  Future<void> deleteTodo(String id);
}

class TodosRepository implements InterfaceTodoRepository {
  final TodoHttpService todoHttpService;

  TodosRepository(this.todoHttpService);

  @override
  Future<void> getTodo() async {
    // await todoHttpService.addTodo(title, isDone);
  }

  @override
  Future<void> addTodo(String title, bool isDone) async {
    await todoHttpService.addTodo(title, isDone);
  }

  @override
  Future<void> editTodo(String id, String title, bool isDone) async {
    // await todoHttpService.addTodo(title, isDone);
  }

  @override
  Future<void> deleteTodo(String id) async {
    // await todoHttpService.addTodo(title, isDone);
  }
}

class MockTodoRepository implements InterfaceTodoRepository {
  @override
  Future<void> addTodo(String title, bool isDone) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<void> editTodo(String id, String newTitle, bool isDone) {
    // TODO: implement editTodo
    throw UnimplementedError();
  }

  @override
  Future<void> getTodo() {
    // TODO: implement getTodo
    throw UnimplementedError();
  }
}
