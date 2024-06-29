import 'package:book_app/core/utils/widgets/book_tile_widget.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class NewBooksList extends StatelessWidget {
  final List<BookEntity>? books;
  const NewBooksList({super.key,  this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>  Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: BookTileWidget(book:books![index] ,),
      ),
      itemCount: books!.length,
    );
  }
}
