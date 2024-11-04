import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobiletesting/secure_storage.dart';

//workshop 4
class LoginService {
  final http.Client client;
  final SecureStorage secureStorage;

  LoginService({http.Client? client, SecureStorage? secureStorage})
      : client = client ?? http.Client(),
        secureStorage = secureStorage ?? SecureStorage();

  Future<bool> authenticate(String pin) async {
    // Android emu - 10.0.2.2, iOS simu - localhost, physical device - your IP
    final url = Uri.parse('http://{replace me}:3000/v1/api/pin/validate');
    final body = jsonEncode({'pin': pin});

    // http.post()
    final response = await client
        .post(url, body: body, headers: {"content-type": "application/json"});
    try {
      if (response.statusCode == 200) {
        final authToken = response.headers['authorization'];
        if (authToken != null && authToken != '') {
          //business accept risk to not check authToken format
          await secureStorage.store('authToken', authToken);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
