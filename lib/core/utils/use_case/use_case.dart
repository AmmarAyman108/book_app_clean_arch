
import 'package:book_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<type> {
  Future<Either<Failure, type>> call({param});
}
