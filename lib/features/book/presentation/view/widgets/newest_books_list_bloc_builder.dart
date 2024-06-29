import 'package:book_app/core/utils/widgets/error_widget.dart';
import 'package:book_app/core/utils/widgets/shimmer_list_tile.dart';
import 'package:book_app/features/book/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:book_app/features/book/presentation/view/widgets/new_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListBlocBuilder extends StatelessWidget {
  const NewestBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksFailed) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
              onTap: () => BlocProvider.of<FetchNewestBooksCubit>(context).fetchNewestBooks(),
            ),
          );
        } else if (state is FetchNewestBooksSuccess) {
          return SliverToBoxAdapter(child: NewBooksList(books: state.books));
        } else {
          return const SliverToBoxAdapter(child: ShimmerListTile());
        }
      },
    );
  }
}
