import 'package:flutter/material.dart';

class FormTextFields {

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

}