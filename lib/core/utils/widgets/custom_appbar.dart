import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/features/home/presentation/views/search/search.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../features/home/presentation/views/widgets/shopping_cart_data_.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AssetsImages.logo,
          scale: 2,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: searchTransition,
                    type: PageTransitionType.bottomToTop,
                    child: const Search(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 36,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    duration: searchTransition,
                    child: const ShoppingCartScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
