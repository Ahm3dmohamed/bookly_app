import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cart_cubit/cart_cubit.dart';

class CustomBookImage extends StatefulWidget {
  final String? imageUrl;
  final Item book;

  const CustomBookImage(
      {super.key, required this.imageUrl, required this.book});

  @override
  State<CustomBookImage> createState() => _CustomBookImageState();
}

class _CustomBookImageState extends State<CustomBookImage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = context.read<CartCubit>().state.contains(widget.book);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, List<Item>>(
      listener: (context, cartItems) {
        setState(() {
          isFavorite = cartItems.contains(widget.book);
        });
      },
      child: Stack(
        children: [
          // Book Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: CachedNetworkImage(
                height: SizeConfig.height(24),
                width: SizeConfig.width(15),
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
                if (isFavorite) {
                  context.read<CartCubit>().removeBookFromCart(widget.book);
                } else {
                  context.read<CartCubit>().addBookToCart(widget.book);
                }

                var snackBar = SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  padding: EdgeInsets.all(SizeConfig.screenHeight * .04),
                  content: AwesomeSnackbarContent(
                    title: isFavorite ? 'Removed' : 'Added',
                    message: isFavorite
                        ? 'Book Removed from Favorites!'
                        : 'Book Added to Favorites!',
                    contentType:
                        isFavorite ? ContentType.failure : ContentType.success,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
