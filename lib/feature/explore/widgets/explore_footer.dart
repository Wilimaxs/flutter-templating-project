import 'package:flutter/material.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';

class ExploreFooter extends StatelessWidget {
  const ExploreFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.extraLarge,
        AppSpacing.extraLarge,
        AppSpacing.extraLarge,
        AppSpacing.small,
      ),
      child: Column(
        children: [
          Container(
            width: AppSpacing.extraExtraExtraLarge,
            height: 2,
            decoration: BoxDecoration(
              color: colorScheme.outlineVariant.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            'Arsip dikurasi oleh Konsorsium Peneliti Folklor',
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: AppSpacing.extraSmall),
          Text(
            'MYTHOS ARCHIVES • JILID VII',
            textAlign: TextAlign.center,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
