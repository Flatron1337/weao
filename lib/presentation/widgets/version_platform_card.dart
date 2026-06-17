import 'package:flutter/material.dart';

import '../../core/l10n/app_strings.dart';
import '../../core/theme/app_dimens.dart';

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

  /// Single source of truth for platform icon and localized label.
  static ({IconData icon, String label}) _platformMeta(String key) {
    switch (key) {
      case 'Windows':
        return (icon: Icons.desktop_windows_outlined, label: AppStrings.windows);
      case 'Mac':
        return (icon: Icons.laptop_mac_outlined, label: AppStrings.mac);
      case 'Android':
        return (icon: Icons.android_outlined, label: AppStrings.android);
      case 'iOS':
        return (icon: Icons.phone_iphone_outlined, label: AppStrings.ios);
      default:
        return (icon: Icons.devices_outlined, label: key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final meta = _platformMeta(platform);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.cardMarginHorizontal,
        vertical: AppDimens.cardMarginVertical,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.cardPadding),
        child: Row(
          children: [
            Container(
              width: AppDimens.platformIconSize,
              height: AppDimens.platformIconSize,
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(AppDimens.platformIconRadius),
              ),
              child: Icon(meta.icon, color: primaryColor),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meta.label,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: AppDimens.spacingSm),
                  Text(
                    version,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'monospace',
                        ),
                  ),
                  const SizedBox(height: AppDimens.spacingXs),
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
