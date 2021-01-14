import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/auth/base.dart';

class LoginForm extends AuthForm {

  @override
  AuthFormState<AuthForm> createState() {
    return LoginFormState();
  }

}

class LoginFormState extends AuthFormState<LoginForm> {

  TextEditingController _emailTextController;

  TextEditingController _passwordTextController;


  @override
  void initState() {
    _passwordTextController = TextEditingController();
    _emailTextController = TextEditingController();
    super.initState();
  }

  @override
  List<Widget> children(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 10
        ),
        child: textFormField(
            controller: _emailTextController,
            labelText: "Email",
            hintText: "Bijv. info@nibblr.nl"
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 10
        ),
        child: textFormField(
            controller: _passwordTextController,
            labelText: "Wachtwoord",
            hintText: "******"
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(
            vertical: 20
        ),
        child: submitButton(labelText: "Inloggen")
      )
    ];
  }

}