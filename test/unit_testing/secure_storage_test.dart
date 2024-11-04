import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/secure_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([SharedPreferences])
import 'secure_storage_test.mocks.dart';

void main() {
  group('SecureStorage', () {
    late SecureStorage secureStorage;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      secureStorage = SecureStorage(
          sharedPreferences:
              mockSharedPreferences); // can run this test suite parallel
    });

    test('store should save a value to SharedPreferences', () async {
      // Arrange
      const key = 'testKey';
      const value = 'testValue';
      when(mockSharedPreferences.setString(key, value))
          .thenAnswer((_) async => true);

      // Act
      await secureStorage.store(key, value);

      // Assert
      verify(mockSharedPreferences.setString(key, value)).called(1);
    }, tags: 'unit');

    test('retrieve should return a value from SharedPreferences', () async {
      // Arrange
      const key = 'testKey';
      const value = 'testValue';
      when(mockSharedPreferences.getString(key)).thenReturn(value);

      // Act
      final result = await secureStorage.retrieve(key);

      // Assert
      expect(result, equals(value));
      verify(mockSharedPreferences.getString(key)).called(1);
    }, tags: 'unit');

    test('retrieve should return null if key does not exist', () async {
      // Arrange
      const key = 'nonExistentKey';
      when(mockSharedPreferences.getString(key)).thenReturn(null);

      // Act
      final result = await secureStorage.retrieve(key);

      // Assert
      expect(result, isNull);
      verify(mockSharedPreferences.getString(key)).called(1);
    }, tags: 'unit');
  });
}
