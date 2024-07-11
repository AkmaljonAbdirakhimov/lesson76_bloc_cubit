import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson76_bloc_cubit/cubits/todo/todo_cubit.dart';
import 'package:lesson76_bloc_cubit/cubits/todo/todo_state.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        actions: [
          IconButton(
            onPressed: () {
              String title = "yangi Todo";
              String id = UniqueKey().toString();

              context.read<TodoCubit>().addTodo(title, id);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          print(state);
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
