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
  Future<Either<Failures, List<BookModel>>> fetchNewsBestBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');

      // https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=programming
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
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
  Future<Either<Failures, List<BookModel>>> fetchFutureBooks() async {
    try {
      var data =
          await apiService.get(endPoint: 'volumes?q=subject:programming');
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
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
