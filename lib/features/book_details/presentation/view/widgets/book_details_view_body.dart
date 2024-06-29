import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/presentation/view/widgets/book_details_widget.dart';
import 'package:book_app/features/book_details/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:book_app/features/book_details/presentation/view/widgets/similar_books_list_bloc_builder.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;
  const BookDetailsViewBody({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(child: CustomHomeDetailsAppBar()),
            SliverToBoxAdapter(
                child: BookDetailsWidget(
              book: book,
            )),
            const SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'You can also like ',
                  style: AppStyles.textStyle20,
                ),
              ),
            ),
            const SimilarBooksListBlocBuilder(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
