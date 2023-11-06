import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/authentication/application/providers/routes.dart';
import 'package:qdamono_fluent/core/application/navigation/routes.dart';
import 'package:qdamono_fluent/core/presentation/views/analysis/analysis_view.dart';
import 'package:qdamono_fluent/core/presentation/views/home/home_view.dart';
import 'package:qdamono_fluent/core/presentation/views/home/project_list_view.dart';
import 'package:qdamono_fluent/core/presentation/views/info/info_view.dart';
import 'package:qdamono_fluent/core/presentation/views/root_layout.dart';
import 'package:qdamono_fluent/core/presentation/views/settings/settings_view.dart';
import 'package:qdamono_fluent/core/presentation/views/diagram/diagram_view.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/workspace_layout.dart';
import 'package:qdamono_fluent/core/presentation/views/workspace/workspace_view.dart';

part 'root_router.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> rootNavigatorKey(RootNavigatorKeyRef ref) =>
    GlobalKey<NavigatorState>(debugLabel: 'Nav');

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> branchNavigatorKey(
        RootNavigatorKeyRef ref, RootBranch branch) =>
    GlobalKey<NavigatorState>(debugLabel: 'Nav_${branch.name}');

@Riverpod(keepAlive: true)
StatefulShellBranch homeBranch(HomeBranchRef ref) {
  final navigatorKey = ref.watch(branchNavigatorKeyProvider(RootBranch.home));
  final authenticationRoute = ref.watch(mainAuthenticationViewRouteProvider);

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    initialLocation: HomeRoute.root.path,
    routes: <RouteBase>[
      GoRoute(
        name: HomeRoute.root.name,
        path: HomeRoute.root.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
        routes: [
          GoRoute(
            name: HomeRoute.projectList.name,
            path: HomeRoute.projectList.path,
            parentNavigatorKey: navigatorKey,
            builder: (BuildContext context, GoRouterState state) =>
                const ProjectListView(),
          ),
          authenticationRoute,
        ],
      ),
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch workspaceBranch(WorkspaceBranchRef ref) {
  final navigatorKey =
      ref.watch(branchNavigatorKeyProvider(RootBranch.workspace));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    initialLocation: WorkspaceRoute.root.path,
    routes: <RouteBase>[
      GoRoute(
        name: WorkspaceRoute.root.name,
        path: WorkspaceRoute.root.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const WorkspaceLayout(child: WorkspaceView()),
      ),
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch analysisBranch(AnalysisBranchRef ref) {
  final navigatorKey =
      ref.watch(branchNavigatorKeyProvider(RootBranch.analysis));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    initialLocation: AnalysisRoute.root.path,
    routes: <RouteBase>[
      GoRoute(
        name: AnalysisRoute.root.name,
        path: AnalysisRoute.root.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const AnalysisView(),
      ),
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch diagramBranch(DiagramBranchRef ref) {
  final navigatorKey =
      ref.watch(branchNavigatorKeyProvider(RootBranch.diagram));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    initialLocation: DiagramRoute.root.path,
    routes: <RouteBase>[
      GoRoute(
        name: DiagramRoute.root.name,
        path: DiagramRoute.root.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const DiagramView(),
      ),
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch infoBranch(InfoBranchRef ref) {
  final navigatorKey = ref.watch(branchNavigatorKeyProvider(RootBranch.info));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    initialLocation: InfoRoute.root.path,
    routes: <RouteBase>[
      GoRoute(
        name: InfoRoute.root.name,
        path: InfoRoute.root.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const InfoView(),
      ),
    ],
  );
}

@Riverpod(keepAlive: true)
StatefulShellBranch settingsBranch(SettingsBranchRef ref) {
  final navigatorKey =
      ref.watch(branchNavigatorKeyProvider(RootBranch.settings));

  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    initialLocation: SettingsRoute.root.path,
    routes: <RouteBase>[
      GoRoute(
        name: SettingsRoute.root.name,
        path: SettingsRoute.root.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const SettingsView(),
      ),
    ],
  );
}

@Riverpod(keepAlive: true)
List<StatefulShellBranch> branchList(BranchListRef ref) {
  return <StatefulShellBranch>[
    ref.watch(homeBranchProvider),
    ref.watch(workspaceBranchProvider),
    ref.watch(analysisBranchProvider),
    ref.watch(diagramBranchProvider),
    ref.watch(infoBranchProvider),
    ref.watch(settingsBranchProvider),
  ];
}

@Riverpod(keepAlive: true)
List<RouteBase> rootRouteList(RootRouteListRef ref) {
  final rootNavigatorKey = ref.watch(rootNavigatorKeyProvider);
  final branchList = ref.watch(branchListProvider);

  return <RouteBase>[
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, navigationShell) => RootLayout(
        navigationShell: navigationShell,
      ),
      branches: branchList,
    ),
  ];
}

@Riverpod(keepAlive: true)
GoRouter rootRouter(RootRouterRef ref) {
  final rootNavigatorKey = ref.watch(rootNavigatorKeyProvider);
  final rootRouteList = ref.watch(rootRouteListProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: rootRouteList,
    initialLocation: HomeRoute.root.path,
  );
}
