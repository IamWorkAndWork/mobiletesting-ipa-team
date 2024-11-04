import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobiletesting/home_screen/home_view_model.dart';
import 'package:mobiletesting/login_screen/login_view_model.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([LoginViewModel, LoginService, HomeViewModel])
void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('example of snapshot testing', (tester) async {
    // // Arrange
    // final mockViewModelA = MockViewModelA();
    // when(mockViewModelA.functionB).thenReturn('');

    // final builder = DeviceBuilder()
    //   ..overrideDevicesForAllScenarios(devices: [
    //     const Device(name: 'Pixel3a 800 x 600', size: Size(800, 600)),
    //     Device.iphone11,
    //     Device.tabletPortrait,
    //   ])
    //   ..addScenario(widget: Text(''));

    // // Act
    // await tester.pumpDeviceBuilder(builder);
    // // Assert
    // await screenMatchesGolden(tester, 'expected_golden_image');
  });

  testGoldens('example of snapshot testing1', (tester) async {
    // // Arrange, Act
    // await tester.pumpWidgetBuilder(Text(''),
    //     surfaceSize: Size(400, 900), textScaleSize: 1.0);
    // // Assert
    // await screenMatchesGolden(tester, 'pin_grid_view_ascending');
  });
}
