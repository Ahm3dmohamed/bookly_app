import 'package:bookly/features/home/presentation/manager/similler_book_cubit/similler_book_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../../../core/utils/widgets/custom_loadingindicator_widget.dart';
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeViewDetails(
                          volumeInfo: items[index].volumeInfo,
                          similarBooks: items,
                        ),
                      ),
                    );
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
