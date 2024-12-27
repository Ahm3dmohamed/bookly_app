import 'package:bookly/core/cached/cache_helper.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/features/home/data/models/repos/home_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, BookModel>> fetchFutureBooks({
    int startIndex = 0,
    int maxResults = 40,
  }) async {
    return _fetchBooks(
      endpoint:
          'volumes?Filtering=free-ebooks&q=comedy&startIndex=$startIndex&maxResults=$maxResults',
    );
  }

  @override
  Future<Either<Failures, BookModel>> fetchNewsBestBooks({
    int startIndex = 0,
    int maxResults = 40,
  }) async {
    return _fetchBooks(
      endpoint:
          'volumes?Filtering=free-ebooks&q=inauthor&startIndex=$startIndex&maxResults=$maxResults',
    );
  }

  @override
  Future<Either<Failures, BookModel>> fetchSimillerBooks({
    int startIndex = 0,
    int maxResults = 40,
  }) async {
    return _fetchBooks(
      endpoint:
          'volumes?Filtering=free-ebooks&q=action&startIndex=$startIndex&maxResults=$maxResults',
    );
  }

  @override
  Future<Either<Failures, BookModel>> performSearch({
    required String query,
    int startIndex = 0,
    int maxResults = 40,
  }) async {
    return _fetchBooks(
      endpoint:
          'volumes?q=$query&startIndex=$startIndex&maxResults=$maxResults',
    );
  }

  /// Private method to handle API calls and reduce code repetition.
  Future<Either<Failures, BookModel>> _fetchBooks({
    required String endpoint,
  }) async {
    try {
      final data = await apiService.get(endPoint: endpoint);
      final books = BookModel.fromJson(data);
      await CacheHelper.saveBooks(books); // Parse the response
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
