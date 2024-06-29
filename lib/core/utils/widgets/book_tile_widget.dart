import 'package:book_app/config/routers/routers.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/utils/widgets/book.dart';
import 'package:book_app/core/utils/widgets/custom_book_rating.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookTileWidget extends StatelessWidget {
  final BookEntity? book;
  const BookTileWidget({
    super.key,
    this.book,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouters.bookDetailsView, extra: book);
      },
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            Book(
              image: book!.image,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        book!.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle20.copyWith(
                            //   fontFamily: GoogleFonts.aBeeZee().fontFamily
                            ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        book!.authorName ?? 'author',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Free',
                          style: AppStyles.textStyle23,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CustomBookRating(rating: book!.rating),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
