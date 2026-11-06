import 'package:flutter/material.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';
import 'package:template_flutter/utils/widgets/app_badge.dart';
import 'package:template_flutter/utils/widgets/image_load.dart';

class ExploreItemCard extends StatelessWidget {
  const ExploreItemCard({
    super.key,
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.readingTime,
    required this.readerCount,
    this.onTap,
  });

  final String author;
  final String title;
  final String description;
  final String imageUrl;
  final String readingTime;
  final String readerCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: EdgeInsets.zero,
      color: colorScheme.surface,
      elevation: 2,
      shadowColor: colorScheme.shadow,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.large,
            vertical: AppSpacing.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.medium),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.small),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.medium),
                  ImageLoad(
                    src: imageUrl,
                    width: 80,
                    height: 80,
                    borderRadius: BorderRadius.circular(10),
                    semanticLabel: title,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.large),
              Divider(
                color: colorScheme.outlineVariant.withValues(alpha: 0.3),
                thickness: 1,
              ),
              const SizedBox(height: AppSpacing.medium),
              Row(
                children: [
                  AppBadge(
                    text: readingTime,
                    textStyle: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    icon: const Icon(Icons.schedule),
                    iconTint: colorScheme.primary,
                    iconSize: 14,
                    iconSpacing: AppSpacing.extraSmall,
                    containerColor: colorScheme.surfaceContainerLow,
                    containerBorderColor: colorScheme.outlineVariant.withValues(
                      alpha: 0.3,
                    ),
                    containerBorderSize: 1,
                    borderRadius: BorderRadius.circular(100),
                    contentDescription: 'Waktu baca: $readingTime',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.medium,
                      vertical: AppSpacing.small,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.small),
                  AppBadge(
                    text: readerCount,
                    textStyle: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    icon: const Icon(Icons.visibility_outlined),
                    iconTint: colorScheme.secondary,
                    iconSize: 14,
                    iconSpacing: AppSpacing.extraSmall,
                    containerColor: colorScheme.surfaceContainerLow,
                    containerBorderColor: colorScheme.outlineVariant.withValues(
                      alpha: 0.3,
                    ),
                    containerBorderSize: 1,
                    borderRadius: BorderRadius.circular(100),
                    contentDescription: 'Jumlah pembaca: $readerCount',
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.medium,
                      vertical: AppSpacing.small,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
