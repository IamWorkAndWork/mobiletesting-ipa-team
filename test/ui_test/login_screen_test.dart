import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([LoginService])
void main() {
  setUp(() {});

  testWidgets('example of widget testing', (WidgetTester tester) async {
    // Arrange
    // when(serverA.functionB('')).thenAnswer((_) async => true);
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    await binding
        .setSurfaceSize(Size(400, 800)); // ensure a must UI component visible
    await tester.pumpWidget(
      MaterialApp(home: Text("1")),
    );

    //Act
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();

    //Assertion
    expect(find.byType(AlertDialog), findsNothing);
    // verify(serverA.functionB('')).called(1);
  }, tags: 'widget');
}
