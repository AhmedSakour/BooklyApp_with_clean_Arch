import 'package:bloc/bloc.dart';

import '../../../Domain/entities/bookly_entity.dart';
import '../../../Domain/use_case/fetch_newset_books_use_case.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewsetBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;
  Future<void> fetchNewsetBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewsetBooksLoading());
    } else {
      emit(NewsetBooksLoadingPagination());
    }
    var result = await fetchNewsetBooksUseCase.call(pageNumber);
    result.fold(
        (l) => pageNumber == 0
            ? emit(NewsetBooksFailure(l.erroMessage))
            : emit(NewsetBooksFailurePagination(l.erroMessage)),
        (r) => emit(NewsetBooksSucsses(r)));
  }
}
