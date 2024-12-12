import 'package:bookly/core/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_view_details.dart';

class BestSellerBookListview extends StatelessWidget {
  const BestSellerBookListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double carouselImageHeight = MediaQuery.of(context).size.height * 0.25;
    double carouselImageWidth = carouselImageHeight * 0.66;

    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (BuildContext context, NewestBookState state) {
        if (state is NewestBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is NewestBookSuccess) {
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
            height: carouselImageHeight + 175, // Constrain ListView height
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(3)),
              itemCount: items.length,
              separatorBuilder: (context, index) => SizedBox(
                height: SizeConfig.height(2), // Vertical spacing
              ),
              itemBuilder: (context, index) {
                final book = items[index].volumeInfo;
                final imageUrl = book?.imageLinks?.thumbnail;
                final title = book?.title ?? "Untitled";
                final rate = book?.maturityRating ?? "Not Rated";
                final readingModes = book?.readingModes ?? "Not Rated";
                final puplisher = book?.publisher ?? "Not Rated";
                final date = book?.publishedDate ?? "Unknown Date";
                final pageCount = book?.pageCount?.toString() ?? "N/A";
                final authors = book?.authors?.join(", ") ?? "Unknown Author";

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
                      // Book Thumbnail
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: imageUrl != null
                            ? Image.network(
                                imageUrl,
                                height: carouselImageHeight,
                                width: carouselImageWidth,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.broken_image, size: 50),
                              )
                            : const Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                      ),
                      const SizedBox(width: 10),
                      // Book Details
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "bookfont",
                              ),
                            ),
                            Text(
                              authors,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: "bookfont",
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  pageCount,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: "bookfont",
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                Text(
                                  "$rate",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: "bookfont",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  readingModes.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: "bookfont",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  puplisher,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: "bookfont",
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  date,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: "bookfont",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
