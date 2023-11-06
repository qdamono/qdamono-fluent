import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qdamono_fluent/authentication/data/sources/api/base_auth_api.dart';
import 'package:qdamono_fluent/core/data/common/api_error.dart';

class HttpAuthApi implements BaseAuthApi {
  @override
  Future<void> register(Uri apiEndpoint, String email, String password) async {
    print('Sending POST request to $apiEndpoint/register');
    print('email $email');
    print('password $password');

    final response = await http.post(
      Uri.parse('$apiEndpoint/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode != 201) {
      throw ApiError("User registration unsuccessful");
    }
  }

  @override
  Future<String> login(Uri apiEndpoint, String email, String password) async {
    print('Sending POST request to $apiEndpoint/login');
    print('email $email');
    print('password $password');

    final request =
        http.MultipartRequest('POST', Uri.parse('$apiEndpoint/login'))
          ..fields['username'] = email
          ..fields['password'] = password;

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode != 200) {
      throw ApiError('Invalid response status code: ${response.statusCode}.');
    }

    final Map<String, dynamic> content = jsonDecode(response.body);

    print('content $content');

    return content['access_token'];
  }

  @override
  Future<void> logout(Uri apiEndpoint, String accessToken) async {
    print('Sending POST request to $apiEndpoint/logout');

    final response = await http.post(
      Uri.parse('$apiEndpoint/logout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode != 200) {
      throw ApiError('Invalid response status code: ${response.statusCode}.');
    }
  }
}
