import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson76_bloc_cubit/data/repositories/todos_repository.dart';

part 'todo_events.dart';
part 'todo_states.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates> {
  TodoBloc(this.interfaceTodoRepository) : super(InitialTodoState()) {
    on<GetTodosEvent>(_getTodos);
    on<AddTodoEvent>(_addTodo);
  }

  final InterfaceTodoRepository interfaceTodoRepository;

  void _addTodo(AddTodoEvent event, emit) async {
    emit(LoadingTodoState());

    try {
      await interfaceTodoRepository.addTodo(event.title, event.isDone);

      emit(LoadedTodoState());
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }

  void _getTodos(GetTodosEvent event, emit) async {}
}
