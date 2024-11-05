class PinRule {
  final bool Function(String pin) condition;

  PinRule(this.condition);
}

// workshop #3
class PinRules {
  final List<PinRule> _rules;
  int index = 0;
  // final List _enterPins = [];

  PinRules() : _rules = [] {
    _rules.add(PinRule((pin) => isSequential(pin)));
    _rules.add(PinRule((pin) => isSomeDigitRepeated(pin)));
    _rules.add(PinRule((pin) => isPinSum15(pin)));
  }

  String? getErrorMessage(String pin) {
    bool isSequentialResult = _rules[0].condition(pin);
    bool isSomeDigitRepeatedResult = _rules[1].condition(pin);
    bool isPinSumOf15 = _rules[2].condition(pin);

    print(
        "pin = $pin | isSequential = $isSequentialResult | isSomeDigitRepeatedResult = ${isSomeDigitRepeatedResult} | isPinSumOf15 = ${isPinSumOf15}");

    if (isSequentialResult == true) {
      return "Pin cannot be repeated";
    }

    if (isSomeDigitRepeatedResult == true) {
      return "Pin format is invalid";
    }

    if (isPinSumOf15 == true) {
      return "Error : Pin summary should not be 15";
    }

    return null;
  }

  bool isSequential(String digitsString) {
    if (digitsString.length < 2) {
      return false; // A single digit cannot be sequential
    }

    final digits = digitsString.split('').map(int.parse).toList();

    for (int i = 1; i < digits.length; i++) {
      if ((digits[i] - digits[i - 1]).abs() != 1) {
        return false; // Non-sequential pattern detected
      }
    }
    return true; // All consecutive digits have a difference of 1 or -1
  }

  //give me a function to check some digit is repeat example 011234 should return true and 012345 should return false
  bool isSomeDigitRepeated(String pin) {
    final digits = pin.split('').map(int.parse).toList();
    final uniqueDigits = digits.toSet();

    return digits.length != uniqueDigits.length;
  }

  bool isPinSum15(String pinString) {
    final digits = pinString.split('').map(int.parse).toList();
    final sum = digits.reduce((value, element) => value + element);
    bool isSumEqual15 = sum == 15;
    return isSumEqual15;
  }
}
