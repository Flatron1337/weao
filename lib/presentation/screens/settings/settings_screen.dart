import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weao/l10n/generated/app_localizations.dart';

import '../../providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.tabSettings)),
      body: ListView(
        children: [
          ListTile(
            title: Text(l10n.theme),
            trailing: DropdownButton<ThemeMode>(
              value: settings.themeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System'),
                ),
                DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
              ],
              onChanged: (mode) {
                if (mode != null) notifier.setThemeMode(mode);
              },
            ),
          ),
          ListTile(
            title: Text(l10n.language),
            trailing: DropdownButton<Locale?>(
              value: settings.locale,
              items: const [
                DropdownMenuItem(child: Text('System')),
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('ru'), child: Text('Русский')),
              ],
              onChanged: (locale) {
                notifier.setLocale(locale);
              },
            ),
          ),
          ListTile(
            title: Text(l10n.clearCache),
            trailing: const Icon(Icons.delete_outline),
            onTap: () async {
              await notifier.clearCache();
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.cacheCleared)));
              }
            },
          ),
        ],
      ),
    );
  }
}
