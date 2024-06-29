import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/book/data/data_sources/book_local_data_source.dart';
import 'package:book_app/features/book/data/data_sources/book_remote_data_source.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/domain/repos/book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class BookRepoImpl implements BookRepo {
  final BookRemoteDataSource bookRemoteDataSource;
  final BookLocalDataSource bookLocalDataSource;

  BookRepoImpl(this.bookRemoteDataSource, this.bookLocalDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    List<BookEntity> books = [];

    try {
      books = bookLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await bookRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books = [];
    try {
      books = bookLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await bookRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
