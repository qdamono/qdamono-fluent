import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/navigation/routes.dart';
import 'package:qdamono_fluent/authentication/application/providers/auth_service.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/app_nav.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).home),
      ),
      content: const Column(
        children: [
          Center(
            child: HardcodedRegisterButton(),
          ),
          Center(
            child: HardcodedLoginButton(),
          ),
          Center(
            child: GoToProjectListButton(),
          ),
        ],
      ),
    );
  }
}

class HardcodedRegisterButton extends ConsumerWidget {
  const HardcodedRegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated =
        ref.watch(authServiceProvider.select((value) => value.isAuthenticated));
    final onPressed = isAuthenticated
        ? null
        : () {
            ref
                .read(authServiceProvider.notifier)
                .register("example123@gmail.com", "Pass123#");
          };
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Button(
        onPressed: onPressed,
        child: Text(
            '${AppLocalizations.of(context).registerButtonLabel}: example123@gmail.com'),
      ),
    );
  }
}

class HardcodedLoginButton extends ConsumerWidget {
  const HardcodedLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated =
        ref.watch(authServiceProvider.select((value) => value.isAuthenticated));
    final onPressed = isAuthenticated
        ? null
        : () {
            ref
                .read(authServiceProvider.notifier)
                .login("example123@gmail.com", "Pass123#");
          };

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Button(
        onPressed: onPressed,
        child: Text(
            '${AppLocalizations.of(context).logInButtonLabel}: example123@gmail.com'),
      ),
    );
  }
}

class GoToProjectListButton extends ConsumerWidget {
  const GoToProjectListButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated =
        ref.watch(authServiceProvider.select((value) => value.isAuthenticated));

    final onPressed = isAuthenticated
        ? () {
            ref.read(appNavProvider.notifier).push(HomeRoute.projectList);
          }
        : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Button(
        onPressed: onPressed,
        child: Text(AppLocalizations.of(context).allProjects),
      ),
    );
  }
}
