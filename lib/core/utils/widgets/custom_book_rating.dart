import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookRating extends StatelessWidget {
  final String? rating;
  const CustomBookRating({
    super.key,
    required this.rating,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.bookmark,
              size: 23,
            )),
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 18,
        ),
        const SizedBox(
          width: 6,
        ),
         const Text(
          "(0)",
        ),
        const SizedBox(
          width: 5,
        ),
         const Text(
         '0 Reviews' ,
        )
      ],
    );
  }
}
