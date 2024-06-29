import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/utils/widgets/book.dart';
import 'package:book_app/core/utils/widgets/custom_book_rating.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/presentation/view/widgets/book_action_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsWidget extends StatelessWidget {
  final BookEntity book;

  const BookDetailsWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 4,
              vertical: 40,
            ),
            child: Book(
              image: book.image,
            ),
          ),
        ),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            book.title,
            style: AppStyles.textStyle25,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Center(
          child: Text(
            book.authorName ?? 'author',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle20.copyWith(
              fontStyle: FontStyle.italic,
              color: Colors.white.withOpacity(.6),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomBookRating(
          rating: book.rating,
        ),
        const SizedBox(
          height: 40,
        ),
        BookActionButton(
          onPressed: () async {
            final Uri _url = Uri.parse(book.url!);

            if (await canLaunchUrl(_url)) {
              await launchUrl(_url);
            }
          },
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
