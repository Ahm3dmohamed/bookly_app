import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/models/repos/home_repo.dart';

part 'similler_book_state.dart';

class SimillerBookCubit extends Cubit<SimillerBookState> {
  SimillerBookCubit(this.homeRepo) : super(SimillerBookInitial());
  HomeRepo homeRepo;

  Future<void> fetchSimillerBook() async {
    emit(SimillerBookLoading());
    var result = await homeRepo.fetchSimillerBooks();
    result.fold((failure) {
      emit(SimillerBookFailure(errMessage: failure.errorMessage, failure));
    }, (books) {
      emit(SimillerBookSuccess(books: books));
    });
  }
}
