import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/workspace_tabs.dart';

class WorkspaceView extends ConsumerWidget {
  const WorkspaceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTabIndex = ref.watch(selectedTabIndexProvider);
    final tabList = ref.watch(tabListProvider);
    ref.watch(tabManagerProvider);

    return TabView(
      currentIndex: selectedTabIndex,
      tabs: tabList,
      onNewPressed: null,
      onChanged: (int newIndex) {
        ref.read(selectedTabIndexProvider.notifier).set(newIndex);
      },
      onReorder: (oldIndex, newIndex) {
        ref
            .read(tabManagerProvider.notifier)
            .reorder(from: oldIndex, to: newIndex);
      },
    );
  }
}
