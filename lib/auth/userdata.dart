
import 'package:flutter/material.dart';

class UserData {
  late String email;
  late String password;
  UserData({
    required this.email,
    required this.password,
  });

  
}

class UserProvider extends ChangeNotifier {
  List<UserData> users = [];

  void addUser(UserData user) {
    users.add(user);
    notifyListeners();
  }

  bool loginUser (String email, String password) {
    for (var user in users) {
      if (user.email == email && user.password == password) 
      {
        return true;
      }
    }
    return false;
  }
}
