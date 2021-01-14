import 'package:flutter/material.dart';

abstract class AuthPage extends StatefulWidget {

  @override
  AuthPageState<AuthPage> createState();

}

abstract class AuthPageState<T extends AuthPage> extends State<T> {

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Theme(
          data: ThemeData(
              primaryColor: Colors.white,
              accentColor: Colors.orange,
              hintColor: Colors.white
          ),
          child: body(context),
        ),
      ),

    );
  }

}