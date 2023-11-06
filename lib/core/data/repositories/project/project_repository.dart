import 'package:qdamono_fluent/core/data/sources/api/base_api_manager.dart';
import 'package:qdamono_fluent/core/data/models/project.dart';
import 'package:qdamono_fluent/core/data/models/project_info.dart';
import 'package:qdamono_fluent/core/data/repositories/project/base_project_repository.dart';
import 'package:uuid/uuid.dart';

class HttpProjectRepository implements BaseProjectRepository {
  final BaseApiManager apiManager;
  final Uri endpoint;
  final String accessToken;

  HttpProjectRepository({
    required this.apiManager,
    required this.endpoint,
    required this.accessToken,
  });

  @override
  Future<Project> getProject(String id) async {
    final Map<String, dynamic> data =
        await apiManager.getJson(endpoint, accessToken: accessToken);
    return Project.fromJson(data);
  }

  @override
  Future<List<ProjectInfo>> getProjectList() async {
    final Iterable<dynamic> data =
        await apiManager.getJsonList(endpoint, accessToken: accessToken);
    return data.map((obj) => ProjectInfo.fromJson(obj)).toList();
  }

  @override
  Future<Project> createProject([String name = 'New project']) async {
    final Map<String, dynamic> data = await apiManager.post(
      endpoint,
      Project(
        id: const Uuid().v4(),
        name: name,
        files: [],
        codes: [],
        notes: [],
      ).toJson(),
      accessToken: accessToken,
    );
    return Project.fromJson(data);
  }
}

class DisabledProjectRepository implements BaseProjectRepository {
  final String reason;

  DisabledProjectRepository({required this.reason});

  @override
  Future<Project> getProject(String id) {
    throw UnimplementedError('Project API is disabled. Reason: $reason');
  }

  @override
  Future<List<ProjectInfo>> getProjectList() {
    throw UnimplementedError('Project API is disabled. Reason: $reason');
  }

  @override
  Future<Project> createProject([String name = 'New project']) {
    throw UnimplementedError('Project API is disabled. Reason: $reason');
  }
}
