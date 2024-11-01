import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_details.dart';
import 'package:flutter/material.dart';

class CustomBookListview extends StatelessWidget {
  Axis axis;
  CustomBookListview({
    required this.axis,
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
                  builder: (context) => HomeViewDetails(),
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
                        height: SizeConfig.height(25),
                        width: SizeConfig.width(40),
                        AssetsImages.bookImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Harry Botter\n  and the Globalet\n of fire",
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "bookfont"),
                      ),
                    ),
                    Text(
                      "Ahmed Hamada",
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "bookfont"),
                    ),
                    Row(
                      children: [
                        Text(
                          "19.99 P",
                          maxLines: 4,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "bookfont"),
                        ),
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
