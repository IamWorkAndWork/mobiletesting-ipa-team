import 'package:flutter/material.dart';
import 'package:mobiletesting/home_screen/user_service.dart';

class HomeViewModel extends ChangeNotifier {
  Map<String, dynamic> _userDetails = {};

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> onDidLoad() async {
    _userDetails = await UserService().fetchUserDetails();
    notifyListeners();
  }
}
