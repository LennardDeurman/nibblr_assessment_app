
import 'package:flutter/foundation.dart';
import 'package:nibblr/models/address.dart';
import 'package:nibblr/models/base.dart';

class RegistrationDataKeys {
  static const String firstName = "first_ame";
  static const String lastName = "last_name";
  static const String bio = "bio";
  static const String email = "email";
  static const String password = "password";
  static const String passwordConfirmation = "password_confirmation";
  static const String address = "address";
}

class RegistrationData with Mappable {

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirmation;
  final Address address;
  final String bio;

  RegistrationData({ @required this.firstName, @required this.lastName, @required this.email,
    @required this.password, @required this.passwordConfirmation, @required this.address, this.bio });

  @override
  Map<String, dynamic> toMap() {
    return {
      RegistrationDataKeys.firstName: firstName,
      RegistrationDataKeys.lastName: lastName,
      RegistrationDataKeys.email: email,
      RegistrationDataKeys.password: password,
      RegistrationDataKeys.passwordConfirmation: passwordConfirmation,
      RegistrationDataKeys.bio: bio,
      RegistrationDataKeys.address: address.toMap()
    };
  }

}