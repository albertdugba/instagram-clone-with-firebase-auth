import 'package:flutter/material.dart';
import 'package:insta_fire/screen/signup.dart';
import 'package:insta_fire/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  _formSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('DreamConsult', style: kBrandTextStyle),
              SizedBox(height: 10.0),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      onSaved: (value) => _email = value,
                      validator: (value) => !value.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          contentPadding: const EdgeInsets.all(10.0),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Email',
                          hintText: 'Please enter your email'),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) => _password = value,
                      validator: (value) => value.length < 6
                          ? 'Password is too short [hint:6]'
                          : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          prefixIcon: Icon(Icons.lock),
                          contentPadding: const EdgeInsets.all(10.0),
                          labelText: 'Password',
                          hintText: 'Please enter your password'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.blue[900],
                            onPressed: _formSubmit,
                            child: Text(
                              'Log In',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          FlatButton(
                            color: Colors.blue[900],
                            onPressed: () =>
                                Navigator.pushNamed(context, SignUpScreen.id),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
