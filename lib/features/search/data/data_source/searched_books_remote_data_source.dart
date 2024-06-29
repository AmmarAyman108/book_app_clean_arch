import 'package:book_app/core/functions/json_services.dart';
import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/core/utils/models/book_model/book_model.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';

abstract class SearchedBooksRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBooks({required String name});
}

class SearchedBooksRemoteDataSourceImpl
    implements SearchedBooksRemoteDataSource {
  ApiService apiService;
  SearchedBooksRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchSearchedBooks({required String name}) async {
    List<BookModel> books = convertJsonToModel(
      await getJsonData(
        api: apiService,
        endPoint: 'volumes',
        queryParameters: {
          "Filtering": "free-ebooks",
          "q": name,
          "Sorting": "relevance"
        },
      ),
    );

    return books;
  }
}
