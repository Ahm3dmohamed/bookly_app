import 'package:bookly/features/home/presentation/views/widgets/book_listview_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';
import 'package:bookly/features/home/presentation/manager/newest_books_cubit/newest_book_cubit.dart';

class BestSellerBookListview extends StatelessWidget {
  const BestSellerBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
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
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: BestsellerListviewItems(
                  book: items[index].volumeInfo,
                  items: items[index],
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
