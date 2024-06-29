import 'package:book_app/core/utils/use_case/use_case.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/domain/repos/book_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class FetchFeaturedBooksUseCase implements
 UseCase<List<BookEntity>> {
  final BookRepo bookRepo;

  FetchFeaturedBooksUseCase({required this.bookRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call({param})
   async {
    return await bookRepo.fetchFeaturedBooks();
  }
}
