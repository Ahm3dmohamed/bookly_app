import 'package:bookly/features/home/data/models/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_%20cubit/features_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturesBooksCubit extends Cubit<FeaturesBookState> {
  FeaturesBooksCubit(this.homeRepo) : super(FeaturesBookIntail());

  final HomeRepo homeRepo;

  Future<void> fetchFutureBook() async {
    emit(FeaturesBookLoading());
    var result = await homeRepo.fetchFutureBooks();
    result.fold((Failures) {
      emit(FeaturesBookFailure(errorMessage: Failures.errorMessage));
    }, (books) {
      emit(FeaturesBookSuccess(books: books));
    });
  }
}
