import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/features/home/presentation/views/search/search.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                duration: searchTransition,
                type: PageTransitionType.bottomToTop,
                child: Search(),
              ),
            );
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 36,
          ),
        ),
      ],
    );
  }
}
