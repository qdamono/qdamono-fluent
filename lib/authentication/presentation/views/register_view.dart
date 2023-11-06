import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/authentication/application/providers/auth_service.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.addListener(
      () {
        final text = _loginController.text;
        print('Login text: $text');
      },
    );
    _passwordController.addListener(
      () {
        final text = _loginController.text;
        print('Password text: $text');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).registerViewPageHeader),
      ),
      content: Center(
        child: SizedBox.square(
            dimension: 200.0,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: InfoLabel(
                    label: 'Login',
                    child: TextBox(
                      controller: _loginController,
                      placeholder:
                          AppLocalizations.of(context).typeYourEmailHere,
                      expands: false,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: InfoLabel(
                    label: AppLocalizations.of(context).password,
                    child: TextBox(
                      controller: _passwordController,
                      placeholder: '*****',
                      expands: false,
                      obscureText: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Button(
                    onPressed: () {
                      final email = _loginController.text;
                      final password = _passwordController.text;

                      ref
                          .read(authServiceProvider.notifier)
                          .register(email, password);
                    },
                    child:
                        Text(AppLocalizations.of(context).registerButtonLabel),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
