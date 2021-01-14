import 'package:flutter/material.dart';

abstract class AuthForm extends StatefulWidget {

  @override
  AuthFormState<AuthForm> createState();

}

abstract class AuthFormState<T extends AuthForm> extends State<T> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget multiLineTextField({ @required TextEditingController controller, @required String labelText, @required String hintText, int minLines = 3, int maxLines = 5 }) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: EdgeInsets.only(
              bottom: 18
          )
      ),
    );
  }

  Widget textFormField({ @required TextEditingController controller, @required String labelText, @required String hintText }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: EdgeInsets.only(
              bottom: 18
          )
      ),
    );
  }

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children(context),
      ),
    );
  }

  List<Widget> children(BuildContext context);


}