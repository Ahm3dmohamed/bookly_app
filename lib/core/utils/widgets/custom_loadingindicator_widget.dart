import 'package:flutter/material.dart';

class CustomLoadingindicatorWidget extends StatelessWidget {
  const CustomLoadingindicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
