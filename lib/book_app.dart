import 'package:book_app/config/routers/routers.dart';
import 'package:book_app/config/themes/themes.dart';
import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/features/book/data/data_sources/book_local_data_source.dart';
import 'package:book_app/features/book/data/data_sources/book_remote_data_source.dart';
import 'package:book_app/features/book/data/repo/book_repo_impl.dart';
import 'package:book_app/features/book/domain/use_cases/fetch_featured_use_case.dart';
import 'package:book_app/features/book/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:book_app/features/book/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:book_app/features/book/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchFeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              bookRepo: BookRepoImpl(
                BookRemoteDataSourceImpl(
                  api: ApiService(
                    dio: Dio(
                      BaseOptions(baseUrl: AppSettings.kBaseUrl),
                    ),
                  ),
                ),
                BookLocalDataSourceImpl(),
              ),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => FetchNewestBooksCubit(
            FetchNewestBooksUseCase(
              bookRepo: BookRepoImpl(
                BookRemoteDataSourceImpl(
                  api: ApiService(
                    dio: Dio(
                      BaseOptions(baseUrl: AppSettings.kBaseUrl),
                    ),
                  ),
                ),
                BookLocalDataSourceImpl(),
              ),
            ),
          )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
          routerConfig: AppRouters.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme()),
    );
  }
}
