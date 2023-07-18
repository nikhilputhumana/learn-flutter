import 'dart:math';

import 'package:flutter/material.dart';

class ListHome extends StatelessWidget {
  const ListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listview Sample Project"),
        ),
        body: SafeArea(
          child: ListView.separated(
            padding: EdgeInsets.only(left: 10),
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage(
                      'aseets/images/30. H5 Light Effect Background Design.jpg'),
                ),
                title: Text('Name $index'),
                subtitle: Text('Message from $index'),
                trailing: Text('1$index:00 PM'),
              );
            },
          ),
        ));
  }
}
