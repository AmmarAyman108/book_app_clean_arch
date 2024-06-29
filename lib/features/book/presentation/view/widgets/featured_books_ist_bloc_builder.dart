// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_app/core/utils/widgets/error_widget.dart';
import 'package:book_app/features/book/presentation/view/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:book_app/features/book/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:book_app/features/book/presentation/view/widgets/featured_books_list.dart';

class FeaturedBooksListBlocBuilder extends StatelessWidget {
  const FeaturedBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksFailed) {
          return CustomErrorWidget(
            onTap: () => BlocProvider.of<FetchFeaturedBooksCubit>(context).fetchFeaturedBooks(),
            errorMessage: state.errorMessage,
          );
        } else if (state is FetchFeaturedBooksSuccess) {
          return FeaturedBooksList(book: state.books);
        } else {
          return const ShimmerLoading();
        }
      },
    );
  }
}
