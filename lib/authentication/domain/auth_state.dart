import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

class DefaultAuthConfig {
  static const String accessToken = '';
  static const String email = '';
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(DefaultAuthConfig.accessToken) String accessToken,
    @Default(DefaultAuthConfig.email) String email,
  }) = _AuthState;

  bool get isAuthenticated => accessToken != '';
}
