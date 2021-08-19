import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
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
                onPressed: () => BlocProvider.of<CounterBloc>(context)
                    .add(CounterEvent.increment),
                tooltip: 'Increment',
                child: Icon(Icons.plus_one),
              ),
              Center(
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    CounterState currState = context.read<CounterBloc>().state;
                    return Text(
                      "Hits : ${currState.hits} & Value : ${currState.value}",
                      style: Theme.of(context).textTheme.headline6,
                    );
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () => BlocProvider.of<CounterBloc>(context)
                    .add(CounterEvent.decrement),
                tooltip: 'Increment',
                child: Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            BlocProvider.of<CounterBloc>(context).add(CounterEvent.reset),
        tooltip: 'Increment',
        child: Icon(Icons.undo),
      ),
    );
  }
}
