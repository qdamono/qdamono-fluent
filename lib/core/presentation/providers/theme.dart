import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.freezed.dart';
part 'theme.g.dart';

@freezed
class AppThemeData with _$AppThemeData {
  const factory AppThemeData({
    required Color dividerColor,
    required Color dividerHighlightedColor,
  }) = _AppThemeData;

  factory AppThemeData.dark() {
    final fluentThemeData = FluentThemeData.dark();

    return AppThemeData(
      dividerColor: fluentThemeData.resources.cardStrokeColorDefault,
      dividerHighlightedColor:
          fluentThemeData.resources.cardBackgroundFillColorDefault,
    );
  }

  factory AppThemeData.light() {
    final fluentThemeData = FluentThemeData.light();

    return AppThemeData(
      dividerColor: fluentThemeData.resources.cardStrokeColorDefault,
      dividerHighlightedColor:
          fluentThemeData.resources.controlStrokeColorSecondary,
    );
  }
}

Brightness get systemThemeMode {
  return SchedulerBinding.instance.platformDispatcher.platformBrightness;
}

bool get isSystemThemeDarkMode {
  return systemThemeMode == Brightness.dark;
}

extension ThemeModeExtension on ThemeMode {
  bool get isSystem {
    return this == ThemeMode.system;
  }

  bool get isSameAsSystem {
    return isSystem || (isSystemThemeDarkMode == (this == ThemeMode.dark));
  }

  bool get isDark {
    return this == ThemeMode.dark ||
        (this == ThemeMode.system && isSystemThemeDarkMode);
  }
}

@Riverpod(keepAlive: true)
class AppThemeMode extends _$AppThemeMode {
  @override
  ThemeMode build() => ThemeMode.system;

  void set(ThemeMode newThemeMode) {
    if (kDebugMode) {
      print('Setting theme to $newThemeMode');
    }
    state = newThemeMode;
  }

  bool get isSystem {
    return state.isSystem;
  }

  bool get isSameAsSystem {
    return state.isSameAsSystem;
  }

  bool get isDark {
    return state.isDark;
  }

  void toggle() {
    if (state == ThemeMode.system) {
      set(isSystemThemeDarkMode ? ThemeMode.light : ThemeMode.dark);
    } else {
      set(state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
    }
  }
}

@Riverpod(keepAlive: true)
class AppTheme extends _$AppTheme {
  @override
  AppThemeData build() {
    final mode = ref.watch(appThemeModeProvider);

    if (mode.isDark) {
      return AppThemeData.dark();
    }

    return AppThemeData.light();
  }
}
