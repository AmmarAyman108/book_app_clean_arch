import 'package:book_app/core/utils/widgets/book.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class SimilarBooksList extends StatelessWidget {
  final List<BookEntity> book;

  SimilarBooksList({
    super.key,
    required this.book,
  });
  final ScrollController? scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
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
            child: Book(
              image: book[index].image,
            ),
          ),
          itemCount: book.length,
        ),
      ),
    ));
  }

  Future<void> autoScrollToEnd() async {
    await Future.delayed(const Duration(seconds: 1), () {
      scrollController!.animateTo(
        scrollController!.position.maxScrollExtent,
        duration: const Duration(seconds: 25),
        curve: Curves.easeInOut,
      );
    });
  }
}
