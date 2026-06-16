import 'package:flutter/material.dart';

import '../../core/l10n/app_strings.dart';

class StaleDataBanner extends StatelessWidget {
  const StaleDataBanner({super.key, required this.cachedAt});

  final DateTime cachedAt;

  String _formatDate(DateTime date) {
    final local = date.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    final year = local.year;
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$day.$month.$year $hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber.withValues(alpha: 0.12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 18,
              color: Colors.amber.shade200,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                AppStrings.cachedDataBanner(_formatDate(cachedAt)),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.amber.shade100,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
