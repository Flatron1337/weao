import 'package:flutter/material.dart';

import '../../core/l10n/app_strings.dart';

class VersionPlatformCard extends StatelessWidget {
  const VersionPlatformCard({
    super.key,
    required this.platform,
    required this.version,
    required this.date,
  });

  final String platform;
  final String version;
  final String date;

  IconData get _platformIcon {
    switch (platform) {
      case AppStrings.windows:
        return Icons.desktop_windows_outlined;
      case AppStrings.mac:
        return Icons.laptop_mac_outlined;
      case AppStrings.android:
        return Icons.android_outlined;
      case AppStrings.ios:
        return Icons.phone_iphone_outlined;
      default:
        return Icons.devices_outlined;
    }
  }

  String get _platformLabel {
    switch (platform) {
      case 'Windows':
        return AppStrings.windows;
      case 'Mac':
        return AppStrings.mac;
      case 'Android':
        return AppStrings.android;
      case 'iOS':
        return AppStrings.ios;
      default:
        return platform;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                _platformIcon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _platformLabel,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    version,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white38,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
