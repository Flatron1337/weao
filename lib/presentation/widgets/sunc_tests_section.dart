import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/errors/weao_exception.dart';
import '../../core/l10n/app_strings.dart';
import '../../data/models/sunc_data.dart';
import '../providers/sunc_provider.dart';
import 'error_view.dart';
import 'loading_view.dart';
import 'stale_data_banner.dart';

enum SuncTestFilter { all, passed, failed }

class SuncTestsSection extends ConsumerStatefulWidget {
  const SuncTestsSection({
    super.key,
    required this.scrap,
    required this.keyValue,
  });

  final String? scrap;
  final String? keyValue;

  @override
  ConsumerState<SuncTestsSection> createState() => _SuncTestsSectionState();
}

class _SuncTestsSectionState extends ConsumerState<SuncTestsSection> {
  SuncTestFilter _filter = SuncTestFilter.all;

  @override
  Widget build(BuildContext context) {
    final scrap = widget.scrap;
    final key = widget.keyValue;

    if (scrap == null || key == null || scrap.isEmpty || key.isEmpty) {
      return _UnavailableSection();
    }

    final request = SuncRequest(scrap: scrap, key: key);
    final suncAsync = ref.watch(suncDataProvider(request));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.suncTests,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 12),
            suncAsync.when(
              loading: () => const LoadingView(),
              error: (error, _) => ErrorView(
                message: _errorMessage(error),
                onRetry: () => ref.invalidate(suncDataProvider(request)),
              ),
              data: (result) {
                if (result == null) return _UnavailableSection(compact: true);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (result.isStale && result.cachedAt != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: StaleDataBanner(cachedAt: result.cachedAt!),
                      ),
                    _SummaryRow(data: result.data),
                    const SizedBox(height: 12),
                    SegmentedButton<SuncTestFilter>(
                      segments: const [
                        ButtonSegment(
                          value: SuncTestFilter.all,
                          label: Text(AppStrings.suncAll),
                        ),
                        ButtonSegment(
                          value: SuncTestFilter.passed,
                          label: Text(AppStrings.suncPassed),
                        ),
                        ButtonSegment(
                          value: SuncTestFilter.failed,
                          label: Text(AppStrings.suncFailed),
                        ),
                      ],
                      selected: {_filter},
                      onSelectionChanged: (value) {
                        setState(() => _filter = value.first);
                      },
                    ),
                    const SizedBox(height: 12),
                    _TestsList(
                      data: result.data,
                      filter: _filter,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _errorMessage(Object error) {
    if (error is WeaoException) return error.message;
    return AppStrings.genericError;
  }
}

class _UnavailableSection extends StatelessWidget {
  const _UnavailableSection({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Text(
        AppStrings.suncUnavailable,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
            ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.suncTests,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              AppStrings.suncUnavailable,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white54,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.data});

  final SuncData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.suncPassed}: ${data.passed.length} · '
          '${AppStrings.suncFailed}: ${data.failed.length}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          '${AppStrings.version}: ${data.version}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white54,
              ),
        ),
        Text(
          '${AppStrings.suncTimeTaken}: ${data.timeTaken.toStringAsFixed(1)} сек.',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white54,
              ),
        ),
        if (data.outdated)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              AppStrings.suncOutdated,
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange.shade300,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

class _TestsList extends StatelessWidget {
  const _TestsList({required this.data, required this.filter});

  final SuncData data;
  final SuncTestFilter filter;

  List<SuncTest> get _filteredTests {
    switch (filter) {
      case SuncTestFilter.all:
        return data.allTests;
      case SuncTestFilter.passed:
        return data.passed;
      case SuncTestFilter.failed:
        return data.failed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tests = _filteredTests;
    if (tests.isEmpty) {
      return Text(
        AppStrings.noResults,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white54,
            ),
      );
    }

    final grouped = <String, List<SuncTest>>{};
    for (final test in tests) {
      grouped.putIfAbsent(test.library, () => []).add(test);
    }

    final libraries = grouped.keys.toList()..sort();

    return Column(
      children: [
        for (final library in libraries)
          ExpansionTile(
            title: Text(library),
            subtitle: Text('${grouped[library]!.length}'),
            children: [
              for (final test in grouped[library]!)
                ListTile(
                  dense: true,
                  leading: Icon(
                    test.isPassed ? Icons.check_circle : Icons.cancel,
                    color: test.isPassed ? Colors.green : Colors.red,
                    size: 18,
                  ),
                  title: Text(test.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (test.description.isNotEmpty) Text(test.description),
                      if (test.reason != null && test.reason!.isNotEmpty)
                        Text(
                          '${AppStrings.suncReason}: ${test.reason}',
                          style: TextStyle(color: Colors.red.shade200),
                        ),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
