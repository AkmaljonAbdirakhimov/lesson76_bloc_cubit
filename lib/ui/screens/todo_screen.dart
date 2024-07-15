import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson76_bloc_cubit/logic/blocs/counter/counter_bloc.dart';
import 'package:lesson76_bloc_cubit/logic/blocs/todo/todo_bloc.dart';

import '../../logic/cubits/all_cubits.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      context.read<TodoCubit>().getTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.watch<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(counterBloc.state.counter.toString()),
        actions: [
          IconButton(
            onPressed: () {
              counterBloc.add(DecrementCounterEvent());
              // String title = "yangi Todo";
              // String id = UniqueKey().toString();

              // context.read<TodoCubit>().addTodo(title, id);
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              // counterBloc.add(IncrementCounterEvent());
              String title = "Salom Todo";
              String id = UniqueKey().toString();

              context.read<TodoBloc>().add(AddTodoEvent(title, false));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: Text("Ma'lumot hali yuklanmadi"),
            );
          }

          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorState) {
            return Center(
              child: Text(state.message),
            );
          }

          final todos = (state as LoadedState).todos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(todos[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
