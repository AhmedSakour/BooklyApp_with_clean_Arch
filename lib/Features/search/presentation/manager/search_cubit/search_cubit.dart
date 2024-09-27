import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/Features/search/Domain/use_case/fetch_search_result_use_case.dart';
import 'package:bookly_clean_arch/core/entities/bookly_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fethcSearchResultUseCase) : super(SearchInitial());
  final FethcSearchResultUseCase fethcSearchResultUseCase;
  Future<void> fetchSearchResult(
      {required String searchInput, int pageNumber = 0}) async {
    emit(SearchLoading());
    var data = await fethcSearchResultUseCase.call(searchInput, pageNumber);
    data.fold((l) => emit(SearchFailure(l.erroMessage)),
        (r) => emit(SearchSuccess(r)));
  }
}
