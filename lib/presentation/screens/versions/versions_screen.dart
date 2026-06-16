import 'package:flutter/material.dart';
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
              ref.read(versionChannelProvider.notifier).state =
                  VersionChannel.values[index];
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
            final platforms =
                result.data.platforms.where((p) => p.hasData).toList();

            if (platforms.isEmpty) {
              return const Center(
                child: Text(
                  AppStrings.noVersions,
                  style: TextStyle(color: Colors.white54),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(versionsProvider);
                await ref.read(versionsProvider.future);
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
