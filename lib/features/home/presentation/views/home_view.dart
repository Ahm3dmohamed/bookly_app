import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/features/home/presentation/views/custom_bottomnavigation.dart';
import 'package:bookly/features/home/presentation/views/search/widgets/custom_book_lstview.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:overlapped_carousel/overlapped_carousel.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    double carouselImageHeight = MediaQuery.of(context).size.height * 0.33;
    double carouselImageWidth = carouselImageHeight * 0.66; // 2:3 aspect ratio

    List<Widget> booklylist = List.generate(
      15,
      (index) => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: Image.asset(
          AssetsImages.testImage,
          height: carouselImageHeight,
          width: carouselImageWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
    // ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigation(),
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.width(3)),
          child: Column(
            children: [
              const CustomAppbar(),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenHeight * .01,
                  right: SizeConfig.screenHeight * .01,
                  top: SizeConfig.screenHeight * .03,
                ),
                child: SizedBox(
                  height: carouselImageHeight + 20,
                  child: OverlappedCarousel(
                    widgets: booklylist,
                    obscure: 0.1,
                    skewAngle: 0.3,
                    onClicked: (ValueKey) {},
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: SizeConfig.height(2)),
                      child: const Text(
                        "Best Seller",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "bookfont",
                        ),
                      ),
                    ),
                    CustomBookListview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
