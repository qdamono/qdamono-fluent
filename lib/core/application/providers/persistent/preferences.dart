import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.g.dart';
part 'preferences.freezed.dart';

class DefaultAppPreferencesData {
  static const int bodyFontSize = 15;
  static const double bodyFontSizeFactor = 1.0;
  static const int menuFontSize = 20;
  static const double menuFontSizeFactor = 1.0;
  static const String apiAddress = "https://qdamono.xyz/api";
  static const String email = "";
  static const String accessToken = "";
  static const String locale = "en";
}

class AppPreferencesKeys {
  static const String bodyFontSize = 'bodyFontSize';
  static const String bodyFontSizeFactor = 'bodyFontSizeFactor';
  static const String menuFontSize = 'menuFontSize';
  static const String menuFontSizeFactor = 'menuFontSizeFactor';
  static const String apiAddress = "apiAddress";
  static const String email = 'email';
  static const String accessToken = 'accessToken';
  static const String locale = "locale";
}

@freezed
class AppPreferencesData with _$AppPreferencesData {
  const factory AppPreferencesData({
    @Default(DefaultAppPreferencesData.bodyFontSize) int bodyFontSize,
    @Default(DefaultAppPreferencesData.bodyFontSizeFactor)
    double bodyFontSizeFactor,
    @Default(DefaultAppPreferencesData.menuFontSize) int menuFontSize,
    @Default(DefaultAppPreferencesData.menuFontSizeFactor)
    double menuFontSizeFactor,
    @Default(DefaultAppPreferencesData.apiAddress) String apiAddress,
    @Default(DefaultAppPreferencesData.email) String email,
    @Default(DefaultAppPreferencesData.accessToken) String accessToken,
    @Default(DefaultAppPreferencesData.locale) String locale,
  }) = _AppPreferencesData;
}

@Riverpod(keepAlive: true)
class AppPreferences extends _$AppPreferences {
  late SharedPreferences _instance;

  @override
  AppPreferencesData build() {
    if (kDebugMode) {
      print('Shared preferences are not yet initialized.');
    }

    ensureInitialized();

    return const AppPreferencesData();
  }

  Future<void> ensureInitialized() async {
    _instance = await SharedPreferences.getInstance();

    state = _loadFromPreferences(_instance);

    if (kDebugMode) {
      print('Shared preferences are initialized.');
    }
  }

  Future<void> set({
    int? bodyFontSize,
    double? bodyFontSizeFactor,
    int? menuFontSize,
    double? menuFontSizeFactor,
    String? apiAddress,
    String? email,
    String? accessToken,
    String? locale,
  }) async {
    int bodyFontSizeToSave = state.bodyFontSize;
    double bodyFontSizeFactorToSave = state.bodyFontSizeFactor;
    int menuFontSizeToSave = state.menuFontSize;
    double menuFontSizeFactorToSave = state.menuFontSizeFactor;
    String apiAddressToSave = state.apiAddress;
    String emailToSave = state.email;
    String accessTokenToSave = state.accessToken;
    String localeToSave = state.locale;

    if (bodyFontSize != null) {
      final success =
          await _instance.setInt(AppPreferencesKeys.bodyFontSize, bodyFontSize);

      if (success) {
        bodyFontSizeToSave = bodyFontSize;
      } else if (kDebugMode) {
        print('Failed to save bodyFontSize in shared preferences.');
      }
    }

    if (bodyFontSizeFactor != null) {
      final success = await _instance.setDouble(
          AppPreferencesKeys.bodyFontSizeFactor, bodyFontSizeFactor);

      if (!success) {
        bodyFontSizeFactorToSave = bodyFontSizeFactor;
      } else if (kDebugMode) {
        print('Failed to save bodyFontSizeFactor in shared preferences.');
      }
    }

    if (menuFontSize != null) {
      final success =
          await _instance.setInt(AppPreferencesKeys.menuFontSize, menuFontSize);

      if (success) {
        menuFontSizeToSave = menuFontSize;
      } else if (kDebugMode) {
        print('Failed to save menuFontSize in shared preferences.');
      }
    }

    if (menuFontSizeFactor != null) {
      final success = await _instance.setDouble(
          AppPreferencesKeys.menuFontSizeFactor, menuFontSizeFactor);

      if (success) {
        menuFontSizeFactorToSave = menuFontSizeFactor;
      } else if (kDebugMode) {
        print('Failed to save menuFontSizeFactor in shared preferences.');
      }
    }

    if (apiAddress != null) {
      final success =
          await _instance.setString(AppPreferencesKeys.apiAddress, apiAddress);

      if (success) {
        apiAddressToSave = apiAddress;
      } else if (kDebugMode) {
        print('Failed to save apiAddress in shared preferences.');
      }
    }

    if (email != null) {
      final success =
          await _instance.setString(AppPreferencesKeys.email, email);

      if (success) {
        emailToSave = email;
      } else {
        if (kDebugMode) {
          print('Failed to save email in shared preferences.');
        }
      }
    }

    if (accessToken != null) {
      final success = await _instance.setString(
          AppPreferencesKeys.accessToken, accessToken);

      if (success) {
        accessTokenToSave = accessToken;
      } else if (kDebugMode) {
        print('Failed to save accessToken in shared preferences.');
      }
    }

    if (locale != null) {
      final success =
          await _instance.setString(AppPreferencesKeys.locale, locale);

      if (success) {
        localeToSave = locale;
      } else if (kDebugMode) {
        print('Failed to save locale in shared preferences.');
      }
    }

    state = state.copyWith(
      bodyFontSize: bodyFontSizeToSave,
      bodyFontSizeFactor: bodyFontSizeFactorToSave,
      menuFontSize: menuFontSizeToSave,
      menuFontSizeFactor: menuFontSizeFactorToSave,
      apiAddress: apiAddressToSave,
      email: emailToSave,
      accessToken: accessTokenToSave,
      locale: localeToSave,
    );
  }

