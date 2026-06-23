import 'package:freezed_annotation/freezed_annotation.dart';

part 'roblox_versions.freezed.dart';
part 'roblox_versions.g.dart';

@freezed
abstract class PlatformVersion with _$PlatformVersion {
  const factory PlatformVersion({
    required String platform,
    required String version,
    required String date,
  }) = _PlatformVersion;
  const PlatformVersion._();

  bool get hasData => version.isNotEmpty && version != '—';

  factory PlatformVersion.fromJson(Map<String, Object?> json) =>
      _$PlatformVersionFromJson(json);
}

@freezed
abstract class RobloxVersions with _$RobloxVersions {
  const factory RobloxVersions({required List<PlatformVersion> platforms}) =
      _RobloxVersions;
  const RobloxVersions._();

  factory RobloxVersions.fromJson(Map<String, dynamic> json) {
    final platforms = <PlatformVersion>[];

    void add(String platform, String versionKey, String dateKey) {
      final version = json[versionKey] as String? ?? '—';
      final date = json[dateKey] as String? ?? '—';
      if (version.isNotEmpty) {
        platforms.add(
          PlatformVersion(platform: platform, version: version, date: date),
        );
      }
    }

    add('Windows', 'Windows', 'WindowsDate');
    add('Mac', 'Mac', 'MacDate');
    add('Android', 'Android', 'AndroidDate');
    add('iOS', 'iOS', 'iOSDate');

    return RobloxVersions(platforms: platforms);
  }
}
