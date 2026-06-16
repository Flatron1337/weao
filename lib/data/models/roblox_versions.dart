class PlatformVersion {
  const PlatformVersion({
    required this.platform,
    required this.version,
    required this.date,
  });

  final String platform;
  final String version;
  final String date;

  bool get hasData => version.isNotEmpty && version != '—';
}

class RobloxVersions {
  const RobloxVersions({required this.platforms});

  final List<PlatformVersion> platforms;

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