  Future<void> setBodyFontSize(int size) async {
    final success =
        await _instance.setInt(AppPreferencesKeys.bodyFontSize, size);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save bodyFontSize in shared preferences.');
      }

      return;
    }

    state = state.copyWith(bodyFontSize: size);
  }

  Future<void> setBodyFontSizeFactor(double factor) async {
    final success = await _instance.setDouble(
        AppPreferencesKeys.bodyFontSizeFactor, factor);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save bodyFontSizeFactor in shared preferences.');
      }

      return;
    }

    state = state.copyWith(bodyFontSizeFactor: factor);
  }

  Future<void> setMenuFontSize(int size) async {
    final success =
        await _instance.setInt(AppPreferencesKeys.menuFontSize, size);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save menuFontSize in shared preferences.');
      }

      return;
    }

    state = state.copyWith(menuFontSize: size);
  }

  Future<void> setMenuFontSizeFactor(double factor) async {
    final success = await _instance.setDouble(
        AppPreferencesKeys.menuFontSizeFactor, factor);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save menuFontSizeFactor in shared preferences.');
      }

      return;
    }

    state = state.copyWith(menuFontSizeFactor: factor);
  }

  Future<void> setApiAddress(String apiAddress) async {
    final success =
        await _instance.setString(AppPreferencesKeys.apiAddress, apiAddress);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save apiAddress in shared preferences.');
      }

      return;
    }

    state = state.copyWith(apiAddress: apiAddress);
  }

  Future<void> setEmail(String email) async {
    final success = await _instance.setString(AppPreferencesKeys.email, email);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save email in shared preferences.');
      }

      return;
    }

    state = state.copyWith(email: email);
  }

  Future<void> setAccessToken(String accessToken) async {
    final success =
        await _instance.setString(AppPreferencesKeys.accessToken, accessToken);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save accessToken in shared preferences.');
      }

      return;
    }

    state = state.copyWith(accessToken: accessToken);
  }

  Future<void> setLocale(String locale) async {
    final success =
        await _instance.setString(AppPreferencesKeys.locale, locale);

    if (!success) {
      if (kDebugMode) {
        print('Failed to save locale in shared preferences.');
      }

      return;
    }

    state = state.copyWith(locale: locale);
  }

  static AppPreferencesData _loadFromPreferences(SharedPreferences instance) {
    final bodyFontSize = instance.getInt(AppPreferencesKeys.bodyFontSize) ??
        DefaultAppPreferencesData.bodyFontSize;
    final bodyFontSizeFactor =
        instance.getDouble(AppPreferencesKeys.bodyFontSizeFactor) ??
            DefaultAppPreferencesData.bodyFontSizeFactor;
    final menuFontSize = instance.getInt(AppPreferencesKeys.menuFontSize) ??
        DefaultAppPreferencesData.menuFontSize;
    final menuFontSizeFactor =
        instance.getDouble(AppPreferencesKeys.menuFontSizeFactor) ??
            DefaultAppPreferencesData.menuFontSizeFactor;
    final apiAddress = instance.getString(AppPreferencesKeys.apiAddress) ??
        DefaultAppPreferencesData.apiAddress;
    final email = instance.getString(AppPreferencesKeys.email) ??
        DefaultAppPreferencesData.email;
    final accessToken = instance.getString(AppPreferencesKeys.accessToken) ??
        DefaultAppPreferencesData.accessToken;
    final locale = instance.getString(AppPreferencesKeys.locale) ??
        DefaultAppPreferencesData.locale;

    return AppPreferencesData(
      bodyFontSize: bodyFontSize,
      bodyFontSizeFactor: bodyFontSizeFactor,
      menuFontSize: menuFontSize,
      menuFontSizeFactor: menuFontSizeFactor,
      apiAddress: apiAddress,
      email: email,
      accessToken: accessToken,
      locale: locale,
    );
  }
}
