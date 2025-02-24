import 'package:flutter/material.dart';
import 'package:examen_final_mezquita/utils/shared_preferences_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  _loadCredentials() async {
    String? username = await SharedPreferencesService.getUsername();
    String? password = await SharedPreferencesService.getPassword();
    bool rememberMe = await SharedPreferencesService.getRememberMe();

    if (rememberMe) {
      setState(() {
        _usernameController.text = username ?? '';
        _passwordController.text = password ?? '';
        _rememberMe = true;
      });
    }
  }

  _login() async {
    if (_rememberMe) {
      await SharedPreferencesService.saveCredentials(
        _usernameController.text,
        _passwordController.text,
        true,
      );
    } else {
      await SharedPreferencesService.saveCredentials('', '', false);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _rememberMe,
                  onChanged: (bool? value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text("Remember Me"),
              ],
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
