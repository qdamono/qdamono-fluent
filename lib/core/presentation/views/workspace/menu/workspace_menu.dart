import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/workspace_menu_router.dart';

class WorkspaceMenu extends ConsumerWidget {
  const WorkspaceMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuRouter = ref.watch(menuRouterProvider);

    return Router(
      routerDelegate: menuRouter.routerDelegate,
      routeInformationParser: menuRouter.routeInformationParser,
      routeInformationProvider: menuRouter.routeInformationProvider,
    );
  }
}
