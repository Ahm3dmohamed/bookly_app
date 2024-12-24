import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/bestseller_book_lstview.dart';
import 'package:flutter/material.dart';

class CustomBestSellerWidget extends StatelessWidget {
  const CustomBestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
          BestSellerBookListview(),
        ],
      ),
    );
  }
}
