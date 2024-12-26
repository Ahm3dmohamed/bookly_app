import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatefulWidget {
  final String? imageUrl;

  const CustomBookImage({super.key, required this.imageUrl});

  @override
  State<CustomBookImage> createState() => _CustomBookImageState();
}

class _CustomBookImageState extends State<CustomBookImage> {
  bool isFavorite = false; // Tracks the favorite state

  @override
  Widget build(BuildContext context) {
    final item = Item();

    return Stack(
      children: [
        // Book Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 2.9 / 4,
            child: CachedNetworkImage(
              height: SizeConfig.height(20),
              width: SizeConfig.width(12),
              imageUrl: widget.imageUrl ?? 'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),

        // Favorite Icon
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite; // Toggle favorite state
              });

              var snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.all(SizeConfig.screenHeight * .04),
                content: AwesomeSnackbarContent(
                  title: isFavorite ? 'Success' : 'Done',
                  message:
                      isFavorite ? 'Book Added to Favorites!' : 'Book Removed!',
                  contentType:
                      isFavorite ? ContentType.success : ContentType.failure,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            },
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: Icon(
                isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border, // Toggle icon
                color: isFavorite ? Colors.red : Colors.white, // Change color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
