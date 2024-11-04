// pin_view_model.dart
import 'package:flutter/material.dart';
import 'package:mobiletesting/home_screen/home_screen.dart';
import 'package:mobiletesting/home_screen/home_view_model.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  String _inputtedPin = '';
  bool _isLoading = false;

  final LoginService loginService;
  final SortOrder keyPadsortOrder;

  LoginViewModel(this.loginService, this.keyPadsortOrder);

  String get inputtedPin => _inputtedPin;

  List get enteredDigits => _enteredDigits;

  bool get isLoading => _isLoading;

  final List<String> _enteredDigits =
      List.filled(6, ""); // Assuming a fixed size of 6
  int _currentIndex = 0;

  //workshop 1
  void onDigitPressed(int digit, BuildContext context) {
    if (_currentIndex < 6) {
      _enteredDigits[_currentIndex] = "$digit";
      // print("number = $digit | list = $_enteredDigits");
      _currentIndex++;
    } else {
      print("Warning exceed 6 digits");
    }
    _inputtedPin = _enteredDigits.join('');
    notifyListeners();
  }

  Future<void> onShowErrorDialogButtonPressed(BuildContext context) async {
    _showErrorDialog("Workshop1", context);
  }

  //workshop 1
  void _addPinDigit(int digit) {}

  //workshop 4
  Future<void> _submitPin(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final isAuthenticated = true;

    _isLoading = false;
    notifyListeners();
  }

  //Workshop 7
  void _navigateToUserDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
          child: HomeScreen(),
        ),
      ),
    );
  }

  //workshop 0
  void _showErrorDialog(String content, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  //workshop 2
  void onDeleteButtonPressed() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _enteredDigits[_currentIndex] = "";
      _inputtedPin = _enteredDigits.join('');
      if (_currentIndex == 0) {
        _inputtedPin = "";
      }
    }

    notifyListeners();
  }

  bool isInput(int index) {
    if (_enteredDigits[index - 1] != "") {
      return true;
    } else {
      return false;
    }
  }

  String getCurrentNumber(int index) {
    return _enteredDigits[index - 1];
  }
}
