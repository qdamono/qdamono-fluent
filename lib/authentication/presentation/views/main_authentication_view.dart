import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/authentication/application/navigation/routes.dart';
import 'package:qdamono_fluent/authentication/application/providers/auth_service.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/app_nav.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class MainAuthenticationView extends ConsumerWidget {
  const MainAuthenticationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authServiceProvider);

    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).account),
      ),
      content: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Card(
                child: Row(
                  children: [
                    Text(
                        '${AppLocalizations.of(context).currentUser}: ${authState.email}'),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: Button(
                onPressed: authState.isAuthenticated
                    ? null
                    : () {
                        ref
                            .read(appNavProvider.notifier)
                            .go(AuthenticationRoute.login);
                      },
                child: Text(AppLocalizations.of(context).logInButtonLabel),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: Button(
                onPressed: authState.isAuthenticated
                    ? null
                    : () {
                        ref
                            .read(appNavProvider.notifier)
                            .go(AuthenticationRoute.register);
                      },
                child: Text(AppLocalizations.of(context).registerButtonLabel),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: Button(
                onPressed: authState.isAuthenticated
                    ? () {
                        ref.read(authServiceProvider.notifier).logout();
                      }
                    : null,
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
