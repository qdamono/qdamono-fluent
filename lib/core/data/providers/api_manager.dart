import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/core/data/sources/api/base_api_manager.dart';
import 'package:qdamono_fluent/core/data/sources/api/http_api_manager.dart';

part 'api_manager.g.dart';

@Riverpod(keepAlive: true)
class ApiManager extends _$ApiManager {
  @override
  BaseApiManager build() => HttpApiManager();
}

// final apiServiceProvider = Provider<api.ApiService>((ref) {
//   return ;
// });