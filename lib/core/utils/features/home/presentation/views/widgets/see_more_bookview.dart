import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/similler_book_cubit/similler_book_cubit.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';

class SeeMoreBooksView extends StatelessWidget {
  const SeeMoreBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SimillerBookCubit>().fetchSimillerBook(); // Trigger data fetch

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "More Books",
          style: Styles.textStyle18,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SimillerBookCubit, SimillerBookState>(
        builder: (context, state) {
          if (state is SimillerBookLoading) {
            return const CustomLoadingIndicatorWidget();
          } else if (state is SimillerBookFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else if (state is SimillerBookSuccess) {
            final books = state.books.items ?? [];

            if (books.isEmpty) {
              return const Center(
                child: Text(
                  "No books available.",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index].volumeInfo;

                return Card(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Book Thumbnail
                      if (book?.imageLinks?.thumbnail != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: book!.imageLinks!.thumbnail!,
                            width: 110,
                            height: 180,
                            fit: BoxFit.fill,
                          ),
                        )
                      else
                        Container(
                          width: SizeConfig.width(.12),
                          height: SizeConfig.height(.25),
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.book,
                            color: Colors.grey,
                          ),
                        ),

                      const SizedBox(width: 16),

                      // Book Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Book Title
                            Text(
                              book?.title ?? 'No Title Available',
                              style: Styles.textStyle16,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 8),

                            // Book Authors
                            if (book?.authors != null &&
                                book!.authors!.isNotEmpty)
                              Text(
                                "by ${book.authors!.join(', ')}",
                                style: Styles.textStyle14.copyWith(
                                  color: Colors.grey[600],
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              )
                            else
                              const Text(
                                "Author: Unknown",
                                style: TextStyle(color: Colors.grey),
                              ),
                            const SizedBox(height: 12),

                            Text(
                              book?.publishedDate ?? 'No Date Available',
                              style: Styles.textStyle14
                                  .copyWith(color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const SizedBox(); // Default fallback
          }
        },
      ),
    );
  }
}
