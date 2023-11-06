import 'package:qdamono_fluent/core/application/navigation/routes.dart';

enum AuthenticationRoute implements AppRoute {
  root,
  login,
  register;

  @override
  String get name {
    return switch (this) {
      AuthenticationRoute.root => 'auth',
      AuthenticationRoute.login => 'login',
      AuthenticationRoute.register => 'register',
    };
  }

  @override
  String get path {
    return switch (this) {
      AuthenticationRoute.root => 'auth',
      AuthenticationRoute.login => 'login',
      AuthenticationRoute.register => 'register',
    };
  }
}
