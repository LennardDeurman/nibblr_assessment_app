import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/auth/login.dart';
import 'package:nibblr/helpers/progress_dialog.dart';
import 'package:nibblr/models/login.dart';
import 'package:nibblr/network/api.dart';
import 'package:nibblr/pages/auth/base.dart';
import 'package:nibblr/pages/home/main.dart';



class LoginPage extends AuthPage {

  @override
  AuthPageState<AuthPage> createState() {
    return _LoginPageState();
  }

}

class _LoginPageState extends AuthPageState<LoginPage> {

  void onSubmit(LoginData loginData) {
    Future future = Api().login(loginData);
    ProgressDialogHelper.attach(context, future);
    future.then((v) {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Successvol ingelogd")));
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePage();
          }
        ));
      });
    });
    future.catchError((e) {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Er ging iets mis, check je logingegevens!")));
    });
  }

  @override
  Widget body(BuildContext context) {
    return LoginForm(
      onSubmit: (loginData) => onSubmit(loginData),
    );
  }

}