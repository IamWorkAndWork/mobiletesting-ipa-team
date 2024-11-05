import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/login_screen/pin_rules.dart';

import 'login_service_test.mocks.dart';

void main() {
  MockClient mockClient = MockClient();
  MockSecureStorage mockSecureStorage = MockSecureStorage();
  late PinRules pinRules;

  setUp(() {
    pinRules = PinRules();
  });

  group('pin rule verify', () {
    test('pin repeat number should show error', () async {
      //given
      String enterInput1 = "123456";
      String enterInput2 = "543210";
      String enterInput3 = "012345";

      //when
      String? pinResult1 = pinRules.getErrorMessage(enterInput1);
      String? pinResult2 = pinRules.getErrorMessage(enterInput2);
      String? pinResult3 = pinRules.getErrorMessage(enterInput3);

      //then
      expect(pinResult1, 'Pin cannot be repeated');
      expect(pinResult2, 'Pin cannot be repeated');
      expect(pinResult3, 'Pin cannot be repeated');
    }, tags: 'unit');

    test(
        'pin does not repeat number but contains repeat digit should show error',
        () async {
      //given
      String enterInput1 = "011234";
      String enterInput2 = "012334";
      String enterInput3 = "011345";

      //when
      String? pinResult1 = pinRules.getErrorMessage(enterInput1);
      String? pinResult2 = pinRules.getErrorMessage(enterInput2);
      String? pinResult3 = pinRules.getErrorMessage(enterInput3);

      //then
      expect(pinResult1, 'Pin format is invalid');
      expect(pinResult2, 'Pin format is invalid');
      expect(pinResult3, 'Pin format is invalid');
    }, tags: 'unit');

    test(
        'pin does not repeat number but contains repeat digit should show error',
        () async {
      //given
      String enterInput1 = "011234";
      String enterInput2 = "012334";

      //when
      String? pinResult1 = pinRules.getErrorMessage(enterInput1);
      String? pinResult2 = pinRules.getErrorMessage(enterInput2);

      //then
      expect(pinResult1, 'Pin format is invalid');
      expect(pinResult2, 'Pin format is invalid');
    }, tags: 'unit');

    test('pin does not repeat number but summary is 15 should show error',
        () async {
      //given
      String enterInput1 = "012435";
      String enterInput2 = "012354";
      String enterInput3 = "201435";

      //when
      String? pinResult1 = pinRules.getErrorMessage(enterInput1);
      String? pinResult2 = pinRules.getErrorMessage(enterInput2);
      String? pinResult3 = pinRules.getErrorMessage(enterInput3);

      //then
      expect(pinResult1, 'Error : Pin summary should not be 15');
      expect(pinResult2, 'Error : Pin summary should not be 15');
      expect(pinResult3, 'Error : Pin summary should not be 15');
    }, tags: 'unit');

    test('pin validate pass rule1, 2 should not show error', () async {
      //given
      String enterInput1 = "012875";
      String enterInput2 = "035794";

      //when
      String? pinResult1 = pinRules.getErrorMessage(enterInput1);
      String? pinResult2 = pinRules.getErrorMessage(enterInput2);

      //then
      expect(pinResult1, null);
      expect(pinResult2, null);
    }, tags: 'unit');
  });
}
