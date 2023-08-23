import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // sum(1,2,3);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: const Text("+")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$_counter"),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter--;
                  });
                },
                child: const Text("_"))
          ],
        ),
      ),
    );
  }
}
