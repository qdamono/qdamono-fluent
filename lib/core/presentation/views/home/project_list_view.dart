import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/navigation/routes.dart';
import 'package:qdamono_fluent/core/application/providers/project/project_list.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/app_nav.dart';

class ProjectListView extends ConsumerWidget {
  const ProjectListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectList = ref.watch(projectListProvider);

    print('ProjectListView projectList: $projectList');

    return ScaffoldPage.withPadding(
      header: const PageHeader(
        title: Text('Project list'),
      ),
      content: Column(
        children: [
          const Center(child: GoToHomeButton()),
          const Center(child: AddNewProjectButton()),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: 300.0,
                  child: projectList.map(
                    loading: (loading) => Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: const SizedBox(
                          width: 32.0,
                          height: 32.0,
                          child: ProgressRing(),
                        ),
                      ),
                    ),
                    data: (data) => ListView.builder(
                      itemCount: data.value.length,
                      itemBuilder: (context, index) {
                        final project = data.value[index];

                        return ListTile(
                          title: Text(project.name),
                          leading: const Icon(FluentIcons.project_document),
                        );
                      },
                    ),
                    error: (error) => Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: InfoBar(
                          title: const Text('Error'),
                          content: const Text('Unable to load content.'),
                          severity: InfoBarSeverity.error,
                          action: Button(
                            onPressed: () {
                              ref.read(projectListProvider.notifier).refresh();
                            },
                            child: const Text('Reload'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GoToHomeButton extends ConsumerWidget {
  const GoToHomeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Button(
        onPressed: () {
          ref.read(appNavProvider.notifier).push(HomeRoute.root);
        },
        child: const Text('Home'),
      ),
    );
  }
}

class AddNewProjectButton extends ConsumerWidget {
  const AddNewProjectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Button(
        onPressed: () {
          // ref.read(projectProvider.notifier).createProject();
        },
        child: const Text('Add new project'),
      ),
    );
  }
}
