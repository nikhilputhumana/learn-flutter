import 'package:flutter/material.dart';
import 'package:sample_project/old/screen_2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  final _textCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textCntrl,
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text("Submit"),
            )
          ],
        ),
      )),
    );
  }

  Future<void> saveData() async {
    print(_textCntrl.text);

    // Shared preference
    final share = await SharedPreferences.getInstance();

    // Save value
    await share.setString('saved_val', _textCntrl.text);
  }
}

Future<void> getSavedData(BuildContext context) async {
  final share = await SharedPreferences.getInstance();
  final savedVal = share.getString('saved_val');

  if (savedVal != null) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ScreenTwo(),
      ),
    );
  }
}
