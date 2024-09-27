part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoadingPagination extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess(this.books);
}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}

class SearchFailurePagination extends SearchState {
  final String errorMessage;

  SearchFailurePagination(this.errorMessage);
}
