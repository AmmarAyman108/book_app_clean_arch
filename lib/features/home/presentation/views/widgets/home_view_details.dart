import 'package:book_app/features/book/presentation/view/books_view.dart';
import 'package:book_app/features/home/presentation/views/widgets/floating_action_button_icon.dart';
import 'package:book_app/features/saved_books/presentation/view/saved_books_view.dart';
import 'package:book_app/features/search/presentation/view/search_view.dart';
import 'package:book_app/features/shopping_cart/presentation/view/cart_chopping_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewDetails extends StatefulWidget {
  const HomeViewDetails({super.key});

  @override
  State<HomeViewDetails> createState() => _HomeViewDetailsState();
}

class _HomeViewDetailsState extends State<HomeViewDetails> {
  int currentIndex = 0;
  List<Widget> views = const [
    BooksView(),
    SearchView(),
    SavedBooksView(),
    ShoppingCartView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: MediaQuery.of(context).size.height * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 41, 35, 58),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButtonIcon(
              currentIndex: currentIndex,
              index: 0,
              icon: FontAwesomeIcons.book,
              onPressed: () => setState(() => currentIndex = 0),
            ),
            FloatingActionButtonIcon(
              currentIndex: currentIndex,
              index: 1,
              icon: FontAwesomeIcons.magnifyingGlass,
              onPressed: () => setState(() => currentIndex = 1),
            ),
            FloatingActionButtonIcon(
              currentIndex: currentIndex,
              onPressed: () => setState(() => currentIndex = 2),
              index: 2,
              icon: FontAwesomeIcons.solidBookmark,
            ),
            FloatingActionButtonIcon(
              currentIndex: currentIndex,
              onPressed: () => setState(() => currentIndex = 3),
              index: 3,
              icon: FontAwesomeIcons.cartShopping,
            )
          ],
        ),
      ),
    );
  }
}
