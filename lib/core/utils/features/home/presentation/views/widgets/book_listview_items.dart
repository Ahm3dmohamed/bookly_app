import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/home_view_details.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../../../../../../constants.dart';
import '../../../data/models/book_model/volume_info.dart';
import '../../manager/cart_cubit/cart_cubit.dart';
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
      onLongPress: () {
        BlocProvider.of<CartCubit>(context).addBookToCart(items);
        var snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.all(SizeConfig.screenHeight * .04),
          content: const AwesomeSnackbarContent(
            title: 'Successfully',
            message: 'Book Added !',
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      },
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            duration: searchTransition,
            child: HomeViewDetails(
              volumeInfo: book,
              items: items,
            ),
            type: PageTransitionType.rightToLeft,
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
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book?.title ?? "Untitled",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18),
                    Text(book?.authors?.join(", ") ?? "Unknown Author",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14.copyWith(color: Colors.grey)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text("Free ", style: Styles.textStyle16),
                        const Spacer(),
                        BookRating(
                          count: book?.pageCount?.toString() ?? "N/A",
                          rate: "4,8",
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(book?.publishedDate ?? "2004",
                            style: Styles.textStyle16
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
