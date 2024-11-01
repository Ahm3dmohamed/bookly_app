import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_details.dart';
import 'package:flutter/material.dart';

class CustomBookListview extends StatelessWidget {
  CustomBookListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeViewDetails(),
                ),
              );
            },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        height: SizeConfig.height(20),
                        width: SizeConfig.width(30),
                        AssetsImages.bookImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.width(40),
                      child: const Text(
                        "Harry Botter  and the Globalet of fire",
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "bookfont"),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.width(40),
                      child: const Text(
                        "Ahmed Hamada",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontFamily: "bookfont"),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "19.99 P",
                          maxLines: 4,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "bookfont"),
                        ),
                        SizedBox(
                          width: SizeConfig.width(14),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 22,
                        ),
                        const Text("4.8 ${"(2478)"}",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: "bookfont")),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 8,
          );
        },
      ),
    );
  }
}
