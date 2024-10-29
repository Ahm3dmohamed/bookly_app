import 'package:bookly/core/utils/assets_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AssetsImages.logo,
            color: Colors.white,
          ),
          const Text(
            "Read more books",
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
