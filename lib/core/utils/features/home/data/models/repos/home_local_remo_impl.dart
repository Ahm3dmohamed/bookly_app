import 'package:bookly/core/cached/cache_helper.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/features/home/data/models/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeLocalRemoImpl implements HomeRepo {
  @override
  Future<Either<Failures, BookModel>> fetchFutureBooks() async {
    try {
      BookModel bookModel = await CacheHelper.getBooksData();
      return right(bookModel);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, BookModel>> fetchNewsBestBooks() async {
    try {
      BookModel bookModel = await CacheHelper.getBooksData();
      return right(bookModel);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, BookModel>> fetchSimillerBooks() async {
    try {
      BookModel bookModel = await CacheHelper.getBooksData();
      return right(bookModel);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
