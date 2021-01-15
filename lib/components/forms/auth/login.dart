import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/auth/base.dart';
import 'package:nibblr/models/login.dart';

class LoginForm extends AuthForm {

  LoginForm ({ Function(dynamic) onSubmit }) : super(onSubmit: onSubmit);

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
  collectData() {
    return LoginData(
      email: _emailTextController.text,
      password: _passwordTextController.text
    );
  }

  @override
  List<Widget> children(BuildContext context) {
    return [
      Container(
        margin: EdgeInsets.symmetric(
          vertical: 10
        ),
        child: textFormField(
            context,
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
            context,
            controller: _passwordTextController,
            labelText: "Wachtwoord",
            obscure: true,
            hintText: "******",

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