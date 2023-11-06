abstract class BaseAuthApi {
  Future<void> register(Uri apiEndpoint, String email, String password);
  Future<String> login(Uri apiEndpoint, String email, String password);
  Future<void> logout(Uri apiEndpoint, String accessToken);
}
