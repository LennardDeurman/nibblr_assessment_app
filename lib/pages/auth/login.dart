import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/auth/login.dart';
import 'package:nibblr/pages/auth/base.dart';



class LoginPage extends AuthPage {

  @override
  AuthPageState<AuthPage> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends AuthPageState<LoginPage> {

  @override
  Widget body(BuildContext context) {
    return LoginForm();
  }

}