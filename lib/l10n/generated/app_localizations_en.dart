// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WEAO';

  @override
  String get tabExploits => 'Exploits';

  @override
  String get tabVersions => 'Versions';

  @override
  String get searchHint => 'Search by name...';

  @override
  String get noExploits => 'No exploits found';

  @override
  String get noResults => 'No results';

  @override
  String get noFavorites => 'No favorites yet';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get noVersions => 'No versions found';

  @override
  String get filterAll => 'All';

  @override
  String get filterFavorites => 'Favorites';

  @override
  String get addToFavorites => 'Add to favorites';

  @override
  String get removeFromFavorites => 'Remove from favorites';

  @override
  String get updated => 'Updated';

  @override
  String get notUpdated => 'Not updated';

  @override
  String get detected => 'Detected';

  @override
  String get undetected => 'Undetected';

  @override
  String get free => 'Free';

  @override
  String get paid => 'Paid';

  @override
  String get unc => 'UNC';

  @override
  String get sunc => 'sUNC';

  @override
  String get exploitDetails => 'Exploit Details';

  @override
  String get version => 'Version';

  @override
  String get updatedDate => 'Updated Date';

  @override
  String get robloxVersion => 'Roblox Version';

  @override
  String get platform => 'Platform';

  @override
  String get type => 'Type';

  @override
  String get cost => 'Cost';

  @override
  String get features => 'Features';

  @override
  String get decompiler => 'Decompiler';

  @override
  String get multiInject => 'Multi-inject';

  @override
  String get keysystem => 'Key-system';

  @override
  String get clientMods => 'Client mods bypass';

  @override
  String get raknet => 'Raknet';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get website => 'Website';

  @override
  String get discord => 'Discord';

  @override
  String get purchase => 'Purchase';

  @override
  String get versionsCurrent => 'Current';

  @override
  String get versionsFuture => 'Future';

  @override
  String get versionsPast => 'Past';

  @override
  String get robloxVersions => 'Roblox Versions';

  @override
  String get windows => 'Windows';

  @override
  String get mac => 'Mac';

  @override
  String get android => 'Android';

  @override
  String get ios => 'iOS';

  @override
  String get suncTests => 'sUNC Tests';

  @override
  String get suncUnavailable => 'sUNC data unavailable';

  @override
  String get suncPassed => 'Passed';

  @override
  String get suncFailed => 'Failed';

  @override
  String get suncAll => 'All';

  @override
  String get suncOutdated => 'Outdated build';

  @override
  String get suncTimeTaken => 'Time taken';

  @override
  String get suncExecutor => 'Executor';

  @override
  String get suncReason => 'Reason';

  @override
  String cachedDataBanner(String date) {
    return 'Showing cached data from $date. Offline or API unavailable.';
  }

  @override
  String rateLimitMessage(int seconds) {
    return 'Too many requests. Try again in $seconds sec.';
  }

  @override
  String get rateLimitGeneric => 'Too many requests. Try again later.';

  @override
  String get timeoutError => 'Connection timeout';

  @override
  String get noConnection => 'No internet connection';

  @override
  String get genericError => 'Failed to load data';

  @override
  String get linkError => 'Failed to open link';

  @override
  String get tabSettings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get clearCache => 'Clear Cache';

  @override
  String get cacheCleared => 'Cache cleared';
}
