import 'package:bloc/bloc.dart';

import '../../../Domain/entities/bookly_entity.dart';
import '../../../Domain/use_case/fetch_newset_books_use_case.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewsetBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;
  Future<void> fetchNewsetBooks({int pageNumber = 0}) async {
    emit(NewsetBooksLoading());
    var result = await fetchNewsetBooksUseCase.call();
    result.fold((l) => emit(NewsetBooksFailure(l.toString())),
        (r) => emit(NewsetBooksSucsses(r)));
  }
}
