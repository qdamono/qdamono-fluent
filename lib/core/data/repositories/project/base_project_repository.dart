import 'package:qdamono_fluent/core/data/models/project.dart';
import 'package:qdamono_fluent/core/data/models/project_info.dart';

abstract class BaseProjectRepository {
  Future<List<ProjectInfo>> getProjectList();
  Future<Project> getProject(String id);
  Future<Project> createProject([String name = 'New project']);
}
