import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qdamono_fluent/authentication/application/navigation/routes.dart';
import 'package:qdamono_fluent/authentication/application/providers/auth_service.dart';
import 'package:qdamono_fluent/core/application/navigation/routes.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/app_nav.dart';
import 'package:qdamono_fluent/core/presentation/providers/theme.dart';
import 'package:qdamono_fluent/core/presentation/widgets/back_button.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';
import 'package:window_manager/window_manager.dart';

class RootLayout extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const RootLayout({
    super.key,
    required this.navigationShell,
  });

  @override
  ConsumerState<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends ConsumerState<RootLayout> with WindowListener {
  final navigationViewKey = GlobalKey(debugLabel: 'NavView');

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTabIndex = widget.navigationShell.currentIndex;

    final paneItemList = <NavigationPaneItem>[
      PaneItem(
        key: Key(RootBranch.home.name),
        icon: const Icon(FluentIcons.home),
        title: Text(AppLocalizations.of(context).home),
        body: const SizedBox.shrink(),
        onTap: () {
          AppNav.of(context).goBranch(widget.navigationShell, RootBranch.home);
        },
      ),
      PaneItem(
        key: Key(RootBranch.workspace.name),
        icon: const Icon(FluentIcons.tab),
        title: Text(AppLocalizations.of(context).workspace),
        body: const SizedBox.shrink(),
        onTap: () {
          AppNav.of(context)
              .goBranch(widget.navigationShell, RootBranch.workspace);
        },
      ),
      PaneItem(
        key: Key(RootBranch.analysis.name),
        icon: const Icon(FluentIcons.test_beaker),
        title: Text(AppLocalizations.of(context).analysis),
        body: const SizedBox.shrink(),
        onTap: () {
          AppNav.of(context)
              .goBranch(widget.navigationShell, RootBranch.analysis);
        },
      ),
      PaneItem(
        key: Key(RootBranch.diagram.name),
        icon: const Icon(FluentIcons.pen_workspace),
        title: Text(AppLocalizations.of(context).diagram),
        body: const SizedBox.shrink(),
        onTap: () {
          AppNav.of(context)
              .goBranch(widget.navigationShell, RootBranch.diagram);
        },
      ),
    ];

    final footerItemList = <NavigationPaneItem>[
      PaneItem(
        key: Key(RootBranch.info.name),
        icon:
            Icon(FluentIcons.info, color: FluentTheme.of(context).accentColor),
        title: Text(AppLocalizations.of(context).info),
        body: const SizedBox.shrink(),
        onTap: () {
          AppNav.of(context).goBranch(widget.navigationShell, RootBranch.info);
        },
      ),
      PaneItemSeparator(),
      PaneItem(
        key: Key(RootBranch.settings.name),
        icon: const Icon(FluentIcons.settings),
        title: Text(AppLocalizations.of(context).settings),
        body: const SizedBox.shrink(),
        onTap: () {
          AppNav.of(context)
              .goBranch(widget.navigationShell, RootBranch.settings);
        },
      ),
    ];

    final isAuthenticated =
        ref.watch(authServiceProvider.select((value) => value.isAuthenticated));

    return NavigationView(
      key: navigationViewKey,
      appBar: NavigationAppBar(
        height: 30.0,
        automaticallyImplyLeading: false,
        // ignore: prefer_const_constructors
        leading: BackButton(),
        title: () {
          const appBarAlignedTitleWidget = Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('QDAmono'),
          );

          if (kIsWeb) {
            return appBarAlignedTitleWidget;
          }

          return const DragToMoveArea(
            child: appBarAlignedTitleWidget,
          );
        }(),
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (kDebugMode)
              Container(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).darkTheme,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: FluentTheme.of(context)
                                .typography
                                .caption!
                                .fontSize!,
                          ),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 10.0)),
                    const ThemeSwitcher(),
                  ],
                ),
              ),
            isAuthenticated ? const LogoutButton() : const AccountButton(),
            if (!kIsWeb) const WindowButtons(),
          ],
        ),
      ),
      pane: NavigationPane(
        size: const NavigationPaneSize(topHeight: 40.0),
        selected: selectedTabIndex,
        displayMode: PaneDisplayMode.compact,
        indicator: const StickyNavigationIndicator(),
        items: paneItemList,
        footerItems: footerItemList,
        menuButton: const SizedBox.shrink(),
      ),
      paneBodyBuilder: (item, child) {
        final String? name =
            item?.key is ValueKey ? (item!.key as ValueKey).value : null;

        return FocusTraversalGroup(
          key: ValueKey('body_$name'),
          child: widget.navigationShell,
        );
      },
    );
  }

  @override
  void onWindowClose() async {
    bool isPreventClose = await windowManager.isPreventClose();

    if (isPreventClose && context.mounted) {
      showDialog(
        context: context,
        builder: (_) => ContentDialog(
          title: Text(AppLocalizations.of(context).confirmClose),
          content: Text(AppLocalizations.of(context).confirmCloseDetail),
          actions: [
            FilledButton(
              child: Text(AppLocalizations.of(context).yes),
              onPressed: () {
                Navigator.pop(context);
                windowManager.destroy();
              },
            ),
            Button(
                child: Text(AppLocalizations.of(context).no),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      );
    }
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return SizedBox(
      width: 138,
      height: 30,
      child: WindowCaption(
        brightness: theme.brightness,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(appThemeModeProvider);

    return ToggleSwitch(
        checked: mode.isDark,
        onChanged: (value) {
          ref
              .read(appThemeModeProvider.notifier)
              .set(value ? ThemeMode.dark : ThemeMode.light);
        });
  }
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Button(
        onPressed: () {
          ref.read(authServiceProvider.notifier).logout();
        },
        child: const Text('Logout'),
      ),
    );
  }
}

class AccountButton extends ConsumerWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Button(
        onPressed: () {
          ref.read(appNavProvider.notifier).go(AuthenticationRoute.root);
        },
        child: Text(AppLocalizations.of(context).account),
      ),
    );
  }
}
