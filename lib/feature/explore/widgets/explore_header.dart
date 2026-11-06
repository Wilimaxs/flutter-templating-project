import 'package:flutter/material.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: AppSpacing.extraSmall,
              height: AppSpacing.extraSmall,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: Text(
                'ARSIP LAPANGAN & MONOGRAF',
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          'Catatan Penyelidikan Terkini',
          style: textTheme.headlineLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          'Dokumentasi investigasi lapangan, anotasi manuskrip, dan wawancara lisan yang dihimpun para kurator folklor Nusantara.',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
