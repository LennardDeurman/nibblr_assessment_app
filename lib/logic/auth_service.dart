import 'dart:async';

import 'package:nibblr/models/auth.dart';
import 'package:nibblr/models/login.dart';
import 'package:nibblr/network/api.dart';

class AuthService {


  final Api _api = Api();

  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }



  AuthService._internal ();

  Future<AuthResult> login(LoginData loginData) async {
    var authResult = await _api.login(loginData);
    return authResult;
  }



}