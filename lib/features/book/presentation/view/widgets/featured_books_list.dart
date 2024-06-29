
import 'package:book_app/core/utils/widgets/book.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class FeaturedBooksList extends StatelessWidget {
  final List<BookEntity> book;
  const FeaturedBooksList({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount:  book.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
              onTap: () {
                
              },
              child:  Book(image: book[index].image,)),
        ),
      ),
    );
  }
}
