import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/main.dart' as app;
void main (){

  //
  // This is E2E Test (Integration test in Flutter)
  // Require server#1 to be start first before running the test
  //

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Integration Test', () {
    testWidgets('Given member when enter pin then navigate to home screen', (tester) async 
    {
      //Run main app 
      app.main();
      await tester.pumpAndSettle();

      //Act 
      await tester.tap(find.text("1"));
      await tester.tap(find.text("3"));
      await tester.tap(find.text("2"));
      await tester.tap(find.text("4"));
      await tester.tap(find.text("9"));
      await tester.tap(find.text("5"));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));

      //Assert
      expect(find.byKey(Key('home_screen')), findsOneWidget);
    });
  });
}