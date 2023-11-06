import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/authentication/application/providers/auth_service.dart';
import 'package:qdamono_fluent/core/data/providers/api_manager.dart';
import 'package:qdamono_fluent/core/data/repositories/project/base_project_repository.dart';
import 'package:qdamono_fluent/core/data/repositories/project/project_repository.dart';
import 'package:qdamono_fluent/core/domain/providers/api_config.dart';

part 'project_repository.g.dart';

@riverpod
class ProjectRepository extends _$ProjectRepository {
  static const String subPath = 'project';

  @override
  BaseProjectRepository build() {
    final authState = ref.watch(authServiceProvider);

    if (!authState.isAuthenticated) {
      return DisabledProjectRepository(reason: 'Unauthenticated.');
    }

    final apiService = ref.watch(apiManagerProvider);
    final apiEndpoint =
        ref.watch(apiConfigProvider.select((value) => value.apiUri));

    return HttpProjectRepository(
        apiManager: apiService,
        endpoint: Uri.parse('$apiEndpoint/$subPath'),
        accessToken: authState.accessToken);
  }
}
