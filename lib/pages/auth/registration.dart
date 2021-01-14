import 'package:flutter/material.dart';
import 'package:nibblr/pages/auth/base.dart';

class RegistrationPage extends AuthPage {

  @override
  AuthPageState<AuthPage> createState() {
    return _RegistrationPageState();
  }

}

class _RegistrationPageState extends AuthPageState<RegistrationPage> {

  @override
  Widget body(BuildContext context) {
    return RegistrationPage();
  }

}