import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_flutter/feature/explore/explore_controller.dart';
import 'package:template_flutter/feature/explore/widgets/explore_footer.dart';
import 'package:template_flutter/feature/explore/widgets/explore_header.dart';
import 'package:template_flutter/feature/explore/widgets/explore_item_card.dart';
import 'package:template_flutter/utils/helper/display_format_helper.dart';
import 'package:template_flutter/utils/theme/app_spacing.dart';
import 'package:template_flutter/utils/widgets/primary_appbar.dart';

class ExplorePage extends GetView<ExploreController> {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Explore'),
      body: Obx(() {
        final items = controller.listData;
        final isInitialLoading = controller.isLoading.value && items.isEmpty;
        final isInitialError = controller.hasError.value && items.isEmpty;
        final isEmpty =
            !controller.isLoading.value &&
            !controller.hasError.value &&
            items.isEmpty;
        final hasInitialState =
            isInitialLoading || isInitialError || isEmpty;
        final hasPaginationState =
            controller.isLoadingMore.value || controller.hasMoreError.value;
        final trailingItemCount = hasInitialState
            ? 0
            : (hasPaginationState ? 1 : 0) +
                  (controller.isLastPage.value ? 1 : 0) +
                  1;
        final itemCount =
            1 + (hasInitialState ? 1 : items.length + trailingItemCount);

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification &&
                  notification.metrics.axis == Axis.vertical &&
                  notification.metrics.maxScrollExtent > 0 &&
                  notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent - 280 &&
                  (notification.scrollDelta ?? 0) > 0 &&
                  !controller.hasMoreError.value) {
                unawaited(controller.loadNextPage().catchError((_) {}));
              }
              return false;
            },
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.large,
                      AppSpacing.large,
                      AppSpacing.large,
                      0,
                    ),
                    child: ExploreHeader(),
                  );
                }

                if (hasInitialState) {
                  return _buildInitialState(
                    context,
                    isLoading: isInitialLoading,
                    isError: isInitialError,
                    message: isInitialError
                        ? controller.errorMessage.value
                        : 'Belum ada arsip untuk ditampilkan.',
                  );
                }

                final itemIndex = index - 1;
                if (itemIndex < items.length) {
                  final item = items[itemIndex];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.large,
                      itemIndex == 0 ? AppSpacing.extraLarge : 0,
                      AppSpacing.large,
                      itemIndex == items.length - 1 ? 0 : AppSpacing.large,
                    ),
                    child: ExploreItemCard(
                      key: ValueKey(item.id ?? itemIndex),
                      author: _valueOrFallback(
                        item.author,
                        'Penulis tidak diketahui',
                      ),
                      title: _valueOrFallback(item.title, 'Tanpa judul'),
                      description: _valueOrFallback(
                        item.description,
                        'Deskripsi belum tersedia.',
                      ),
                      imageUrl: item.image ?? '',
                      readingTime: DisplayFormatHelper.readingTime(
                        item.readingTimeMinutes,
                      ),
                      readerCount: DisplayFormatHelper.readerCount(
                        item.readerCount,
                      ),
                    ),
                  );
                }

                var trailingIndex = itemIndex - items.length;
                if (hasPaginationState) {
                  if (trailingIndex == 0) {
                    return controller.isLoadingMore.value
                        ? const Padding(
                            padding: EdgeInsets.all(AppSpacing.large),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : _buildPaginationError(context);
                  }
                  trailingIndex--;
                }

                if (controller.isLastPage.value) {
                  if (trailingIndex == 0) return const ExploreFooter();
                  trailingIndex--;
                }

                return const SizedBox(height: AppSpacing.extraLarge);
              },
            ),
          ),
        );
      }),
    );
  }

  String _valueOrFallback(String? value, String fallback) {
    final text = value?.trim();
    return text == null || text.isEmpty ? fallback : text;
  }

  Widget _buildInitialState(
    BuildContext context, {
    required bool isLoading,
    required bool isError,
    required String message,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.large,
        AppSpacing.extraLarge,
        AppSpacing.large,
        0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            const CircularProgressIndicator()
          else
            Icon(
              isError ? Icons.error_outline : Icons.inbox_outlined,
              size: 48,
              color: isError ? colorScheme.error : colorScheme.onSurfaceVariant,
            ),
          if (!isLoading) ...[
            const SizedBox(height: AppSpacing.medium),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (isError) ...[
            const SizedBox(height: AppSpacing.small),
            TextButton.icon(
              onPressed: controller.fetchData,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba lagi'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPaginationError(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.large),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            controller.moreErrorMessage.value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextButton.icon(
            onPressed: controller.retryNextPage,
            icon: const Icon(Icons.refresh),
            label: const Text('Coba muat lagi'),
          ),
        ],
      ),
    );
  }

  Future<void> _onRefresh() async {
    if (controller.isLoading.value && controller.listData.isEmpty) return;
    await controller.onRefresh();
  }
}
