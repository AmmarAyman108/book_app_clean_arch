import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/presentation/view/books_view.dart';
import 'package:book_app/features/book_details/presentation/view/book_details_view.dart';
import 'package:book_app/features/home/presentation/views/home_view.dart';
import 'package:book_app/features/saved_books/presentation/view/saved_books_view.dart';
import 'package:book_app/features/search/presentation/view/search_view.dart';
import 'package:book_app/features/shopping_cart/presentation/view/cart_chopping_view.dart';
import 'package:book_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouters {
  static const String splashView = '/';
  static const String homeView = '/HomeView';
  static const String bookView = '/ookView';
  static const String bookDetailsView = '/BookDetailsView';
  static const String shoppingCartView = '/ShoppingCartView';
  static const String searchView = '/SearchView';
  static const String savedBooksView = '/SavedBooksView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: bookView,
      builder: (context, state) => const BooksView(),
    ),
    GoRoute(
      path: bookDetailsView,
      builder: (context, state ) =>  BookDetailsView(book: state.extra as BookEntity,),
    ),
    GoRoute(
      path: shoppingCartView,
      builder: (context, state) => const ShoppingCartView( ),
    ),
    GoRoute(
      path: searchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: savedBooksView,
      builder: (context, state) => const SavedBooksView(),
    ),
    GoRoute(
      path: savedBooksView,
      builder: (context, state) => const SavedBooksView(),
    ),
  ]);
}
