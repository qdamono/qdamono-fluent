import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/core/data/models/models.dart' as models;
import 'package:qdamono_fluent/core/data/repositories/project/base_project_repository.dart';
import 'package:qdamono_fluent/core/data/repositories/providers/project_repository.dart';

part 'project.g.dart';
part 'project.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  ProjectState._();

  factory ProjectState({
    required String id,
    required String name,
    @Default([]) List<String> files,
    @Default([]) List<String> codes,
    @Default([]) List<String> notes,
  }) = _ProjectState;

  factory ProjectState.fromModel(models.Project model) {
    return ProjectState(
      id: model.id,
      name: model.name,
      files: model.files,
      codes: model.codes,
      notes: model.notes,
    );
  }
}

// @riverpod
// class Project extends _$Project {
//   @override
//   ProjectState build() => ProjectState(id: '', name: 'New project');

//   Future<List<ProjectInfo>> getProjectList() async {
//     return await ref.read(projectApiManagerProvider.notifier).getProjectList();
//   }

//   Future<void> updateProject(models.Project project) async {
//     ref.read(projectApiManagerProvider.notifier).updateProject(project);
//   }

//   void createProject() {
//     state = ProjectState(id: const Uuid().v4(), name: "New project");
//   }
// }

@riverpod
class Project extends _$Project {
  late final BaseProjectRepository repo;

  @override
  Future<ProjectState> build(String id) async {
    repo = ref.watch(projectRepositoryProvider);

    print('Project $id build');
    ref.onDispose(() {
      print('Project $id dispose');
    });

    // final project = await repo.getProject(id);
    // return ProjectState.fromModel(project);

    return ProjectState(id: id, name: 'Project $id');
  }
}
