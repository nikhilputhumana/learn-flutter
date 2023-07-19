import 'package:flutter/material.dart';
import 'package:sample_project/old/main5.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          _counter.toString(),
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter = _counter + 1;
          });
        },
      ),
    );
  }
}
