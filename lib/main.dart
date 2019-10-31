import 'package:flutter/material.dart';
import 'package:insta_fire/screen/login.dart';
import 'package:insta_fire/screen/signup.dart';

void main() => runApp(Application());

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen()
      },
    );
  }
}
