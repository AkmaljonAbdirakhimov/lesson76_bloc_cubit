import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/todo.dart';
import '../../../data/repositories/todos_repository.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit(
    this.interfaceTodoRepository,
  ) : super(InitialState());
  final InterfaceTodoRepository interfaceTodoRepository;
  List<Todo> todos = [];

  Future<void> getTodos() async {
    try {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 2));

      todos.add(
        Todo(id: "todo1", title: "Birinchi vazifa"),
      );

      // throw("Xatolik");

      emit(LoadedState(todos));
    } catch (e) {
      print("Xatolik sodir bo'ldi");
      emit(ErrorState("Rejalarni ololmadim"));
    }
  }

  Future<void> addTodo(String title, String id) async {
    try {
      if (state is LoadedState) {
        todos = (state as LoadedState).todos;
      }

      emit(LoadingState());
      await interfaceTodoRepository.addTodo(title, false);

      todos.add(Todo(id: id, title: title));
      emit(LoadedState(todos));
    } catch (e) {
      print("Qo'shishda xatolik");
      emit(ErrorState("Qo'shishda xatolik"));
    }
  }
}
