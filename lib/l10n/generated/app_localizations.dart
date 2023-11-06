import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  ///
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  ///
  ///
  /// In en, this message translates to:
  /// **'All projects'**
  String get allProjects;

  ///
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get analysis;

  ///
  ///
  /// In en, this message translates to:
  /// **'Codes'**
  String get codes;

  ///
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  ///
  ///
  /// In en, this message translates to:
  /// **'Confirm close'**
  String get confirmClose;

  ///
  ///
  /// In en, this message translates to:
  /// **'Are You sure You want to close this window?'**
  String get confirmCloseDetail;

  ///
  ///
  /// In en, this message translates to:
  /// **'Current user'**
  String get currentUser;

  ///
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get darkTheme;

  ///
  ///
  /// In en, this message translates to:
  /// **'Diagram'**
  String get diagram;

  ///
  ///
  /// In en, this message translates to:
  /// **'english'**
  String get englishLanguage;

  ///
  ///
  /// In en, this message translates to:
  /// **'Files'**
  String get files;

  ///
  ///
  /// In en, this message translates to:
  /// **'Font size'**
  String get fontSize;

  ///
  ///
  /// In en, this message translates to:
  /// **'Font size factor'**
  String get fontSizeFactor;

  ///
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  ///
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  ///
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  ///
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get lightTheme;

  ///
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get logInButtonLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get loginViewPageHeader;

  ///
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  ///
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  ///
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  ///
  ///
  /// In en, this message translates to:
  /// **'polish'**
  String get polishLanguage;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  ///
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButtonLabel;

  ///
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerViewPageHeader;

  ///
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  ///
  ///
  /// In en, this message translates to:
  /// **'System theme'**
  String get systemTheme;

  ///
  ///
  /// In en, this message translates to:
  /// **'TypeYourEmailHere'**
  String get typeYourEmailHere;

  ///
  ///
  /// In en, this message translates to:
  /// **'Workspace'**
  String get workspace;

  ///
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
