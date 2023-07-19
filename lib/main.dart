import 'package:flutter/material.dart';
import 'package:sample_project/screen_home.dart';
import 'package:sample_project/screen_profile.dart';
import 'package:sample_project/screen_search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // converted to statefulwidget for bottom navigation and not for ValueNotifier
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<int> _counter = ValueNotifier(0);

  int _currSelectedIndex = 0;

  final _pages = [
    ScreenHome(),
    ScreenSearch(),
    ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: _pages[_currSelectedIndex],
      // ----- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currSelectedIndex,
          onTap: (newIndex) {
            setState(() {
              _currSelectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
