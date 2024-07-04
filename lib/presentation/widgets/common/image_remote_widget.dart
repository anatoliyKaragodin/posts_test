import 'package:flutter/material.dart';

/// Виджет отображает картинку по url
class ImageRemoteWidget extends StatelessWidget {
  const ImageRemoteWidget({
    super.key,
    required this.imgUrl,
    this.borderRadius = 8.0,
  });

  final String imgUrl;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imgUrl,
        errorBuilder: (context, error, stackTrace) {
          return const SizedBox.shrink();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
