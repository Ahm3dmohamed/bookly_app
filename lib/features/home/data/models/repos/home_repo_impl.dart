import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/models/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// MVVM

class HomeRepoImpl extends HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, BookModel>> fetchFutureBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=ebooks&q=inpublisher');
      BookModel books = BookModel.fromJson(data); // Parse the entire response
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, BookModel>> fetchNewsBestBooks(
      {int startIndex = 0}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject');

      BookModel books = BookModel.fromJson(data);
      //
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }

  @override
  Future<Either<Failures, BookModel>> fetchSimillerBooks(
      {int startIndex = 0}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=subject:programming&Sorting=relevance');

      BookModel books = BookModel.fromJson(data);
      //
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(ServerFailure(
        e.toString(),
      ));
    }
  }
}
