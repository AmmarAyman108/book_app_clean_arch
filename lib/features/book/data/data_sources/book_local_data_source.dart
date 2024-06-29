import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class BookLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class BookLocalDataSourceImpl implements BookLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    return Hive.box<BookEntity>(AppSettings.kFeaturedBooksBox).values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    return Hive.box<BookEntity>(AppSettings.knNewestBooksBox).values.toList();
  }
}
