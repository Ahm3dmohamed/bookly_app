import 'package:bookly/core/config/size_config.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly/core/utils/widgets/custom_loadingindicator_widget.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_%20cubit/features_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_%20cubit/features_book_state.dart';

class FeatureBookSListView extends StatelessWidget {
  const FeatureBookSListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocBuilder<FeaturesBooksCubit, FeaturesBookState>(
      builder: (BuildContext context, FeaturesBookState state) {
        if (state is FeaturesBookFailure) {
          return CustomErrorWidget(errMessage: state.errorMessage);
        } else if (state is FeaturesBookSuccess) {
          return SizedBox(
            // height: 120, // Space for image + title
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.books.items?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(
                width: SizeConfig.width(3),
              ), // Horizontal spacing
              itemBuilder: (context, index) {
                final book = state.books.items![index];
                return SizedBox(
                  width: SizeConfig.width(40),
                  height: SizeConfig.height(25),
                  child: CustomBookImage(
                      imageUrl: book.volumeInfo?.imageLinks?.thumbnail ?? ""),
                );
              },
            ),
          );
        } else {
          return const CustomLoadingIndicatorWidget();
        }
      },
    );
  }
}

// class BookListviewItems extends StatelessWidget {
//   const BookListviewItems({required this.bookModel, Key? key})
//       : super(key: key);

//   final Item bookModel; // Changed from `VolumeInfo` to `Item`.

//   @override
//   Widget build(BuildContext context) {
//     final volumeInfo = bookModel.volumeInfo;

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeViewDetails(
//               volumeInfo: volumeInfo,
//               similarBooks: [bookModel],
//             ),
//           ),
//         );
//       },
//       child: Container(
//         color: Colors.amber,
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomBookImage(
//               imageUrl: volumeInfo?.imageLinks?.thumbnail ??
//                   'https://via.placeholder.com/150', // Fallback image
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
