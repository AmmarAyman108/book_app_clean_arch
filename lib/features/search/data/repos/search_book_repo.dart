import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchedBookRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks({
    required String name,
  });
}
