import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class TmdbImage extends StatelessWidget {
  final String? path;
  final String size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final IconData? errorIcon;
  final bool withLoading;

  const TmdbImage(
    this.path, {
    super.key,
    this.size = 'w500',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.errorIcon,
    this.withLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    if (path == null || path!.isEmpty) {
      return Container(
        width: width,
        height: height,
        color: Color(0xFFEEEEEE),
        child: Icon(
          errorIcon ?? PhosphorIconsFill.imageBroken,
          color: Color(0xFF71747D),
        ),
      );
    }

    final imageUrl = 'https://image.tmdb.org/t/p/$size$path';

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        color: Colors.grey.shade200,
        child: withLoading
            ? Center(child: CircularProgressIndicator.adaptive())
            : null,
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey.shade300,
        child: Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}
