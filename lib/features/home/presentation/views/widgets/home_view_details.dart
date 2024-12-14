import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/assets_images.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:bookly/features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/features/home/presentation/manager/similler_book_cubit/similler_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_homedetails_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../../../core/utils/widgets/custom_loadingindicator_widget.dart';
import '../../../../../core/utils/widgets/custom_rounded_container.dart';
import 'book_listview_items.dart';
import 'similler_book_listview.dart';

class HomeViewDetails extends StatelessWidget {
  final VolumeInfo? volumeInfo;
  final List<Item>? similarBooks;

  const HomeViewDetails({
    required this.volumeInfo,
    required this.similarBooks,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselImageHeight = MediaQuery.of(context).size.height * 0.30;
    double carouselImageWidth = carouselImageHeight * 0.66;

    return Scaffold(
      appBar: const HomeDetailsAppbar(),
      body: Column(
        children: [
          // Book thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: carouselImageHeight,
              width: carouselImageWidth,
              imageUrl: volumeInfo?.imageLinks?.thumbnail ??
                  'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
          ),
          const SizedBox(height: 12),
          // Book title, description, and rating
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  volumeInfo?.title ?? "Unknown Title",
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  maxLines: 6,
                  volumeInfo?.description ?? "No description available.",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontFamily: "bookfont",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    Text(
                      "4.8 | ${volumeInfo?.pageCount?.toString() ?? "No Pages"} pages",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontFamily: "bookfont",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Price and free preview buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRounderContainer(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                color: Colors.white,
                edgeInsetsGeometry:
                    EdgeInsets.only(left: SizeConfig.width(9), top: 8),
                txt: "Free Book ",
              ),
              CustomRounderContainer(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: const Color.fromARGB(255, 233, 154, 36),
                edgeInsetsGeometry:
                    EdgeInsets.only(right: SizeConfig.width(14), top: 8),
                txt: volumeInfo?.contentVersion ?? "No Preview",
              ),
              // Container(
              //   padding: EdgeInsets.all(SizeConfig.width(3)),
              //   margin: EdgeInsets.only(left: SizeConfig.width(9), top: 8),
              //   decoration: const BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(24),
              //       bottomLeft: Radius.circular(24),
              //     ),
              //   ),
              //   child: const Text(
              //     "     \$19.99     ",
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.black,
              //       fontFamily: "bookfont",
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(SizeConfig.width(3)),
              //   margin: EdgeInsets.only(right: SizeConfig.width(14), top: 8),
              //   decoration: const BoxDecoration(
              //     color: Color.fromARGB(255, 233, 154, 36),
              //     borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(24),
              //       bottomRight: Radius.circular(24),
              //     ),
              //   ),
              //   child: const Text(
              //     "Free Preview",
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 16),
          // "You may also like" title
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "    You may also like",
                style: Styles.textStyle16.copyWith(
                  fontFamily: kGtSectraFine,
                ),
              ),
            ],
          ),
          // Similar books list
          const Expanded(
            child: SimillerBookListview(),
          ),
        ],
      ),
    );
  }
}
