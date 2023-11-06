import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qdamono_fluent/core/application/providers/persistent/preferences.dart';
import 'package:qdamono_fluent/core/application/providers/navigation/root_router.dart';
import 'package:qdamono_fluent/core/presentation/providers/theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:qdamono_fluent/l10n/generated/app_localizations.dart';

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop) {
    // await flutter_acrylic.Window.initialize();
    // await flutter_acrylic.Window.hideWindowControls();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );
      await windowManager.setMinimumSize(const Size(500, 600));
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootRouter = ref.watch(rootRouterProvider);
    final appThemeMode = ref.watch(appThemeModeProvider);
    final preferences = ref.watch(appPreferencesProvider);

    final lightTheme = FluentThemeData.light();
    final darkTheme = FluentThemeData.dark();
    var lightTypography =
        Typography.fromBrightness(brightness: Brightness.light);
    var darkTypography = Typography.fromBrightness(brightness: Brightness.dark);

    lightTypography =
        lightTypography.apply(fontSizeFactor: preferences.bodyFontSizeFactor);
    darkTypography =
        darkTypography.apply(fontSizeFactor: preferences.bodyFontSizeFactor);

    return FluentApp.router(
      title: 'My app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      locale: Locale(preferences.locale),
      darkTheme: darkTheme.copyWith(typography: darkTypography),
      theme: lightTheme.copyWith(typography: lightTypography),
      themeMode: appThemeMode,
      routeInformationParser: rootRouter.routeInformationParser,
      routerDelegate: rootRouter.routerDelegate,
      routeInformationProvider: rootRouter.routeInformationProvider,
    );
  }
}
