import 'package:book_app/core/utils/widgets/book_tile_widget.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResultBooksList extends StatelessWidget {
  final List<BookEntity> book;
  const ResultBooksList({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: book.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: BookTileWidget(
          book: book[index],
        ),
      ),
    );
  }
}
