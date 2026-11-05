import 'package:flutter/material.dart';
import 'package:template_flutter/gen/assets.gen.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';
import 'package:template_flutter/utils/widgets/app_badge.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colorScheme.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Assets.icons.icBook.svg(
                  width: 28,
                  height: 28,
                  colorFilter: ColorFilter.mode(
                    colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: Text(
                    'MYTHOS DIRECTORY',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.extraSmall),
                AppBadge(
                  text: 'Arsip Terbuka',
                  textStyle: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  icon: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  iconSpacing: AppSpacing.extraSmall,
                  containerColor: colorScheme.surfaceContainerHigh,
                  containerBorderColor: colorScheme.surfaceContainerHigh,
                  containerBorderSize: 0,
                  borderRadius: BorderRadius.circular(100),
                  contentDescription: 'Status arsip terbuka',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.small,
                    vertical: AppSpacing.extraSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.large),
            Text(
              'CHRONICLING THE UNSEEN',
              style: textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: AppSpacing.extraSmall),
            Text(
              'Masuki Dunia Mitos & Cerita Rakyat',
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
                fontSize: 24,
                fontWeight: FontWeight.w400,
                height: 1.15,
              ),
            ),
            const SizedBox(height: AppSpacing.small),
            Text(
              'Jelajahi ribuan dokumentasi legenda urban Nusantara, kisah tuturan lisan, dan misteri yang telah terkurasi dengan ketelitian akademis.',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
