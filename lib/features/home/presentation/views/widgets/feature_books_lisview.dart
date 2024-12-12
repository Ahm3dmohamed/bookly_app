import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_%20cubit/features_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_%20cubit/features_book_state.dart';

class FeatureBookSListView extends StatelessWidget {
  const FeatureBookSListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    double carouselImageHeight = MediaQuery.of(context).size.height * 0.25;
    double carouselImageWidth = carouselImageHeight * 0.66;

    return BlocBuilder<FeaturesBooksCubit, FeaturesBookState>(
      builder: (BuildContext context, FeaturesBookState state) {
        if (state is FeaturesBookFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else if (state is FeaturesBookSuccess) {
          // Access items from the single BookModel
          final items = state.books.items ?? [];

          if (items.isEmpty) {
            return const Center(
              child: Text(
                "No books available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return SizedBox(
            height: carouselImageHeight + 50, // Add extra space for the text
            child: ListView.separated(
              scrollDirection: Axis.horizontal, // Set horizontal scrolling
              padding: EdgeInsets.only(
                left: SizeConfig.screenHeight * .001,
                right: SizeConfig.screenHeight * .01,
                top: SizeConfig.screenHeight * .01,
              ),
              itemCount: items.length,
              separatorBuilder: (context, index) => SizedBox(
                width: SizeConfig.screenHeight * .02,
              ), // Horizontal spacing
              itemBuilder: (context, index) {
                final book = items[index].volumeInfo;
                final imageUrl = book?.imageLinks?.thumbnail;
                final title = book?.title ?? "Untitled";
                final authors = book?.authors?.join(", ") ?? "Unknown Author";

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeViewDetails(),
                        ));
                  },
                  child: SizedBox(
                    width: carouselImageWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl!,
                            height: carouselImageHeight,
                            width: carouselImageWidth,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const CustomLoadingindicatorWidget();
        }
      },
    );
  }
}
