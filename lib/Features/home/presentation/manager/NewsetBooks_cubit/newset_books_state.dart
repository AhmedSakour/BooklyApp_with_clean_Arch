part of 'newset_books_cubit.dart';

abstract class NewsetBooksState {}

class NewsetBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}

class NewsetBooksLoadingPagination extends NewsetBooksState {}

class NewsetBooksSucsses extends NewsetBooksState {
  final List<BookEntity> books;

  NewsetBooksSucsses(this.books);
}

class NewsetBooksFailure extends NewsetBooksState {
  final String errorMessage;

  NewsetBooksFailure(this.errorMessage);
}

class NewsetBooksFailurePagination extends NewsetBooksState {
  final String errorMessage;

  NewsetBooksFailurePagination(this.errorMessage);
}
