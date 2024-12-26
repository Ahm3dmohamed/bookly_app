import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/similler_book_cubit/similler_book_cubit.dart';
import 'package:bookly/core/utils/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'home_view_details.dart';

class SimillerBookListview extends StatelessWidget {
  const SimillerBookListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimillerBookCubit, SimillerBookState>(
      builder: (context, state) {
        if (state is SimillerBookFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SimillerBookSuccess) {
          final items = state.books.items ?? [];
          final item = Item();
          if (items.isEmpty) {
            return const Center(
              child: Text(
                "No books available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: searchTransition,
                        child: HomeViewDetails(
                          volumeInfo: item.volumeInfo,
                          items: item,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  onLongPress: () {
                    BlocProvider.of<CartCubit>(context).addBookToCart(item);
                    final snackBar = SnackBar(
                      elevation: 0,
                      padding: EdgeInsets.all(SizeConfig.screenHeight * .04),
                      behavior: SnackBarBehavior.fixed,
                      dismissDirection: DismissDirection.startToEnd,
                      backgroundColor: Colors.transparent,
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
                  child: CustomBookImage(
                    imageUrl:
                        items[index].volumeInfo?.imageLinks?.thumbnail ?? "",
                  ),
                ),
              );
            },
          );
        } else {
          return const CustomLoadingIndicatorWidget();
        }
      },
    );
  }
}
