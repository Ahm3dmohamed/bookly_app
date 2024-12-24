import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/custom_homedetails_appbar.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/core/utils/widgets/custom_rounded_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
          const SizedBox(height: 8),
          HomedetailsDate(volumeInfo: volumeInfo),
          const SizedBox(height: 10),
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
                onTap: () {},
              ),

              // The Best way here to use TextButton.StyleForm Instead of Container

              InkWell(
                onTap: () async {
                  Uri uri = Uri.parse(items.accessInfo?.pdf.toString() ?? "");
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                child: CustomRounderContainer(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  color: const Color.fromARGB(255, 233, 154, 36),
                  edgeInsetsGeometry:
                      EdgeInsets.only(right: SizeConfig.width(14), top: 8),
                  txt: volumeInfo?.contentVersion ?? "No Preview",
                  onTap: () async {
                    Uri uri = Uri.parse(items?.selfLink ?? "");
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                    MaterialPageRoute(
                      builder: (context) => const SeeMoreBooksView(),
                    ),
                  );
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
