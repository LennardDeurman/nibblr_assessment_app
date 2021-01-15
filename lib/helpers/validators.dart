import 'package:flutter/material.dart';

class Validators {

  final BuildContext buildContext;

  Validators (this.buildContext);

  String notEmptyValidator(String value) {
    if (value != null && value.isNotEmpty)
      return null;
    return "Dit veld is verplicht!";
  }

}