import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson76_bloc_cubit/cubits/todo/todo_cubit.dart';
import 'package:lesson76_bloc_cubit/examples/counter/counter_cubit.dart';
import 'package:lesson76_bloc_cubit/ui/screens/todo_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return CounterCubit();
        }),
        BlocProvider(create: (context) {
          return TodoCubit();
        }),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
