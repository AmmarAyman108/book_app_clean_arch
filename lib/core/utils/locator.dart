import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/features/book/data/data_sources/book_local_data_source.dart';
import 'package:book_app/features/book/data/data_sources/book_remote_data_source.dart';
import 'package:book_app/features/book/data/repo/book_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(
        BaseOptions(baseUrl: AppSettings.kBaseUrl),
      ),
    ),
  );
  getIt.registerSingleton<BookRepoImpl>(
    BookRepoImpl(
      BookRemoteDataSourceImpl(
        api: getIt.get<ApiService>(),
      ),
      BookLocalDataSourceImpl(),
    ),
  );
}

