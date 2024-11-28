import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

class FeaturesBookState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeaturesBookIntail extends FeaturesBookState {}

class FeaturesBookLoading extends FeaturesBookState {}

class FeaturesBookSuccess extends FeaturesBookState {
  final List<BookModel> books;

  FeaturesBookSuccess({required this.books});
}

class FeaturesBookFailure extends FeaturesBookState {
  final String errorMessage;

  FeaturesBookFailure({required this.errorMessage});
}
