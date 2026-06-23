import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExploitShimmerList extends StatelessWidget {
  const ExploitShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Shimmer.fromColors(
            baseColor:
                Theme.of(context).cardTheme.color ?? const Color(0xFF1A1A26),
            highlightColor: Colors.grey.withValues(alpha: 0.1),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        );
      },
    );
  }
}
