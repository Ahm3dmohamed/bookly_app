import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/core/utils/features/home/presentation/views/home_view.dart';
import 'package:bookly/core/utils/features/home/presentation/views/splash/sliding_text.dart';

import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  bool animate = false;
  Future fadeInAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      animate = true;
    });

    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    fadeInAnimation();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: animate ? 1 : 0,
            child: Image.asset(
              AssetsImages.logo,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }
}
//  Route createRouter() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) => HomeView(),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const curve = Curves.fastEaseInToSlowEaseOut;
//         final curveAnimation = CurvedAnimation(parent: animation, curve: curve);
//         return ScaleTransition(
//           scale: curveAnimation,
//           child: child,
//         );
//       },
//     );
//   }