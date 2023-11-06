import 'dart:convert';

import 'package:qdamono_fluent/core/data/sources/api/base_api_manager.dart';
import 'package:http/http.dart' as http;
import 'package:qdamono_fluent/core/data/common/api_error.dart';

class HttpApiManager implements BaseApiManager {
  Map<String, String> _makeJsonHeaders() {
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  Map<String, String> _makeAuthenticationHeaders(String accessToken) {
    return <String, String>{
      'Authorization': 'Bearer $accessToken',
    };
  }

  @override
  Future<String> get(
    Uri endpoint, {
    String? accessToken,
  }) async {
    var headers = _makeJsonHeaders();

    if (accessToken != null) {
      headers.addAll(_makeAuthenticationHeaders(accessToken));
    }

    final response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw ApiError('Invalid status code.',
          statusCode: response.statusCode, reason: response.reasonPhrase);
    }

    return response.body;
  }

  @override
  Future<Map<String, dynamic>> getJson(
    Uri endpoint, {
    String? accessToken,
  }) async {
    var headers = _makeJsonHeaders();

    if (accessToken != null) {
      headers.addAll(_makeAuthenticationHeaders(accessToken));
    }

    final response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw ApiError('Invalid status code.',
          statusCode: response.statusCode, reason: response.reasonPhrase);
    }

    try {
      final body = json.decode(response.body);
      return body as Map<String, dynamic>;
    } on FormatException catch (err) {
      throw ApiError(
          'Response body decode error. The body is not a valid JSON object.',
          innerError: err);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getJsonList(
    Uri endpoint, {
    String? accessToken,
  }) async {
    var headers = _makeJsonHeaders();

    if (accessToken != null) {
      headers.addAll(_makeAuthenticationHeaders(accessToken));
    }

    print('API get: $endpoint');
    final response = await http.get(
      endpoint,
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw ApiError('Invalid status code.',
          statusCode: response.statusCode, reason: response.reasonPhrase);
    }

    try {
      final rawList = response.body as Iterable<dynamic>;
      final body = rawList.map((rawObject) => json.decode(rawObject)).toList();
      return body as List<Map<String, dynamic>>;
    } on FormatException catch (err) {
      throw ApiError(
          'Response body decode error. The body is not a valid list of JSON objects.',
          innerError: err);
    }
  }

  @override
  Future<dynamic> post(
    Uri endpoint,
    dynamic body, {
    String? accessToken,
  }) async {
    final headers = accessToken != null
        ? _makeAuthenticationHeaders(accessToken)
        : <String, String>{};

    final response = await http.post(
      endpoint,
      body: body,
      headers: headers,
    );

    if (response.statusCode != 200) {
      throw ApiError('Invalid response status code: ${response.statusCode}.');
    }

    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> put(
    Uri endpoint,
    dynamic body, {
    String? accessToken,
  }) async {}

  @override
  Future<dynamic> delete(
    Uri endpoint, {
    String? accessToken,
  }) async {}
}
