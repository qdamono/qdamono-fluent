abstract class BaseApiManager {
  Future<String> get(
    Uri endpoint, {
    String? accessToken,
  });

  Future<Map<String, dynamic>> getJson(
    Uri endpoint, {
    String? accessToken,
  });

  Future<List<Map<String, dynamic>>> getJsonList(
    Uri endpoint, {
    String? accessToken,
  });

  Future<dynamic> post(
    Uri endpoint,
    dynamic body, {
    String? accessToken,
  });

  Future<dynamic> put(
    Uri endpoint,
    dynamic body, {
    String? accessToken,
  });

  Future<dynamic> delete(
    Uri endpoint, {
    String? accessToken,
  });
}
