part of 'similler_book_cubit.dart';

sealed class SimillerBookState extends Equatable {
  const SimillerBookState();

  @override
  List<Object> get props => [];
}

final class SimillerBookInitial extends SimillerBookState {}

final class SimillerBookLoading extends SimillerBookState {}

final class SimillerBookSuccess extends SimillerBookState {
  final BookModel books;

  const SimillerBookSuccess({required this.books});
}

final class SimillerBookFailure extends SimillerBookState {
  final String errMessage;

  const SimillerBookFailure(message, {required this.errMessage});
}
