import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageLoad extends StatelessWidget {
  const ImageLoad({
    super.key,
    this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.color,
    this.placeholderWidget,
    this.loadingWidget,
    this.errorWidget,
    this.semanticLabel,
  });

  final String? src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Widget? placeholderWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final source = src?.trim();
    final Widget image;

    if (source == null || source.isEmpty) {
      image = _customOrFallback(
        context,
        placeholderWidget,
        isError: false,
      );
    } else if (_isNetworkSource(source)) {
      image = Image.network(
        source,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
        semanticLabel: semanticLabel,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return _customOrFallback(
            context,
            loadingWidget,
            isLoading: true,
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            _customOrFallback(context, errorWidget, isError: true),
      );
    } else if (_isSvg(source)) {
      image = SvgPicture.asset(
        source,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color!, BlendMode.srcIn),
        semanticsLabel: semanticLabel,
        placeholderBuilder: (context) => _customOrFallback(
          context,
          loadingWidget,
          isLoading: true,
        ),
      );
    } else {
      image = Image.asset(
        source,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
        semanticLabel: semanticLabel,
        errorBuilder: (context, error, stackTrace) =>
            _customOrFallback(context, errorWidget, isError: true),
      );
    }

    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }

  bool _isNetworkSource(String source) {
    final scheme = Uri.tryParse(source)?.scheme.toLowerCase();
    return scheme == 'http' || scheme == 'https';
  }

  bool _isSvg(String source) {
    final path = source.split('?').first.toLowerCase();
    return path.endsWith('.svg');
  }

  Widget _customOrFallback(
    BuildContext context,
    Widget? customWidget, {
    bool isLoading = false,
    bool isError = false,
  }) {
    if (customWidget == null) {
      return _buildFallback(
        context,
        isLoading: isLoading,
        isError: isError,
      );
    }

    return SizedBox(width: width, height: height, child: customWidget);
  }

  Widget _buildFallback(
    BuildContext context, {
    bool isLoading = false,
    bool isError = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: ColoredBox(
        color: colorScheme.surfaceContainerLow,
        child: Center(
          child: isLoading
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Icon(
                  isError
                      ? Icons.broken_image_outlined
                      : Icons.image_outlined,
                  color: colorScheme.onSurfaceVariant,
                  size: 24,
                ),
        ),
      ),
    );
  }
}
