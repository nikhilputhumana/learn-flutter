import 'package:flutter/material.dart';
import 'package:sample_project/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Center(child: Text('Welcome to \nHome Screen')),
      ),
    );
  }

  signOut(ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
