import 'package:book_app/core/utils/widgets/error_widget.dart';
import 'package:book_app/core/utils/widgets/shimmer_list_tile.dart';
import 'package:book_app/features/search/presentation/manager/cubit/searchbook_cubit.dart';
import 'package:book_app/features/search/presentation/view/widgets/result_book_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultBookListView extends StatelessWidget {
  final String name;
  const ResultBookListView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBookCubit, SearchedBookState>(
      builder: (context, state) {
        if (state is SearchedBookFailedState) {
          return SliverFillRemaining(
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
              onTap: () => BlocProvider.of<SearchedBookCubit>(context)
                  .fetchSearchedBook(name: name),
            ),
          );
        } else if (state is SearchedBookInitialState) {
          return const SliverFillRemaining(
            child: Center(
              child: Text(
                'No Results Found',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else if (state is SearchedBookSuccessState) {
          if (state.books.isNotEmpty) {
            return SliverToBoxAdapter(
                child: ResultBooksList(book: state.books));
          } else {
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  'No Results Found',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
        } else {
          return const SliverToBoxAdapter(child: ShimmerListTile());
        }
      },
    );
  }
}
