// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/domain/use_cases/fetch_newest_books_use_case.dart';

part 'fetch_newest_books_cubit_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  FetchNewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(FetchNewestBooksInitial());

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());

    final result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchNewestBooksFailed(failure.errorMessage));
      },
      (books) => emit(FetchNewestBooksSuccess(books)),
    );
  }
}
