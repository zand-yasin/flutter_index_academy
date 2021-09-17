import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _email = "";

  addEmail(String email) {
    this._email = email;
    notifyListeners();
  }

  getemail() {
    return _email;
  }
}
