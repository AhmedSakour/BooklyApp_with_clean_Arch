import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/Features/home/Domain/entities/bookly_entity.dart';
import 'package:bookly_clean_arch/Features/home/Domain/use_case/similer_books_use_case.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.fetchSimilerBookUseCase)
      : super(SimilerBooksInitial());
  final FetchSimilerBookUseCase fetchSimilerBookUseCase;
  Future<void> fetchSimilerBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilerBooksLoading());
    } else {
      emit(SimilerBooksPaginationLoading());
    }

    var result = await fetchSimilerBookUseCase.call(pageNumber);
    result.fold(
        (l) => pageNumber == 0
            ? emit(SimilerBooksFailure(l.erroMessage))
            : emit(SimilerBooksPaginationFailure(l.erroMessage)),
        (r) => emit(SimilerBooksSuccess(r)));
  }
}
