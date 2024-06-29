// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/book/domain/use_cases/fetch_featured_use_case.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;

  FetchFeaturedBooksCubit( this.fetchFeaturedBooksUseCase):super(FetchFeaturedBooksInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FetchFeaturedBooksLoading());

    final result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FetchFeaturedBooksFailed(failure.errorMessage));
      },
      (books) => emit(FetchFeaturedBooksSuccess(books)),
    );
  }
}
