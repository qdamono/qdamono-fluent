import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/authentication/data/providers/auth_api.dart';
import 'package:qdamono_fluent/authentication/data/sources/api/base_auth_api.dart';
import 'package:qdamono_fluent/core/domain/models/api_config_state.dart';
import 'package:qdamono_fluent/authentication/domain/auth_state.dart';
import 'package:qdamono_fluent/core/domain/providers/api_config.dart';
import 'package:qdamono_fluent/core/application/providers/persistent/preferences.dart';

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  BaseAuthApi? _authApi;
  ApiConfigState? _apiConfig;

  static const String subPath = 'auth';

  @override
  AuthState build() {
    _apiConfig = ref.watch(apiConfigProvider);
    _authApi = ref.watch(authApiProvider);

    final accessToken =
        ref.watch(appPreferencesProvider.select((value) => value.accessToken));
    final email =
        ref.watch(appPreferencesProvider.select((value) => value.email));

    return AuthState(accessToken: accessToken, email: email);
  }

  bool get isLoggedIn {
    return state.accessToken != '';
  }

  Future<void> register(String email, String password) async {
    final apiEndpoint = Uri.parse('${_apiConfig!.apiUri}/$subPath');

    await _authApi!.register(apiEndpoint, email, password);

    ref.read(appPreferencesProvider.notifier).set(email: email);
  }

  Future<void> login(String email, String password) async {
    final apiEndpoint = Uri.parse('${_apiConfig!.apiUri}/$subPath');
    final accessToken = await _authApi!.login(apiEndpoint, email, password);

    ref
        .read(appPreferencesProvider.notifier)
        .set(accessToken: accessToken, email: email);
  }

  Future<void> logout() async {
    final apiEndpoint = Uri.parse('${_apiConfig!.apiUri}/$subPath');

    try {
      await _authApi!.logout(apiEndpoint, state.accessToken);
    } catch (e) {
      print('Could not logout. The access token might still be valid!');
      print(e);
    }

    ref.read(appPreferencesProvider.notifier).set(accessToken: '', email: '');
  }
}
