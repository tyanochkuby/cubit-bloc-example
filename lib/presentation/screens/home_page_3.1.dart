import 'package:bloc_example/business/cubit/counter_cubit_3.0.dart';
import 'package:bloc_example/business/cubit/internet_cubit.dart';
import 'package:bloc_example/constanst/enums.dart';
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
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, internetState) {
        if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi)
                  return const Text("wifi");
                else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile)
                  return const Text('mobile');
                else if (state is InternetDisconnected)
                  return const Text('disconnected');
                else
                  return CircularProgressIndicator();
              }),
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
                    heroTag: "btnDecrement",
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    tooltip: 'Increment',
                    heroTag: "btnIncrement",
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
