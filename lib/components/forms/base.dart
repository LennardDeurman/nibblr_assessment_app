import 'package:flutter/material.dart';
import 'package:nibblr/helpers/validators.dart';

class FormTextFields {

  Widget multiLineTextField(BuildContext context, { @required TextEditingController controller, @required String labelText, @required String hintText, int minLines = 3, int maxLines = 5, bool required = true }) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      minLines: minLines,
      maxLines: maxLines,
      validator: required ? Validators(context).notEmptyValidator : null,
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

  Widget textFormField(BuildContext context, { @required TextEditingController controller, @required String labelText, @required String hintText, bool obscure = false, bool required = true }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: required ? Validators(context).notEmptyValidator : null,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          contentPadding: EdgeInsets.only(
              bottom: 18
          )
      ),
    );
  }

}