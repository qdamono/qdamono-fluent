import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:qdamono_fluent/core/presentation/providers/theme.dart';
import 'package:qdamono_fluent/core/application/providers/workspace/workspace.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/menu/workspace_menu.dart';

class WorkspaceLayout extends ConsumerWidget {
  final Widget child;

  const WorkspaceLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splitViewController = ref.watch(splitViewControllerProvider);
    final dividerColor =
        ref.watch(appThemeProvider.select((value) => value.dividerColor));
    final dividerHighlightedColor = ref.watch(
        appThemeProvider.select((value) => value.dividerHighlightedColor));

    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
        dividerPainter: DividerPainters.background(
          color: dividerColor,
          highlightedColor: dividerHighlightedColor,
        ),
        dividerThickness: 8.0,
      ),
      child: MultiSplitView(
        controller: splitViewController,
        children: [
          const WorkspaceMenu(),
          child,
        ],
      ),
    );
  }
}
