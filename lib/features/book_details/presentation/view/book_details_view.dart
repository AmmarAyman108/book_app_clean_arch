import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book_details/presentation/view/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity? book;
  const BookDetailsView({super.key, 
     this.book,});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BookDetailsViewBody(
        book:book! ,
      ),
    );
  }
}
