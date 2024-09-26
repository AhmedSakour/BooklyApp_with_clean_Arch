import 'package:bookly_clean_arch/Features/home/Domain/use_case/fetch_featuredBook_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/bookly_entity.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.featuredBooksUseCase) : super(FeaturedBookInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBookLoading());
    } else {
      emit(FeaturedBookPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold(
        (l) => pageNumber == 0
            ? emit(FeaturedBookFailure(l.erroMessage))
            : emit(FeaturedBookPaginationFailure(l.erroMessage)),
        (r) => emit(FeaturedBookSuccess(r)));
  }
}
