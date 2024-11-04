import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/login_screen/login_view_model.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mockito/annotations.dart';

import 'login_view_model_test.mocks.dart';

@GenerateMocks([BuildContext, LoginService])
void main() {
  group('LoginViewModel', () {
    late LoginViewModel loginViewModel;
    late MockLoginService mockLoginService;

    setUp(() {
      mockLoginService = MockLoginService();
      loginViewModel = LoginViewModel(mockLoginService, SortOrder.ascending);
    });

    group('onDigitPressed', () {
      test(
          'given inputted pin is empty when digit is pressed then inputted pin should be added',
          () {
        // Arrange
        final context = MockBuildContext();

        // Act
        loginViewModel.onDigitPressed(1, context);

        // Assert
        expect(loginViewModel.inputtedPin, "1");
      }, tags: 'unit');

      test(
          'given inputted pin is 5 digits when digit is pressed then inputted pin should not be added',
          () {
        //Arrange
        final context = MockBuildContext();
        loginViewModel.onDigitPressed(1, context);
        loginViewModel.onDigitPressed(2, context);
        loginViewModel.onDigitPressed(3, context);
        loginViewModel.onDigitPressed(4, context);
        loginViewModel.onDigitPressed(5, context);

        //Act
        loginViewModel.onDigitPressed(6, context);

        //Assert
        expect(loginViewModel.inputtedPin, "123456");
      }, tags: 'unit');

      test(
          "given inputted pin is pressed 7 times then inputted pin should only first 6 digit",
          () {
        //Arrange
        final context = MockBuildContext();
        loginViewModel.onDigitPressed(1, context);
        loginViewModel.onDigitPressed(2, context);
        loginViewModel.onDigitPressed(3, context);
        loginViewModel.onDigitPressed(4, context);
        loginViewModel.onDigitPressed(5, context);
        loginViewModel.onDigitPressed(6, context);
        //Act
        loginViewModel.onDigitPressed(7, context);

        //Assert
        expect(loginViewModel.inputtedPin, "123456");
      }, tags: 'unit');

      group('handle FE Test', () {});
      group('handle network call', () {});
    });

    group('onDeleteButtonPressed', () {
      test(
          'given inputted pin is not empty when delete button is click then last digit from inputtedPin will be removed',
          () {
        //Arrange
        final context = MockBuildContext();
        loginViewModel.onDigitPressed(1, context);
        loginViewModel.onDigitPressed(2, context);
        loginViewModel.onDigitPressed(3, context);

        //Act
        loginViewModel.onDeleteButtonPressed();

        //Assert
        expect(loginViewModel.inputtedPin, "12");
      }, tags: 'unit');

      test(
          'given inputted pin is empty when delete button is click then last digit from inputtedPin will be empty',
          () {
        //Arrange
        final context = MockBuildContext();

        //Act
        loginViewModel.onDeleteButtonPressed();

        //Assert
        expect(loginViewModel.inputtedPin, "");
      }, tags: 'unit');

      test(
          'given inputted pin is 1 digit when delete button is click then last digit from inputtedPin will be empty',
              () {
            //Arrange
            final context = MockBuildContext();
            loginViewModel.onDigitPressed(2, context);

            //Act
            loginViewModel.onDeleteButtonPressed();

            //Assert
            expect(loginViewModel.inputtedPin, "");
          }, tags: 'unit');


      test('given inputted 1 digit should show dot with filled first index', (){
        //Arrange
        final context = MockBuildContext();

        //Act
        loginViewModel.onDigitPressed(1, context);

        //Assert
        expect(loginViewModel.isInput(1), true);
        expect(loginViewModel.isInput(2), false);
        expect(loginViewModel.isInput(3), false);
        expect(loginViewModel.isInput(4), false);
        expect(loginViewModel.isInput(5), false);
        expect(loginViewModel.isInput(6), false);

      }, tags: 'unit');

    });

    group('navigation', () {});
  });
}
