import 'package:book_app/config/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeDetailsAppBar extends StatelessWidget {
  const CustomHomeDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: const EdgeInsets.only(left: 2),
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
        ),
        const Spacer(),
        IconButton(
          padding: const EdgeInsets.only(right: 5),
          onPressed: () {
            GoRouter.of(context).push(AppRouters.shoppingCartView);
          },
          icon: const Icon(
            FontAwesomeIcons.cartShopping,
            size: 23,
          ),
        ),
      ],
    );
  }
}

