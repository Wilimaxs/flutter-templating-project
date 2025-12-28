import 'package:flutter/material.dart';

class StateHandle extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isEmpty;
  final bool isError;
  final String? emptyText;
  final Widget? emptyIcon;
  final String? errorText;
  final Widget? errorIcon;
  final Future<void> Function()? onRefresh;

  //opsional for shimmer or custom loading widget
  final Widget? loadingWidget;

  const StateHandle({
    super.key,
    required this.child,
    this.onRefresh,
    this.isLoading = false,
    this.isEmpty = false,
    this.isError = false,
    this.emptyText,
    this.emptyIcon,
    this.errorText,
    this.errorIcon,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (loadingWidget != null && isLoading) {
      return loadingWidget!;
    }

    return Stack(
      children: [
        _buildMainContent(),
        if (isLoading && loadingWidget == null) ...[
          const ModalBarrier(dismissible: false, color: Colors.transparent),
          Container(
            color: Colors.black.withAlpha(25),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      ],
    );
  }

  Widget _buildMainContent() {
    Widget content;

    if (isError) {
      content = _buildStateInfo(
        icon:
            errorIcon ??
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
        message: errorText ?? "Terjadi kesalahan sistem",
      );
    } else if (isEmpty) {
      content = _buildStateInfo(
        icon:
            emptyIcon ??
            const Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
        message: emptyText ?? "Data tidak ditemukan",
      );
    } else {
      content = child;
    }

    if (onRefresh == null) return content;

    return RefreshIndicator(
      onRefresh: onRefresh!,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [SliverFillRemaining(hasScrollBody: true, child: content)],
      ),
    );
  }

  Widget _buildStateInfo({required Widget icon, required String message}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
