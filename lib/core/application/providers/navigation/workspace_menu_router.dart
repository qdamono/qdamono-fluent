import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/menu/code_list_menu_body.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/menu/file_tree_menu_body.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/menu/note_list_menu_body.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/menu/workspace_menu_layout.dart';

part 'workspace_menu_router.g.dart';

enum MenuBranch {
  files,
  codes,
  notes;

  String get name {
    return switch (this) {
      MenuBranch.files => 'files',
      MenuBranch.codes => 'codes',
      MenuBranch.notes => 'notes',
    };
  }

  String get path {
    return switch (this) {
      MenuBranch.files => '/files',
      MenuBranch.codes => '/codes',
      MenuBranch.notes => '/notes',
    };
  }
}

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> menuNavigatorKey(MenuNavigatorKeyRef ref) =>
    GlobalKey<NavigatorState>(debugLabel: 'MenuNav');

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> menuBranchNavigatorKey(
        MenuBranchNavigatorKeyRef ref, MenuBranch branch) =>
    GlobalKey<NavigatorState>(debugLabel: 'MenuNav_${branch.name}');

@Riverpod(keepAlive: true)
StatefulShellBranch filesBranch(FilesBranchRef ref) {
  final navigatorKey =
      ref.watch(menuBranchNavigatorKeyProvider(MenuBranch.files));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: MenuBranch.files.name,
        path: MenuBranch.files.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const FileTreeMenuBody(),
      )
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch codesBranch(CodesBranchRef ref) {
  final navigatorKey =
      ref.watch(menuBranchNavigatorKeyProvider(MenuBranch.codes));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: MenuBranch.codes.name,
        path: MenuBranch.codes.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const CodeListMenuBody(),
      )
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch notesBranch(NotesBranchRef ref) {
  final navigatorKey =
      ref.watch(menuBranchNavigatorKeyProvider(MenuBranch.notes));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: MenuBranch.notes.name,
        path: MenuBranch.notes.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const NoteListMenuBody(),
      )
    ],
  );
}

final menuBranchListProvider = Provider((ref) {
  return <StatefulShellBranch>[
    ref.watch(filesBranchProvider),
    ref.watch(codesBranchProvider),
    ref.watch(notesBranchProvider),
  ];
});

@Riverpod(keepAlive: true)
StatefulShellRoute menuRootRoute(MenuRootRouteRef ref) {
  final navigatorKey = ref.watch(menuNavigatorKeyProvider);

  return StatefulShellRoute.indexedStack(
    parentNavigatorKey: navigatorKey,
    builder: (context, state, navigationShell) => WorkspaceMenuLayout(
      navigationShell: navigationShell,
    ),
    branches: ref.watch(menuBranchListProvider),
  );
}

final menuRouterProvider = Provider((ref) {
  final navigatorKey = ref.watch(menuNavigatorKeyProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      ref.watch(menuRootRouteProvider),
    ],
    initialLocation: MenuBranch.files.path,
  );
});
