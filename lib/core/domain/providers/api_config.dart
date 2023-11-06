import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/core/domain/models/api_config_state.dart';

part 'api_config.g.dart';

@Riverpod(keepAlive: true)
class ApiConfig extends _$ApiConfig {
  @override
  ApiConfigState build() => const ApiConfigState();

  void setApiEndpoint(Uri apiEndpoint) {
    state = state.copyWith(apiEndpoint: apiEndpoint.toString());
  }

  void setHttpAllowed(bool httpAllowed) {
    state = state.copyWith(httpAllowed: httpAllowed);
  }
}
