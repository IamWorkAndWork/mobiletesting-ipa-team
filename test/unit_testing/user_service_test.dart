import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/secure_storage.dart';
import 'package:mobiletesting/home_screen/user_service.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'user_service_test.mocks.dart';

@GenerateMocks([http.Client, SecureStorage])
void main() {
  MockClient mockClient = MockClient();
  MockSecureStorage mockSecureStorage = MockSecureStorage();
  late UserService userService;

  setUp(() {
    userService =
        UserService(client: mockClient, secureStorage: mockSecureStorage);
  });
  group('fetchUserDetails', () {
    test('authToken retrieval throw error', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenThrow(Exception('error'));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('authToken retrieval return null', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => null);
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('API call throw error', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => 'Bearer token');
      when(mockClient
          .get(Uri.parse('http://{replace me}:3000/v1/api/user'), headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer token',
      })).thenThrow(Exception('error'));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('API return 400 status code', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => 'Bearer token');
      when(mockClient
          .get(Uri.parse('http://{replace me}:3000/v1/api/user'), headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer token',
      })).thenAnswer((_) async => http.Response('Invalid request', 400));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('API return 401 status code', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => 'Bearer token');
      when(mockClient
          .get(Uri.parse('http://{replace me}:3000/v1/api/user'), headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer token',
      })).thenAnswer((_) async => http.Response('Unauthorised', 401));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('API return 200 status code and response body is empty string',
        () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => 'Bearer token');
      when(mockClient
          .get(Uri.parse('http://{replace me}:3000/v1/api/user'), headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer token',
      })).thenAnswer((_) async => http.Response('', 200));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('API return 200 status code and failed to decode', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => 'Bearer token');
      when(mockClient
          .get(Uri.parse('http://{replace me}:3000/v1/api/user'), headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer token',
      })).thenAnswer((_) async => http.Response('{"name"}', 200));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {});
    }, tags: 'unit');
    test('API return 200 status code and decode successfully', () async {
      // Arrange
      when(mockSecureStorage.retrieve('authToken'))
          .thenAnswer((_) async => 'Bearer token');
      when(mockClient
          .get(Uri.parse('http://{replace me}:3000/v1/api/user'), headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer token',
      })).thenAnswer((_) async => http.Response(
          '{"name":"John Doe","email":"john.doe@example.com", "tier": "gold"}',
          200));
      // Act
      final result = await userService.fetchUserDetails();
      // Assert
      expect(result, {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'tier': 'gold'
      });
    }, tags: 'unit');
  }); // group
}
