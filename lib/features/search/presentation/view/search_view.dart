import 'package:book_app/core/utils/api_methods/api_methods.dart';
import 'package:book_app/core/utils/constants.dart';
import 'package:book_app/features/search/data/data_source/searched_books_remote_data_source.dart';
import 'package:book_app/features/search/data/repos/search_book_repo_impl.dart';
import 'package:book_app/features/search/presentation/manager/cubit/searchbook_cubit.dart';
import 'package:book_app/features/search/presentation/view/widgets/search_view_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchedBookCubit(
        searchedBookRepoImpl: SearchedBookRepoImpl(
          SearchedBooksRemoteDataSourceImpl(
            apiService: ApiService(
                    dio: Dio(
                      BaseOptions(baseUrl: AppSettings.kBaseUrl),
                    ),
                  ),
          ),
        ),
      ),
      child: SearchViewDetails(),
    );
  }
}
