import 'package:get/get.dart';

import 'base_controller.dart';

abstract class PaginationController<T> extends BaseController<T> {
  final listData = <T>[].obs;

  final page = 1.obs;
  final isLastPage = false.obs;
  final isLoadingMore = false.obs;

  Future<void>? _activeLoadMore;

  @override
  Future<void> onRefresh() async {
    if (isRefreshing.value) return;

    isRefreshing.value = true;
    try {
      final activeLoadMore = _activeLoadMore;
      if (activeLoadMore != null) {
        try {
          await activeLoadMore;
        } catch (_) {
          // Continue refreshing even if the previous page request failed.
        }
      }

      page.value = 1;
      isLastPage.value = false;
      listData.clear();
      await fetchData();
    } finally {
      isRefreshing.value = false;
    }
  }

  Future<void> loadNextPage() async {
    if (isLastPage.value ||
        isLoading.value ||
        isLoadingMore.value ||
        isRefreshing.value) {
      return;
    }

    final previousPage = page.value;
    final nextPage = previousPage + 1;
    page.value = nextPage;
    isLoadingMore.value = true;

    late final Future<void> request;
    request = () async {
      try {
        await fetchData();
      } catch (_) {
        page.value = previousPage;
        rethrow;
      } finally {
        if (identical(_activeLoadMore, request)) {
          _activeLoadMore = null;
        }
        isLoadingMore.value = false;
      }
    }();
    _activeLoadMore = request;
    await request;
  }

  @override
  void onClose() {
    listData.clear();
    super.onClose();
  }
}
