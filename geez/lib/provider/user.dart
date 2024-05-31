// ignore_for_file: prefer_final_fields

import 'package:flutter/widgets.dart';
import 'package:geez/controller/auth.dart';
import 'package:geez/model/userModel.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  AuthMethods _authMethods = AuthMethods();

  User? get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
