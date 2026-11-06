class DisplayFormatHelper {
  DisplayFormatHelper._();

  static String readingTime(int? minutes) {
    if (minutes == null) return '— mnt baca';
    return '$minutes mnt baca';
  }

  static String readerCount(int? count) {
    if (count == null) return '— pembaca';
    return '${_compactNumber(count)} pembaca';
  }

  static String _compactNumber(int value) {
    if (value.abs() >= 1000000) {
      return '${_trimDecimal(value / 1000000)}M';
    }
    if (value.abs() >= 1000) {
      return '${_trimDecimal(value / 1000)}k';
    }
    return value.toString();
  }

  static String _trimDecimal(double value) {
    return value.toStringAsFixed(1).replaceFirst(RegExp(r'\.0$'), '');
  }
}
