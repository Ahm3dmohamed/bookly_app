import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/shopping_cart_data_.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomeDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
      actions: [
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
    );
  }

  // Implement the preferredSize property
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
