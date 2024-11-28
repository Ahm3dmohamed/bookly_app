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
    var result = await homeRepo.fetchFutureBooks();
    result.fold((failure) {
      emit(NewestBookFailure(errMessage: failure.errorMessage));
    }, (books) {
      emit(NewestBookSuccess(books: books));
    });
  }
}
