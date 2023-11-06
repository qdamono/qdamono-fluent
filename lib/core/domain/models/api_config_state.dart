import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_config_state.freezed.dart';

class DefaultApiConfig {
  static const String apiEndpoint = 'https://qdamono.xyz/api';
  static const bool httpAllowed = false;
}

@freezed
class ApiConfigState with _$ApiConfigState {
  const ApiConfigState._();

  const factory ApiConfigState({
    @Default(DefaultApiConfig.apiEndpoint) String apiEndpoint,
    @Default(DefaultApiConfig.httpAllowed) bool httpAllowed,
  }) = _ApiConfigState;

  Uri get apiUri => Uri.parse(apiEndpoint);
}
