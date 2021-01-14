import 'package:nibblr/models/base.dart';
import 'package:nibblr/models/user.dart';

class AuthResultKeys {
  static const String accessToken = "access_token";
  static const String user = "user";
}

class AuthResult with Parsable {

  String accessToken;
  User user;

  AuthResult(Map<String, dynamic> dictionary) {
    parse(dictionary);
  }

  @override
  void parse(Map<String, dynamic> dictionary) {
    accessToken = dictionary[AuthResultKeys.accessToken];
    user = User(dictionary[AuthResultKeys.user]);
  }



}
