import 'package:bookly/constants.dart';
import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/item.dart';
import 'package:bookly/core/utils/features/home/presentation/manager/similler_book_cubit/similler_book_cubit.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../widgets/custom_listview.dart';
import 'home_view_details.dart';

class SeeMoreBooksView extends StatelessWidget {
  final Item items;

  SeeMoreBooksView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    context.read<SimillerBookCubit>().fetchSimillerBook(); // Trigger data fetch
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
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

            return CustomListview(books: books, items: items);
          } else {
            return const SizedBox(); // Default fallback
          }
        },
      ),
    );
  }
}
