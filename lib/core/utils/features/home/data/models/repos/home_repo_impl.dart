// import 'package:bookly/core/errors/failures.dart';
// import 'package:bookly/core/utils/api_service.dart';
// import 'package:bookly/core/utils/features/home/data/models/book_model/book_model.dart';
// import 'package:bookly/core/utils/features/home/data/models/repos/home_repo.dart';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// // MVVM

// class HomeRepoImpl extends HomeRepo {
//   ApiService apiService;
//   HomeRepoImpl(this.apiService);

//   @override
//   Future<Either<Failures, BookModel>> fetchFutureBooks() async {
//     try {
//       var data = await apiService.get(
//           endPoint: 'volumes?Filtering=ebooks&q=inpublisher');
//       BookModel books = BookModel.fromJson(data); // Parse the entire response
//       return right(books);
//     } on Exception catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioError(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failures, BookModel>> fetchNewsBestBooks(
//       {int startIndex = 0}) async {
//     try {
//       var data = await apiService.get(
//           endPoint: 'volumes?Filtering=free-ebooks&q=subject');

//       BookModel books = BookModel.fromJson(data);
//       //
//       return right(books);
//     } on Exception catch (e) {
//       if (e is DioException) {
//         return left(
//           ServerFailure.fromDioError(e),
//         );
//       }
//       return left(ServerFailure(
//         e.toString(),
//       ));
//     }
//   }

//   @override
//   Future<Either<Failures, BookModel>> fetchSimillerBooks(
//       {int startIndex = 0}) async {
//     try {
//       var data =
//           await apiService.get(endPoint: 'volumes?Filtering=full&q=intitle');

//       BookModel books = BookModel.fromJson(data);
//       //
//       return right(books);
//     } on Exception catch (e) {
//       if (e is DioException) {
//         return left(
//           ServerFailure.fromDioError(e),
//         );
//       }
//       return left(ServerFailure(
//         e.toString(),
//       ));
//     }
//   }
// }

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
          'volumes?Filtering=free-ebooks&q=horror&startIndex=$startIndex&maxResults=$maxResults',
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
      final books = BookModel.fromJson(data); // Parse the response
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
