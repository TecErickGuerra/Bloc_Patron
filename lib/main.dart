import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter/counter_bloc.dart';
import 'counter/counter_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_)=>CounterBloc(),
      child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter con BLoC'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count){
            return Text(
              '$count',
              style: const TextStyle(fontSize: 48),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:() => context.read<CounterBloc>().add(CounterIncremented()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}