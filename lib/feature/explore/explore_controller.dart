import 'package:get/get.dart';
import 'package:template_flutter/data/base/pagination_controller.dart';
import 'package:template_flutter/data/remote/errorMapper/error_handler.dart';
import 'package:template_flutter/data/remote/errorMapper/network_exception.dart';
import 'package:template_flutter/data/remote/extention_api_service.dart';
import 'package:template_flutter/model/explore_item.dart';

class ExploreController extends PaginationController<ExploreItem> {
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final hasMoreError = false.obs;
  final moreErrorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  Future<void> fetchData() async {
    final requestedPage = page.value;
    final isFirstPage = requestedPage == 1;

    if (isFirstPage && listData.isEmpty && !isRefreshing.value) {
      setLoading(true);
    }
    if (isFirstPage) {
      hasError.value = false;
      errorMessage.value = '';
      hasMoreError.value = false;
      moreErrorMessage.value = '';
    }

    try {
      final result = await apiService
          .getExploreItems(
            page: requestedPage,
            cancelToken: requestCancelToken,
          )
          .validateResponse;

      final receivedItems = result.items ?? <ExploreItem>[];
      if (isFirstPage) {
        listData.assignAll(receivedItems);
      } else {
        listData.addAll(receivedItems);
      }

      final pagination = result.pagination;
      final currentPage = pagination?.currentPage ?? requestedPage;
      final lastPage = pagination?.lastPage;
      page.value = currentPage;
      isLastPage.value = lastPage != null
          ? currentPage >= lastPage
          : receivedItems.length < (pagination?.perPage ?? 20);
      hasMoreError.value = false;
      moreErrorMessage.value = '';
    } catch (error) {
      final exception = ErrorHandler.toNetworkException(error);
      if (exception is RequestCancelled) return;

      if (!isFirstPage) {
        hasMoreError.value = true;
        moreErrorMessage.value = exception.message;
        rethrow;
      }

      if (listData.isEmpty) {
        hasError.value = true;
        errorMessage.value = exception.message;
      } else {
        handleNetworkError(exception);
      }
    } finally {
      if (isFirstPage) setLoading(false);
    }
  }

  Future<void> retryNextPage() async {
    hasMoreError.value = false;
    moreErrorMessage.value = '';
    try {
      await loadNextPage();
    } catch (_) {
      // Error state is exposed through hasMoreError and moreErrorMessage.
    }
  }
}
