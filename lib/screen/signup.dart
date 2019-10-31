import 'package:flutter/material.dart';
import 'package:insta_fire/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = 'sign up';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _formSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_name);
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
                      onSaved: (value) => _name = value,
                      validator: (value) =>
                          value.trim().isEmpty ? "Name cann\'t be blank" : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          contentPadding: const EdgeInsets.all(10.0),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Name',
                          hintText: 'Please enter your name'),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      onSaved: (value) => _email = value,
                      validator: (value) => !value.contains('@')
                          ? 'Please enter a valid email'
                          : null,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          contentPadding: const EdgeInsets.all(10.0),
                          prefixIcon: Icon(Icons.mail),
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
                          RaisedButton(
                            onPressed: _formSubmit,
                            child: Text('Log In'),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RaisedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Back to Login'),
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
