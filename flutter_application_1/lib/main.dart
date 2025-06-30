import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();  
  }
}

class CounterViewModel {
  final CounterModel model;

  CounterViewModel(this.model);
  
  int get count => model.counter;
  
  void incrementCounter() => model.increment();
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('MVVM Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<CounterModel>(
                builder: (context, model, child) => Text('Count: ${model.counter}'),
              ),
              ElevatedButton(
                onPressed: () => Provider.of<CounterModel>(context, listen: false).increment(),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}