import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/search/data/data_source/searched_books_remote_data_source.dart';
import 'package:book_app/features/search/data/repos/search_book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchedBookRepoImpl implements SearchedBookRepo {
  final SearchedBooksRemoteDataSource searchedBooksRemoteDataSource;
  SearchedBookRepoImpl(this.searchedBooksRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      {required String name}) async {
    List<BookEntity> books;
    try {
      books =
          await searchedBooksRemoteDataSource.fetchSearchedBooks(name: name);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
