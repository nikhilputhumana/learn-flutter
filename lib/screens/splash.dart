import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/screens/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    goToLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC529),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'LIVIN\' TO',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Anton',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
            ),
            Text(
              'BAKE',
              style: TextStyle(
                fontSize: 85,
                fontFamily: 'Anton',
                shadows: [
                  Shadow(
                    color: Color.fromARGB(135, 0, 0, 0),
                    offset: Offset(2, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }
}
