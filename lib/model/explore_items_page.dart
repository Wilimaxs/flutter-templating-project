import 'explore_item.dart';

class ExploreItemsPage {
  const ExploreItemsPage({this.items, this.pagination});

  final List<ExploreItem>? items;
  final ExplorePagination? pagination;

  factory ExploreItemsPage.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    final items = rawItems is List
        ? rawItems
              .whereType<Map<String, dynamic>>()
              .map(ExploreItem.fromJson)
              .toList(growable: false)
        : null;

    final rawPagination = json['pagination'];
    return ExploreItemsPage(
      items: items,
      pagination: rawPagination is Map<String, dynamic>
          ? ExplorePagination.fromJson(rawPagination)
          : null,
    );
  }
}

class ExplorePagination {
  const ExplorePagination({
    this.total,
    this.perPage,
    this.currentPage,
    this.lastPage,
  });

  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  factory ExplorePagination.fromJson(Map<String, dynamic> json) {
    return ExplorePagination(
      total: _readInt(json['total']),
      perPage: _readInt(json['per_page']),
      currentPage: _readInt(json['current_page']),
      lastPage: _readInt(json['last_page']),
    );
  }

  static int? _readInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '');
  }
}
