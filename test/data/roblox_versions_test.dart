import 'package:flutter_test/flutter_test.dart';

import 'package:weao/data/models/roblox_versions.dart';

void main() {
  group('PlatformVersion', () {
    test('hasData true for non-empty non-dash version', () {
      const v = PlatformVersion(
        platform: 'Windows',
        version: 'v642',
        date: '2025-06-15',
      );
      expect(v.hasData, isTrue);
    });

    test('hasData false for empty version', () {
      const v = PlatformVersion(platform: 'Windows', version: '', date: '—');
      expect(v.hasData, isFalse);
    });

    test('hasData false for dash version', () {
      const v = PlatformVersion(platform: 'Mac', version: '—', date: '—');
      expect(v.hasData, isFalse);
    });
  });

  group('RobloxVersions.fromJson', () {
    test('parses all four platforms', () {
      final versions = RobloxVersions.fromJson(<String, dynamic>{
        'Windows': 'v642',
        'WindowsDate': '2025-06-15',
        'Mac': 'v641',
        'MacDate': '2025-06-14',
        'Android': 'v640',
        'AndroidDate': '2025-06-13',
        'iOS': 'v639',
        'iOSDate': '2025-06-12',
      });

      expect(versions.platforms.length, 4);
      expect(
        versions.platforms.map((p) => p.platform),
        containsAll(['Windows', 'Mac', 'Android', 'iOS']),
      );
      expect(
        versions.platforms.firstWhere((p) => p.platform == 'Windows').version,
        'v642',
      );
      expect(
        versions.platforms.firstWhere((p) => p.platform == 'iOS').date,
        '2025-06-12',
      );
    });

    test('skips platforms with empty version', () {
      final versions = RobloxVersions.fromJson(<String, dynamic>{
        'Windows': 'v642',
        'WindowsDate': '2025-06-15',
        'Mac': '',
        'Android': '',
        // iOS omitted entirely -> defaults to '—' which is non-empty
      });

      // Only Windows and iOS remain: Windows explicit, iOS defaulted to '—'.
      expect(versions.platforms.length, 2);
      final windows = versions.platforms.firstWhere(
        (p) => p.platform == 'Windows',
      );
      expect(windows.version, 'v642');
      final ios = versions.platforms.firstWhere((p) => p.platform == 'iOS');
      expect(ios.version, '—');
      // hasData distinguishes real data from '—' defaults.
      expect(ios.hasData, isFalse);
    });

    test(
      'handles all-absent input (defaults to dash, all non-empty strings)',
      () {
        final versions = RobloxVersions.fromJson(<String, dynamic>{});
        // All four keys default to '—' which is non-empty, so all are added,
        // but none carry real data per hasData.
        expect(versions.platforms.length, 4);
        expect(versions.platforms.every((p) => !p.hasData), isTrue);
      },
    );

    test('uses dash default for missing dates', () {
      final versions = RobloxVersions.fromJson(<String, dynamic>{
        'Windows': 'v642',
        // WindowsDate omitted
      });

      // Only Windows has real version data.
      final withData = versions.platforms.where((p) => p.hasData).toList();
      expect(withData.length, 1);
      expect(withData.single.platform, 'Windows');
      expect(withData.single.version, 'v642');
      expect(withData.single.date, '—');
    });
  });
}
