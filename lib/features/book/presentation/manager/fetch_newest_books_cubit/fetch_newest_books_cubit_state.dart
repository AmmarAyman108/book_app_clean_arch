part of 'fetch_newest_books_cubit.dart';

sealed class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

class FetchNewestBooksLoading extends FetchNewestBooksState {}

class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess(this.books);
}

class FetchNewestBooksFailed extends FetchNewestBooksState {
  final String errorMessage;

  FetchNewestBooksFailed(this.errorMessage);
}
