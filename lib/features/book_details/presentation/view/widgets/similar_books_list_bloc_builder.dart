import 'package:book_app/features/book/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:book_app/features/book_details/presentation/view/widgets/similar_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SimilarBooksListBlocBuilder extends StatelessWidget {
  const SimilarBooksListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksFailed) {
          return Center(child: Text(state.errorMessage));
        } else if (state is FetchFeaturedBooksSuccess) {
          return SimilarBooksList(book: state.books);
        } else {
          return SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Shimmer.fromColors(
                            direction: ShimmerDirection.ltr,
                            baseColor: const Color.fromARGB(255, 125, 125, 125),
                            highlightColor: const Color.fromARGB(255, 160, 159, 159),
                            child: Container(
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          )),
                    )),
              ),
            ),
          ));
        }
      },
    );
  }
}
