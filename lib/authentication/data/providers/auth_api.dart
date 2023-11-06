import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/authentication/data/sources/api/base_auth_api.dart';
import 'package:qdamono_fluent/authentication/data/sources/api/http_auth_api.dart';

part 'auth_api.g.dart';

@riverpod
BaseAuthApi authApi(AuthApiRef ref) {
  return HttpAuthApi();
}
