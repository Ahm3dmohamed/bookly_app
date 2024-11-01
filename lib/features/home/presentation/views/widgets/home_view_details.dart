import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/presentation/views/search/widgets/custom_book_lstview.dart';
import 'package:flutter/material.dart';

class HomeViewDetails extends StatelessWidget {
  const HomeViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double carouselImageHeight = MediaQuery.of(context).size.height * 0.37;
    double carouselImageWidth = carouselImageHeight * 0.66;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  )),
            ],
          )),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Image.asset(
              AssetsImages.testImage,
              height: carouselImageHeight,
              width: carouselImageWidth,
              fit: BoxFit.cover,
            ),
          ),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  maxLines: 4,
                  "Harry Botter\n  and the Globalet\n of fire",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "bookfont"),
                ),
              ),
              Text(
                maxLines: 4,
                "Ahmed Hamada",
                style: TextStyle(
                    fontSize: 12, color: Colors.grey, fontFamily: "bookfont"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text("4.8 ${"(2478)"}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "bookfont")),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.all(
                  SizeConfig.width(3),
                ),
                margin: EdgeInsets.only(left: SizeConfig.width(9), top: 8),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24))),
                child: const Text(
                  "     19.99 #  \t\t",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: "bookfont"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  SizeConfig.width(3),
                ),
                margin: EdgeInsets.only(right: SizeConfig.width(14), top: 8),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 233, 154, 36),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24))),
                child: const Text("Free Preview",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
          // Spacer(),

          SizedBox(
            height: SizeConfig.height(1),
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "    You can also like",
                style: Styles.textStyle16,
              ),
            ],
          ),

          CustomBookListview(axis: Axis.vertical),
        ],
      ),
    );
  }
}
