import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_details.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';
import '../../../data/models/book_model/volume_info.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BestsellerListviewItems extends StatelessWidget {
  final VolumeInfo? book;
  final Item items;

  const BestsellerListviewItems(
      {super.key, required this.book, required this.items});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeViewDetails(
              volumeInfo: book,
              similarBooks: [items],
            ),
          ),
        );
      },
      child: SizedBox(
        height: SizeConfig.height(20),
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: book?.imageLinks?.thumbnail ??
                  'https://via.placeholder.com/150',
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book?.title ?? "Untitled",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle24),
                    const SizedBox(height: 5),
                    Text(book?.authors?.join(", ") ?? "Unknown Author",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle16.copyWith(color: Colors.grey)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text("Free ", style: Styles.textStyle20),
                        Spacer(),
                        BookRating(
                          count: book?.pageCount?.toString() ?? "N/A",
                          rate: "4,8",
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(book?.publishedDate ?? "2004",
                            style: Styles.textStyle20
                                .copyWith(color: Colors.grey)),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
