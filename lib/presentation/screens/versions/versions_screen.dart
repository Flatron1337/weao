import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/weao_exception.dart';
import '../../../core/l10n/app_strings.dart';
import '../../providers/versions_provider.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';
import '../../widgets/stale_data_banner.dart';
import '../../widgets/version_platform_card.dart';

class VersionsScreen extends ConsumerWidget {
  const VersionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channel = ref.watch(versionChannelProvider);
    final versionsAsync = ref.watch(versionsProvider);

    return DefaultTabController(
      length: 3,
      initialIndex: channel.index,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.robloxVersions),
          bottom: TabBar(
            onTap: (index) {
              ref
                  .read(versionChannelProvider.notifier)
                  .setChannel(VersionChannel.values[index]);
            },
            tabs: const [
              Tab(text: AppStrings.versionsCurrent),
              Tab(text: AppStrings.versionsFuture),
              Tab(text: AppStrings.versionsPast),
            ],
          ),
        ),
        body: versionsAsync.when(
          loading: () => const LoadingView(),
          error: (error, _) => ErrorView(
            message: _errorMessage(error),
            onRetry: () => ref.invalidate(versionsProvider),
          ),
          data: (result) {
            final platforms = result.data.platforms
                .where((p) => p.hasData)
                .toList();

            if (platforms.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.history_toggle_off,
                      size: 64,
                      color: Colors.white24,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.noVersions,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.white54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ).animate().fade(duration: 400.ms).scale(begin: const Offset(0.9, 0.9)),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(versionsProvider);
                try {
                  await ref.read(versionsProvider.future);
                } catch (_) {
                  // Error surfaced via provider's AsyncValue → ErrorView.
                }
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: platforms.length + (result.isStale ? 1 : 0),
                itemBuilder: (context, index) {
                  if (result.isStale && result.cachedAt != null) {
                    if (index == 0) {
                      return StaleDataBanner(cachedAt: result.cachedAt!);
                    }
                    index -= 1;
                  }

                  final platform = platforms[index];
                  return VersionPlatformCard(
                    platform: platform.platform,
                    version: platform.version,
                    date: platform.date,
                  ).animate().fade().slideY(
                        begin: 0.1,
                        end: 0,
                        duration: 300.ms,
                        curve: Curves.easeOutQuad,
                      );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  String _errorMessage(Object error) {
    if (error is WeaoException) return error.message;
    return AppStrings.genericError;
  }
}
