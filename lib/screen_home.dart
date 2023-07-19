import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  ValueNotifier<int> _counter = ValueNotifier(0);

  void _incrementCounter() {
    _counter.value = _counter.value + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                showBottomSheet(context);
              },
              child: Text('Open BottomSheet'),
            )
          ],
        ),
      ),

      // --- FloatingActionButton can only be used in Scaffold. Therefore commented out ---
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  Future<void> showBottomSheet(BuildContext ctx) async {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          width: double.infinity,
          height: 300,
          color: Colors.yellow,
          child: ListView(
            children: [
              Text('Title'),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: Text('close'))
            ],
          ),
        );
      },
    );
  }
}
