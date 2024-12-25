import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book_model/volume_info.dart';

class HomedetailsDate extends StatelessWidget {
  const HomedetailsDate({
    super.key,
    required this.volumeInfo,
  });

  final VolumeInfo? volumeInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            volumeInfo?.title ?? "Unknown Title",
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            maxLines: 7,
            volumeInfo?.description ?? "No description available.",
            style: Styles.textStyle16.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber),
              Text(
                "4.8 | ${volumeInfo?.pageCount?.toString() ?? "No Pages"} pages",
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
