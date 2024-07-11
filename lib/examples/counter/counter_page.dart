import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson76_bloc_cubit/examples/counter/counter_cubit.dart';
import 'package:lesson76_bloc_cubit/examples/counter/counter_stream.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            icon: Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(state.toString());
          },
        ),
      ),
    );
  }
}
