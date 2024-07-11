import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson76_bloc_cubit/cubits/todo/todo_state.dart';
import 'package:lesson76_bloc_cubit/data/models/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitialState());
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
      await Future.delayed(const Duration(seconds: 2));
      // await todoHttpService.getTodos();

      todos.add(Todo(id: id, title: title));
      emit(LoadedState(todos));
    } catch (e) {
      print("Qo'shishda xatolik");
      emit(ErrorState("Qo'shishda xatolik"));
    }
  }
}
