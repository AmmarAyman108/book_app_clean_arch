import 'package:book_app/core/functions/json_services.dart';
import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/core/utils/models/book_model/book_model.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class BookRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final ApiService api;

  BookRemoteDataSourceImpl({required this.api});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    return await FeaturedBooks.call(api);
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    return await NewestBooks.call(
      api,
    );
  }
}

class FeaturedBooks {
  static Future<List<BookModel>> call(
    ApiService api,
  ) async {
    List<BookModel> books = convertJsonToModel(
      await getJsonData(
        api: api,
        endPoint: '/volumes',
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'programming',
        },
      ),
    );
    await savedBooksData(books, AppSettings.kFeaturedBooksBox);
    return books;
  }
}

class NewestBooks {
  static Future<List<BookModel>> call(
    ApiService api,
  ) async {
    List<BookModel> books = convertJsonToModel(
      await getJsonData(
        api: api,
        endPoint: '/volumes',
        queryParameters: {
          'q': 'programming',
          'Filtering': 'free-ebooks',
          'Sorting': 'newest',
        },
      ),
    );
    await savedBooksData(books, AppSettings.knNewestBooksBox);

    return books;
  }
}

Future<void> savedBooksData(List<BookModel> books, String boxName) async {
  await Hive.box<BookEntity>(boxName).addAll(books);
}
