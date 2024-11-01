import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(right: 34, left: 34),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3), // Semi-transparent background
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.book,
                color: Colors.white,
              ),
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite_rounded,
                color: Colors.white,
              ),
              Icon(
                Icons.settings_accessibility_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
