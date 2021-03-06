import 'package:flutter/material.dart';

abstract class AuthPage extends StatefulWidget {

  @override
  AuthPageState<AuthPage> createState();

}

abstract class AuthPageState<T extends AuthPage> extends State<T> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.orange,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Theme(
          data: ThemeData(
              primaryColor: Colors.white,
              accentColor: Colors.orange,
              hintColor: Colors.white
          ),
          child: Center(
            child: SingleChildScrollView(
              child: body(context),
            ),
          )
        ),
      ),

    );
  }

}