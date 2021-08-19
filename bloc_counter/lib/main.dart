import 'dart:developer';

import 'package:bloc_counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).increment(),
                tooltip: 'Increment',
                child: Icon(Icons.plus_one),
              ),
              Center(
                child: BlocBuilder<CounterCubit, int>(
                  builder: (context, state) {
                    return Text(
                      BlocProvider.of<CounterCubit>(context).state.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<CounterCubit>(context).decrement(),
                tooltip: 'Increment',
                child: Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
