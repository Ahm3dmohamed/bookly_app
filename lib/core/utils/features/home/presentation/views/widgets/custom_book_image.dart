import 'package:bookly/core/config/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String? imageUrl;

  const CustomBookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.9 / 4,
        child: CachedNetworkImage(
          height: SizeConfig.height(20),
          width: SizeConfig.width(12),
          imageUrl: imageUrl ?? 'https://via.placeholder.com/150',
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
