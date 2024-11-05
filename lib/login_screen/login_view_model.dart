// pin_view_model.dart
import 'package:flutter/material.dart';
import 'package:mobiletesting/home_screen/home_screen.dart';
import 'package:mobiletesting/home_screen/home_view_model.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mobiletesting/login_screen/pin_rules.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends ChangeNotifier {
  String _inputtedPin = '';
  bool _isLoading = false;

  final LoginService loginService;
  final SortOrder keyPadsortOrder;
  final PinRules pinRules;

  LoginViewModel(this.loginService, this.keyPadsortOrder, this.pinRules);

  String get inputtedPin => _inputtedPin;

  String? _dialogMessage;

  String? get dialogMessage => _dialogMessage ?? "Ready to Submit Pin";

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

    final emptyList = _enteredDigits.where((digit) => digit.isEmpty).toList();

    _inputtedPin = _enteredDigits.join('');

    if (emptyList.isEmpty) {
      processAuthenPin(context);
    }

    notifyListeners();
  }

  Future<void> processAuthenPin(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 300));

    String pin = _inputtedPin;
    String? result = pinRules.getErrorMessage(pin);

    if (result == null) {
      //pass pin validation

      // await Future.delayed(const Duration(milliseconds: 500));
      _isLoading = false;

      _dialogMessage = null;
      // _navigateToUserDetailsScreen(context);
      // _showErrorDialog("success: Ready to submit pin", context);

      // resetPin();
      notifyListeners();
    } else {
      //not pass pin validation
      _dialogMessage = result;
      _showErrorDialog(result, null, context);
      _isLoading = false;
      resetPin();
      notifyListeners();
    }
  }

  Future<void> onShowErrorDialogButtonPressed(BuildContext context) async {
    _showErrorDialog("Workshop1", null, context);
  }

  Future<void> onShowSuccessButtonPressed(BuildContext context) async {
    if (dialogMessage == null) {
      _submitPin(context);
    }
  }

  //workshop 1
  void _addPinDigit(int digit) {}

  //workshop 4
  Future<void> _submitPin(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));
    final isAuthenticated = true;

    _isLoading = false;
    notifyListeners();

    _showErrorDialog("Ready to Submit Pin", "success", context);

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
  void _showErrorDialog(String content, String? title, BuildContext context) {
    var _title = "Error";
    if (title != null) {
      _title = title;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_title),
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
      _dialogMessage = "please enter 6 digits";

      _currentIndex--;
      _enteredDigits[_currentIndex] = "";
      _inputtedPin = _enteredDigits.join('');
      if (_currentIndex == 0) {
        _inputtedPin = "";
      }
    } else {}

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

  void resetPin() {
    for (int i = 0; i < _enteredDigits.length; i++) {
      _enteredDigits[i] = "";
    }
    _currentIndex = 0;
    _inputtedPin = '';
  }
}
