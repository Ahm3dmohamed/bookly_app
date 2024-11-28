part of 'newest_book_cubit.dart';

sealed class NewestBookState extends Equatable {
  const NewestBookState();

  @override
  List<Object> get props => [];
}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoading extends NewestBookState {}

final class NewestBookSuccess extends NewestBookState {
  final List<BookModel> books;

  const NewestBookSuccess({required this.books});
}

final class NewestBookFailure extends NewestBookState {
  final String errMessage;

  const NewestBookFailure({required this.errMessage});
}
