import 'package:flutter/foundation.dart';
import 'package:nibblr/models/base.dart';

class LoginDataKeys {
  static const String email = "email";
  static const String password = "password";
}

class LoginData with Mappable {

  final String email;
  final String password;

  LoginData ({ @required this.email, @required this.password });

  @override
  Map<String, dynamic> toMap() {
    return {
      LoginDataKeys.email: email,
      LoginDataKeys.password: password
    };
  }

}