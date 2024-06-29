import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/utils/use_case/use_case.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/domain/repos/book_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>> {
  final BookRepo bookRepo;

  FetchNewestBooksUseCase({required this.bookRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call({param}) {
    return bookRepo.fetchNewestBooks();
  }
}
