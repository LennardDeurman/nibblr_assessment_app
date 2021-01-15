import 'package:flutter/material.dart';
import 'package:nibblr/components/forms/base.dart';

abstract class AuthForm extends StatefulWidget {

  @override
  AuthFormState<AuthForm> createState();

}

abstract class AuthFormState<T extends AuthForm> extends State<T> with FormTextFields {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget submitButton({ @required String labelText }) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
          vertical: 14
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
            color: Colors.white,
            width: 1
        ),
      ),
      child: Text(labelText, style: TextStyle(
          color: Colors.white,
          fontSize: 16
      )),
      onPressed: onSubmitPressed,

    );
  }

  void onSubmitPressed() {
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children(context),
      ),
    );
  }

  List<Widget> children(BuildContext context);


}