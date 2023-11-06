import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/core/data/models/project_info.dart';
import 'package:qdamono_fluent/core/data/repositories/project/base_project_repository.dart';
import 'package:qdamono_fluent/core/data/repositories/providers/project_repository.dart';

part 'project_list.g.dart';

@riverpod
class ProjectList extends _$ProjectList {
  late final BaseProjectRepository repo;

  @override
  Future<List<ProjectInfo>> build() async {
    print('ProjectList build');
    ref.onDispose(() {
      print('ProjectList dispose');
    });

    repo = ref.watch(projectRepositoryProvider);

    return repo.getProjectList();
  }

  Future<void> refresh() async {
    print('ProjectList.refresh');
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async => await repo.getProjectList());
    // return state.;
  }
}
