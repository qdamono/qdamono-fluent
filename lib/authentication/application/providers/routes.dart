import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:qdamono_fluent/authentication/presentation/views/login_view.dart';
import 'package:qdamono_fluent/authentication/presentation/views/main_authentication_view.dart';
import 'package:qdamono_fluent/authentication/application/navigation/routes.dart';
import 'package:qdamono_fluent/authentication/presentation/views/register_view.dart';
import 'package:qdamono_fluent/core/application/navigation/routes.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/root_router.dart';

part 'routes.g.dart';

@Riverpod(keepAlive: true)
class LoginViewRoute extends _$LoginViewRoute {
  @override
  GoRoute build() {
    final navigatorKey = ref.watch(branchNavigatorKeyProvider(RootBranch.home));

    return GoRoute(
      name: AuthenticationRoute.login.name,
      path: AuthenticationRoute.login.path,
      parentNavigatorKey: navigatorKey,
      builder: (BuildContext context, GoRouterState state) => const LoginView(),
    );
  }
}

@Riverpod(keepAlive: true)
class RegisterViewRoute extends _$RegisterViewRoute {
  @override
  GoRoute build() {
    final navigatorKey = ref.watch(branchNavigatorKeyProvider(RootBranch.home));

    return GoRoute(
      name: AuthenticationRoute.register.name,
      path: AuthenticationRoute.register.path,
      parentNavigatorKey: navigatorKey,
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterView(),
    );
  }
}

@Riverpod(keepAlive: true)
class MainAuthenticationViewRoute extends _$MainAuthenticationViewRoute {
  @override
  GoRoute build() {
    final navigatorKey = ref.watch(branchNavigatorKeyProvider(RootBranch.home));
    final loginRoute = ref.watch(loginViewRouteProvider);
    final registerRoute = ref.watch(registerViewRouteProvider);

    return GoRoute(
      name: AuthenticationRoute.root.name,
      path: AuthenticationRoute.root.path,
      parentNavigatorKey: navigatorKey,
      builder: (BuildContext context, GoRouterState state) =>
          const MainAuthenticationView(),
      routes: [
        loginRoute,
        registerRoute,
      ],
    );
  }
}
