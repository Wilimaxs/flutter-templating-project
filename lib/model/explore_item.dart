class ExploreItem {
  const ExploreItem({
    this.id,
    this.author,
    this.title,
    this.description,
    this.image,
    this.readingTimeMinutes,
    this.readerCount,
  });

  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? image;
  final int? readingTimeMinutes;
  final int? readerCount;

  factory ExploreItem.fromJson(Map<String, dynamic> json) {
    return ExploreItem(
      id: _readInt(json['id']),
      author: json['author']?.toString(),
      title: json['title']?.toString(),
      description: json['description']?.toString(),
      image: json['image']?.toString(),
      readingTimeMinutes: _readInt(json['reading_time_minutes']),
      readerCount: _readInt(json['reader_count']),
    );
  }

  static int? _readInt(Object? value) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    return int.tryParse(value?.toString() ?? '');
  }
}
