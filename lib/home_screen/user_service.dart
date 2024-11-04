import 'dart:convert';

import 'package:mobiletesting/secure_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  final http.Client client;
  final SecureStorage secureStorage;

  UserService({http.Client? client, SecureStorage? secureStorage})
      : client = client ?? http.Client(),
        secureStorage = secureStorage ?? SecureStorage();

  Future<Map<String, dynamic>> fetchUserDetails() async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      // final authToken = prefs.getString('authToken');
      final authToken = await secureStorage.retrieve('authToken');

      if (authToken == null) {
        return {};
      }

      final response = await client.get(
        // Android emu - 10.0.2.2, iOS simu - localhost, physical device - your IP
        Uri.parse('http://{replace me}:3000/v1/api/user'),
        headers: {
          "content-type": "application/json",
          'Authorization': authToken,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      return {};
    }
  }
}
