import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class WorkspaceMenuLayout extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const WorkspaceMenuLayout({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CommandBar(
          overflowBehavior: CommandBarOverflowBehavior.noWrap,
          primaryItems: [
            CommandBarBuilderItem(
              builder: (context, mode, item) => Expanded(
                flex: 1,
                child: Tooltip(
                  message: AppLocalizations.of(context).files,
                  child: item,
                ),
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.tab),
                label: Text(
                  AppLocalizations.of(context).files,
                  style: FluentTheme.of(context).typography.body!.copyWith(
                        fontSize: 12.0,
                        height: 1.0,
                      ),
                ),
                onPressed: () {
                  navigationShell.goBranch(0);
                },
                selected: navigationShell.currentIndex == 0,
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, item) => Expanded(
                flex: 1,
                child: Tooltip(
                  message: AppLocalizations.of(context).codes,
                  child: item,
                ),
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.pin),
                label: Text(
                  AppLocalizations.of(context).codes,
                  style: FluentTheme.of(context).typography.body!.copyWith(
                        fontSize: 12.0,
                        height: 1.0,
                      ),
                ),
                onPressed: () {
                  navigationShell.goBranch(1);
                },
                selected: navigationShell.currentIndex == 1,
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, item) => Expanded(
                flex: 1,
                child: Tooltip(
                  message: AppLocalizations.of(context).notes,
                  child: item,
                ),
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.quick_note),
                label: Text(
                  AppLocalizations.of(context).notes,
                  style: FluentTheme.of(context).typography.body!.copyWith(
                        fontSize: 12.0,
                        height: 1.0,
                      ),
                ),
                onPressed: () {
                  navigationShell.goBranch(2);
                },
                selected: navigationShell.currentIndex == 2,
              ),
            ),
          ],
        ),
        const Divider(),
        Expanded(
          child: navigationShell,
        ),
      ],
    );
  }
}
