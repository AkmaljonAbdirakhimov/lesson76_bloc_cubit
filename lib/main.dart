import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lesson76_bloc_cubit/data/repositories/todos_repository.dart';
import 'package:lesson76_bloc_cubit/logic/blocs/counter/counter_bloc.dart';
import 'package:lesson76_bloc_cubit/logic/blocs/todo/todo_bloc.dart';
import 'package:lesson76_bloc_cubit/services/todo_http_service.dart';

import 'logic/cubits/all_cubits.dart';

import 'core/app.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) {
            return TodosRepository(TodoHttpService());
          },
        ),
        RepositoryProvider(
          create: (context) {
            return MockTodoRepository();
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) {
            return CounterCubit();
          }),
          BlocProvider(create: (context) {
            return TodoCubit(context.read<TodosRepository>());
          }),
          BlocProvider(create: (ctx) {
            return CounterBloc();
          }),
          BlocProvider(create: (ctx) {
            return TodoBloc(ctx.read<TodosRepository>());
          }),
        ],
        child: const MainApp(),
      ),
    ),
  );
}
