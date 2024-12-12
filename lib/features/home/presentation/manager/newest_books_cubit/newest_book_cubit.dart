import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookState> {
  NewestBookCubit(this.homeRepo) : super(NewestBookInitial());
  HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBookLoading());
    var result = await homeRepo.fetchNewsBestBooks();
    result.fold((failure) {
      emit(NewestBookFailure(errMessage: failure.errorMessage, failure));
    }, (books) {
      emit(NewestBookSuccess(books: books));
    });
  }
}

// class NewestBookCubit extends Cubit<NewestBookState> {
//   final HomeRepo homeRepo;
//   int _startIndex = 0; // Initial start index
//   bool _isLoadingMore = false;

//   NewestBookCubit(this.homeRepo) : super(NewestBookInitial());

//   Future<void> fetchNewestBooks({bool loadMore = false}) async {
//     if (loadMore) {
//       if (_isLoadingMore) return; // Prevent multiple requests
//       _isLoadingMore = true;
//       _startIndex += 20; // Increment to fetch next batch
//     } else {
//       emit(NewestBookLoading());
//       _startIndex = 0; // Reset for fresh fetch
//     }

//     final result = await homeRepo.fetchNewsBestBooks();
//     result.fold(
//       (failure) {
//         if (loadMore) _isLoadingMore = false;
//         emit(NewestBookFailure(errMessage: failure.errorMessage, loadMore));
//       },
//       (books) {
//         if (loadMore) {
//           final currentBooks = state is NewestBookSuccess
//               ? (state as NewestBookSuccess).books.items ?? <Item>[]
//               : <Item>[];

//           final newBooks = books.items ?? <Item>[];
//           emit(NewestBookSuccess(
//             books: BookModel(items: currentBooks + newBooks),
//           ));
//           _isLoadingMore = false;
//         } else {
//           emit(NewestBookSuccess(books: books));
//         }
//       },
//     );
//   }

