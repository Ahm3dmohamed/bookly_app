import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/home_view_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../features/home/data/models/book_model/item.dart';
import '../features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import '../style.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({
    super.key,
    required this.books,
    required this.items,
  });

  final List<Item> books;
  final Item items;

  @override
  Widget build(BuildContext context) {
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: searchTransition,
                        child: HomeViewDetails(
                          volumeInfo: book,
                          items: items,
                        ),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: book!.imageLinks!.thumbnail!,
                      width: SizeConfig.screenWidth * .30,
                      height: SizeConfig.screenHeight * .20,
                      fit: BoxFit.fill,
                    ),
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

              SizedBox(
                width: SizeConfig.width(4),
              ),

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

                    SizedBox(
                      width: SizeConfig.width(5),
                    ),
                    // Book Authors
                    if (book?.authors != null && book!.authors!.isNotEmpty)
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
                    SizedBox(
                      width: SizeConfig.height(9),
                    ),
                    Text(
                      book?.publishedDate ?? 'No Date Available',
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<CartCubit>(context)
                      .removeBookFromCart(books[index]);
                  var snackBar = SnackBar(
                    elevation: 0,
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.all(SizeConfig.screenHeight * .04),
                    content: const AwesomeSnackbarContent(
                      title: 'Done',
                      message: 'Book Removed  !',
                      contentType: ContentType.failure,
                    ),
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
