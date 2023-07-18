import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  // final String name;
  const ScreenTwo({super.key});   // ,required this.name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
        // title: Text(name),
      ),
      body: SafeArea(
          child: Column(
        children: [
          // Text("Screen two"),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: Text('Go back')),
          Text('Value found'),
        ],
      )),
    );
  }
}
