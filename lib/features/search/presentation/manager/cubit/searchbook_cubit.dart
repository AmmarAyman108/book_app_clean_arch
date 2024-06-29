// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_app/features/book/domain/entities/book_entity.dart';
import 'package:book_app/features/search/data/repos/search_book_repo_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'searchbook_state.dart';

class SearchedBookCubit extends Cubit<SearchedBookState> {
  SearchedBookRepoImpl searchedBookRepoImpl;
  SearchedBookCubit({
    required this.searchedBookRepoImpl,
  }) : super(SearchedBookInitialState());
  fetchSearchedBook({required String name}) async {
    emit(SearchedBookLoadingState());

    var result = await searchedBookRepoImpl.fetchSearchedBooks(name: name);

    result.fold(
        (failure) => emit(SearchedBookFailedState(failure.errorMessage)),
        (books) => emit(SearchedBookSuccessState(books)));
  }
}
