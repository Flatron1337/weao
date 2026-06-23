import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'WEAO'**
  String get appTitle;

  /// No description provided for @tabExploits.
  ///
  /// In en, this message translates to:
  /// **'Exploits'**
  String get tabExploits;

  /// No description provided for @tabVersions.
  ///
  /// In en, this message translates to:
  /// **'Versions'**
  String get tabVersions;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get searchHint;

  /// No description provided for @noExploits.
  ///
  /// In en, this message translates to:
  /// **'No exploits found'**
  String get noExploits;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResults;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavorites;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @noVersions.
  ///
  /// In en, this message translates to:
  /// **'No versions found'**
  String get noVersions;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get filterFavorites;

  /// No description provided for @addToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get removeFromFavorites;

  /// No description provided for @updated.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get updated;

  /// No description provided for @notUpdated.
  ///
  /// In en, this message translates to:
  /// **'Not updated'**
  String get notUpdated;

  /// No description provided for @detected.
  ///
  /// In en, this message translates to:
  /// **'Detected'**
  String get detected;

  /// No description provided for @undetected.
  ///
  /// In en, this message translates to:
  /// **'Undetected'**
  String get undetected;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @unc.
  ///
  /// In en, this message translates to:
  /// **'UNC'**
  String get unc;

  /// No description provided for @sunc.
  ///
  /// In en, this message translates to:
  /// **'sUNC'**
  String get sunc;

  /// No description provided for @exploitDetails.
  ///
  /// In en, this message translates to:
  /// **'Exploit Details'**
  String get exploitDetails;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @updatedDate.
  ///
  /// In en, this message translates to:
  /// **'Updated Date'**
  String get updatedDate;

  /// No description provided for @robloxVersion.
  ///
  /// In en, this message translates to:
  /// **'Roblox Version'**
  String get robloxVersion;

  /// No description provided for @platform.
  ///
  /// In en, this message translates to:
  /// **'Platform'**
  String get platform;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @decompiler.
  ///
  /// In en, this message translates to:
  /// **'Decompiler'**
  String get decompiler;

  /// No description provided for @multiInject.
  ///
  /// In en, this message translates to:
  /// **'Multi-inject'**
  String get multiInject;

  /// No description provided for @keysystem.
  ///
  /// In en, this message translates to:
  /// **'Key-system'**
  String get keysystem;

  /// No description provided for @clientMods.
  ///
  /// In en, this message translates to:
  /// **'Client mods bypass'**
  String get clientMods;

  /// No description provided for @raknet.
  ///
  /// In en, this message translates to:
  /// **'Raknet'**
  String get raknet;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @discord.
  ///
  /// In en, this message translates to:
  /// **'Discord'**
  String get discord;

  /// No description provided for @purchase.
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase;

  /// No description provided for @versionsCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get versionsCurrent;

  /// No description provided for @versionsFuture.
  ///
  /// In en, this message translates to:
  /// **'Future'**
  String get versionsFuture;

  /// No description provided for @versionsPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get versionsPast;

  /// No description provided for @robloxVersions.
  ///
  /// In en, this message translates to:
  /// **'Roblox Versions'**
  String get robloxVersions;

  /// No description provided for @windows.
  ///
  /// In en, this message translates to:
  /// **'Windows'**
  String get windows;

  /// No description provided for @mac.
  ///
  /// In en, this message translates to:
  /// **'Mac'**
  String get mac;

  /// No description provided for @android.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get android;

  /// No description provided for @ios.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get ios;

  /// No description provided for @suncTests.
  ///
  /// In en, this message translates to:
  /// **'sUNC Tests'**
  String get suncTests;

  /// No description provided for @suncUnavailable.
  ///
  /// In en, this message translates to:
  /// **'sUNC data unavailable'**
  String get suncUnavailable;

  /// No description provided for @suncPassed.
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get suncPassed;

  /// No description provided for @suncFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get suncFailed;

  /// No description provided for @suncAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get suncAll;

  /// No description provided for @suncOutdated.
  ///
  /// In en, this message translates to:
  /// **'Outdated build'**
  String get suncOutdated;

  /// No description provided for @suncTimeTaken.
  ///
  /// In en, this message translates to:
  /// **'Time taken'**
  String get suncTimeTaken;

  /// No description provided for @suncExecutor.
  ///
  /// In en, this message translates to:
  /// **'Executor'**
  String get suncExecutor;

  /// No description provided for @suncReason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get suncReason;

  /// No description provided for @cachedDataBanner.
  ///
  /// In en, this message translates to:
  /// **'Showing cached data from {date}. Offline or API unavailable.'**
  String cachedDataBanner(String date);

  /// No description provided for @rateLimitMessage.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Try again in {seconds} sec.'**
  String rateLimitMessage(int seconds);

  /// No description provided for @rateLimitGeneric.
  ///
  /// In en, this message translates to:
  /// **'Too many requests. Try again later.'**
  String get rateLimitGeneric;

  /// No description provided for @timeoutError.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout'**
  String get timeoutError;

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noConnection;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Failed to load data'**
  String get genericError;

  /// No description provided for @linkError.
  ///
  /// In en, this message translates to:
  /// **'Failed to open link'**
  String get linkError;

  /// No description provided for @tabSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCache;

  /// No description provided for @cacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheCleared;
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
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
