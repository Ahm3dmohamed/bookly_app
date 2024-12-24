import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

class HomeDetailsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
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
          onPressed: () {},
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
