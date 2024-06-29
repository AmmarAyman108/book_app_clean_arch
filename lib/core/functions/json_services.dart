
import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/core/utils/models/book_model/book_model.dart';

Future<Map<String, dynamic>> getJsonData({
  required ApiService api,
  required String endPoint,
  Map<String, dynamic>? queryParameters,
}) async {
  Map<String, dynamic> jsonData = await api.get(
    endPoint: endPoint,
    queryParameters: queryParameters,
  );

  return jsonData;
}

List<BookModel> convertJsonToModel(jsonData) {
  List<BookModel> books = [];
  for (var element in jsonData['items']) {
    books.add(BookModel.fromJson(element));
  }
  return books;
}
