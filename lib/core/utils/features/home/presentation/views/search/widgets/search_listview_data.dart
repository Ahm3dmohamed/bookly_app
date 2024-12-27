import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_view_details.dart';

class SearchListviewData extends StatelessWidget {
  final Item items;
  const SearchListviewData({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: [items].length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeViewDetails(
                    volumeInfo: items.volumeInfo,
                    items: items,
                  ),
                ),
              );
            },
            child: CustomBookImage(
              book: items,
              imageUrl: items.volumeInfo?.imageLinks?.thumbnail ?? "",
            ),
          ),
        );
      },
    );
  }
}
