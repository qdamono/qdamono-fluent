import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/core/application/navigation/routes.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/root_router.dart';

part 'app_nav.g.dart';

@Riverpod(keepAlive: true)
class AppNav extends _$AppNav {
  @override
  GoRouter build() {
    return ref.watch(rootRouterProvider);
  }

  static AppNav of(BuildContext context) {
    return ProviderScope.containerOf(context).read(appNavProvider.notifier);
  }

  bool canPop() {
    return state.canPop();
  }

  void pop() {
    state.pop();
  }

  void go(AppRoute route) {
    if (kDebugMode) {
      print(
          'AppNav.go: from ${state.routerDelegate.currentConfiguration.last.matchedLocation}, to ${route.name}');
    }

    state.goNamed(route.name);
  }

  void push(AppRoute route) {
    if (kDebugMode) {
      print(
          'AppNav.push: from ${state.routerDelegate.currentConfiguration.last.matchedLocation}, to ${route.name}');
    }

    state.pushNamed(route.name);
  }

  void goBranch(StatefulNavigationShell navigationShell, RootBranch branch) {
    if (kDebugMode) {
      print(
          'AppNav.goBranch: from ${state.routerDelegate.currentConfiguration.last.matchedLocation}, to ${branch.name}');
    }

    navigationShell.goBranch(branch.index);
  }
}
