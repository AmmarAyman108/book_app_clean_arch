part of 'searchbook_cubit.dart';

@immutable
sealed class SearchedBookState {}

final class SearchedBookInitialState extends SearchedBookState {}

class SearchedBookLoadingState extends SearchedBookState {}

class SearchedBookSuccessState extends SearchedBookState {
  final List<BookEntity> books;

  SearchedBookSuccessState(this.books);
}

class SearchedBookFailedState extends SearchedBookState {
  final String errorMessage;

  SearchedBookFailedState(this.errorMessage);
}
