import 'package:bloc_example/business/cubit/counter_cubit.dart';
import 'package:bloc_example/presentation/screens/second%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listenWhen: (prev, cur) => true,
              listener: (context, state) {
                if (state.counterValue > 5) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Stop, the number is bigger than 5 🥵'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state.counterValue < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Nooo, the number is less than 0 😭'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Yay!'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/2');
                },
                child: const Text('Push to 2nd screen'),
              ),
              const SizedBox(width: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/3');
                },
                child: const Text('Push to 3rd screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
