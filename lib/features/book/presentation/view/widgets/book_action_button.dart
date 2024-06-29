import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BookActionButton extends StatelessWidget {
 final Function() onPressed;
  const BookActionButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(50)),
              color: Colors.white,
              text: 'Review',
              textStyle: AppStyles.textStyle20.copyWith(
                color: Colors.black,
              ),
              onPressed: onPressed),
        ),
        Expanded(
          child: CustomButton(
              borderRadius:
                  const BorderRadius.horizontal(right: Radius.circular(50)),
              color: const Color.fromARGB(255, 254, 41, 25),
              text: 'Free Review',
              textStyle: AppStyles.textStyle18,
              onPressed: () {}),
        ),
      ],
    );
  }
}
