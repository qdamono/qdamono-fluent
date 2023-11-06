import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/persistent/preferences.dart';
import 'package:qdamono_fluent/core/presentation/providers/theme.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations_en.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations_pl.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: Text(AppLocalizations.of(context).settings),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              const LocaleSettingForm(),
              const SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).language),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              ApiEndpointForm(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              const AppThemeModeCheckbox(mode: ThemeMode.system),
              const SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).systemTheme),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              const AppThemeModeCheckbox(mode: ThemeMode.light),
              const SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).lightTheme),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              const AppThemeModeCheckbox(mode: ThemeMode.dark),
              const SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).darkTheme),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              const BodyFontSizeForm(),
              const SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).fontSize),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
          ),
          child: Row(
            children: [
              const BodyFontSizeFactorForm(),
              const SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).fontSizeFactor),
            ],
          ),
        ),
        const SettingsPreview(),
      ],
    );
  }
}

class LocaleSettingForm extends ConsumerWidget {
  const LocaleSettingForm({super.key});

  String getLocaleLabel(AppLocalizations appLocalizations, String locale) {
    String label = switch (locale) {
      'en' => appLocalizations.englishLanguage,
      'pl' => appLocalizations.polishLanguage,
      _ => locale,
    };

    if (locale != appLocalizations.localeName) {
      final labelExtension = switch (locale) {
        'en' => AppLocalizationsEn().englishLanguage,
        'pl' => AppLocalizationsPl().polishLanguage,
        _ => locale,
      };
      label += ' ($labelExtension)';
    }

    return label;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale =
        ref.watch(appPreferencesProvider.select((value) => value.locale));

    return ComboBox(
      value: currentLocale,
      onChanged: (value) {
        if (value != null) {
          ref.read(appPreferencesProvider.notifier).setLocale(value);
        }
      },
      items: AppLocalizations.supportedLocales
          .map(
            (e) => ComboBoxItem(
              value: e.languageCode,
              child: Text(getLocaleLabel(
                  AppLocalizations.of(context), e.toLanguageTag())),
            ),
          )
          .toList(),
    );
  }
}

class ApiEndpointForm extends ConsumerStatefulWidget {
  const ApiEndpointForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ApiEndpointFormState();
}

class _ApiEndpointFormState extends ConsumerState<ApiEndpointForm> {
  String text = '';
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = ref.read(appPreferencesProvider.select(
      (value) => value.apiAddress,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoLabel(
          label: 'API URL',
          child: Row(
            children: [
              SizedBox(
                width: 200.0,
                child: TextBox(
                  placeholder: 'https://qdamono.xyz/api',
                  expands: false,
                  controller: _controller,
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Button(
                    onPressed: () {
                      ref
                          .read(appPreferencesProvider.notifier)
                          .setApiAddress(_controller.text);
                    },
                    child: const Text('Set'),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class AppThemeModeCheckbox extends ConsumerWidget {
  final ThemeMode mode;

  const AppThemeModeCheckbox({super.key, required this.mode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(appThemeModeProvider);

    return Checkbox(
        checked: currentMode == mode,
        onChanged: (value) {
          ref.read(appThemeModeProvider.notifier).set(mode);
        });
  }
}

class BodyFontSizeForm extends ConsumerWidget {
  const BodyFontSizeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodyFontSize = ref.watch(appPreferencesProvider.select(
      (value) => value.bodyFontSize,
    ));

    return SizedBox(
      width: 150,
      child: NumberBox(
        mode: SpinButtonPlacementMode.inline,
        clearButton: false,
        value: bodyFontSize,
        onChanged: (newValue) {
          if (newValue != null) {
            ref.read(appPreferencesProvider.notifier).setBodyFontSize(newValue);
          }
        },
      ),
    );
  }
}

class BodyFontSizeFactorForm extends ConsumerStatefulWidget {
  const BodyFontSizeFactorForm({super.key});

  @override
  ConsumerState<BodyFontSizeFactorForm> createState() =>
      _BodyFontSizeFactorFormState();
}

class _BodyFontSizeFactorFormState
    extends ConsumerState<BodyFontSizeFactorForm> {
  late double factor;

  _BodyFontSizeFactorFormState();

  @override
  void initState() {
    super.initState();
    factor = ref.read(appPreferencesProvider).bodyFontSizeFactor;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.5,
      max: 2.0,
      value: factor,
      onChanged: (newValue) {
        setState(
          () {
            factor = newValue;
          },
        );
      },
      onChangeEnd: (newValue) {
        ref
            .read(appPreferencesProvider.notifier)
            .setBodyFontSizeFactor(newValue);
      },
    );
  }
}

class SettingsPreview extends ConsumerWidget {
  const SettingsPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(appPreferencesProvider);

    return Expander(
      initiallyExpanded: true,
      header: Text(
        AppLocalizations.of(context).preview,
        style: FluentTheme.of(context).typography.body!.copyWith(
              fontSize: prefs.menuFontSize.toDouble(),
            ),
      ),
      content: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        style: FluentTheme.of(context).typography.body!.copyWith(
              fontSize: prefs.bodyFontSize.toDouble(),
            ),
      ),
    );
  }
}
