import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  final _list = [
    'Apple',
    'Orange',
    'Banana',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: DropdownButtonFormField(
              hint: Text('Select the fruit'),
              items: _list.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                print(value);
              })),
    );
  }
}
