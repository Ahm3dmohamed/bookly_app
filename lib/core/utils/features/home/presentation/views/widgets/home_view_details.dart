import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/custom_homedetails_appbar.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/core/utils/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_details_data.dart';
import 'see_more_bookview.dart';
import 'similler_book_listview.dart';

class HomeViewDetails extends StatelessWidget {
  final VolumeInfo? volumeInfo;
  final Item items;
  const HomeViewDetails({
    required this.volumeInfo,
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselImageHeight = MediaQuery.of(context).size.height;
    double carouselImageWidth = carouselImageHeight;

    return Scaffold(
      appBar: const HomeDetailsAppbar(),
      body: Column(
        children: [
          // Book thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: carouselImageHeight * .25,
              width: carouselImageWidth * .16,
              imageUrl: volumeInfo?.imageLinks?.thumbnail ??
                  'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
          ),
          HomedetailsDate(volumeInfo: volumeInfo),
          // Price and free preview buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                color: Colors.white,
                margin: EdgeInsets.only(left: SizeConfig.width(6), top: 2),
                text: "Free Book ",
              ),

              // The Best way here to use TextButton.StyleForm Instead of Container

              CustomButton(
                onPressed: () async {
                  Uri uri =
                      Uri.parse(items.volumeInfo?.canonicalVolumeLink ?? "");
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                color: const Color.fromARGB(255, 233, 154, 36),
                margin: EdgeInsets.only(right: SizeConfig.width(6), top: 2),
                text: " Preview",
              ),
            ],
          ),
          const SizedBox(height: 8),
          // "You may also like" title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "    You may also like",
                style: Styles.textStyle16.copyWith(
                  fontFamily: kGtSectraFine,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: searchTransition,
                          child: SeeMoreBooksView(items: items),
                          type: PageTransitionType.bottomToTop));
                },
                child: Text(
                  "See More",
                  style: Styles.textStyle16.copyWith(
                    color: Colors.blue, // Highlight as clickable
                    fontFamily: kGtSectraFine,
                  ),
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
