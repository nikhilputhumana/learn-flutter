import 'package:flutter/material.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usrnameController = TextEditingController();

  final _pswdController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usrnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                validator: (value) {
                  // if (_isDataMatched) {
                  //   return null;
                  // } else {
                  //   return 'Error';
                  // }

                  if (value == null || value.isEmpty) {
                    return 'Value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _pswdController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Value is empty';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 40,
                child: Visibility(
                  visible: !_isDataMatched,
                  child: Center(
                    child: Text(
                      'Invalid Credentials',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkLogin(context);
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Login')),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void checkLogin(BuildContext ctx) async {
    final _usrname = _usrnameController.text;
    final _pswd = _pswdController.text;

    if (_usrname == _pswd) {
      // Go to Home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      // Snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        margin: EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        content: Text('Invalid Credentials'),
      ));

      // Alert dialog (popup)
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid Credentials'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: Text('Close'),
                )
              ],
            );
          });

      // Show text
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
